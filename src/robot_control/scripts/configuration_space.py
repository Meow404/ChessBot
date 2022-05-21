#!/usr/bin/env python3

import rospy
from arduino_control.msg import servo
from robot_control.srv import RobotServoConfigure, RobotServoConfigureResponse
import heapq as heap
import math 

s_base_angle = 0
s_left_angle = 0
s_right_angle = 0

t_base_angle = 0
t_left_angle = 0
t_right_angle = 0

pub = rospy.Publisher('servo', servo, queue_size=20)

class node:
    def __init__(self):
        self.f = 999999
        self.g = 999999
        self.h = 999999
        self.type = 0
        self.parent = (-1, -1, -1)

# (Type, Distance, Parent)
configuration_map = [[[node() for _ in range(61)] for _ in range(61)] for _ in range(61)]

path = []

def get_index_from_angle(angle):
    return 30 + angle

def get_angle_from_index(index):
    return -30 + index

def initialize_configuration_map(base_angle, left_angle, right_angle):
    global t_base_angle, t_left_angle, t_right_angle, configuration_map

    t_base_angle = base_angle
    t_left_angle = left_angle
    t_right_angle = right_angle

    t_base_index = get_index_from_angle(t_base_angle)
    t_right_index = get_index_from_angle(t_right_angle)
    t_left_index = get_index_from_angle(t_left_angle)

    for i in range(61):
        for j in range(61):
            for k in range(61):
                configuration_map[i][j][k].type = 0
                configuration_map[i][j][k].h = math.pow(math.pow(i-t_base_index, 2) + math.pow(j-t_right_index, 2) + math.pow(k-t_left_index, 2), 0.5)
    
    s_base_index = get_index_from_angle(s_base_angle)
    s_right_index = get_index_from_angle(s_right_angle)
    s_left_index = get_index_from_angle(s_left_angle)

    
    
    configuration_map[s_base_index][s_right_index][s_left_index].type = 2
    configuration_map[s_base_index][s_right_index][s_left_index].f = 0
    configuration_map[s_base_index][s_right_index][s_left_index].g = 0

    configuration_map[t_base_index][t_right_index][t_left_index].type = 3

def get_path():
    global path

    base_index = get_index_from_angle(s_base_angle)
    right_index = get_index_from_angle(s_right_angle)
    left_index = get_index_from_angle(s_left_angle)

    t_base_index = get_index_from_angle(t_base_angle)
    t_right_index = get_index_from_angle(t_right_angle)
    t_left_index = get_index_from_angle(t_left_angle)

    hp = []

    # print(configuration_map[base_index][right_index][left_index])

    heap.heappush(hp, (configuration_map[base_index][right_index][left_index].f, (base_index, right_index, left_index)))
    
    while True:
        
        min_f, index = heap.heappop(hp)
        base_index, right_index, left_index = index

        # print(min_dist, index)

        if min_f > 99999:
            break

        if base_index == t_base_index and right_index == t_right_index and t_left_index == left_index:
            break

        base_node = configuration_map[base_index][right_index][left_index] 

        # print("===============")
        for i in range(max(0, base_index-1), min(60, base_index+1)+1):
            if base_index != i and (configuration_map[i][right_index][left_index].type == 0 or configuration_map[i][right_index][left_index].type == 3):
                configuration_map[i][right_index][left_index].type = 1
                configuration_map[i][right_index][left_index].g = base_node.g + 1
                configuration_map[i][right_index][left_index].f = configuration_map[i][right_index][left_index].g + configuration_map[i][right_index][left_index].h
                configuration_map[i][right_index][left_index].parent = (base_index, right_index, left_index)
                # print(i, right_index, left_index, configuration_map[i][right_index][left_index])
                heap.heappush(hp, (configuration_map[i][right_index][left_index].f, (i, right_index, left_index)))
        
        for j in range(max(0, right_index-1), min(60, right_index+1)+1):
            if right_index != j and (configuration_map[base_index][j][left_index].type == 0 or configuration_map[base_index][j][left_index].type == 3):
                configuration_map[base_index][j][left_index].type = 1
                configuration_map[base_index][j][left_index].g = base_node.g + 1
                configuration_map[base_index][j][left_index].f = configuration_map[base_index][j][left_index].g + configuration_map[base_index][j][left_index].h
                configuration_map[base_index][j][left_index].parent = (base_index, right_index, left_index)
                # print(base_index, j, left_index, configuration_map[base_index][j][left_index])
                heap.heappush(hp, (configuration_map[base_index][j][left_index].f, (base_index, j, left_index)))
                        
        
        for k in range(max(0, left_index-1), min(60, left_index+1)+1):
            if k != left_index and (configuration_map[base_index][right_index][k].type == 0 or configuration_map[base_index][right_index][k].type == 3):
                configuration_map[base_index][right_index][k].type = 1
                configuration_map[base_index][right_index][k].g = base_node.g + 1
                configuration_map[base_index][right_index][k].f = configuration_map[base_index][right_index][k].g + configuration_map[base_index][right_index][k].h
                configuration_map[base_index][right_index][k].parent  = (base_index, right_index, left_index)
                # print(base_index, right_index, k, configuration_map[base_index][right_index][k])
                heap.heappush(hp, (configuration_map[base_index][right_index][k].f, (base_index, right_index, k)))
                        
                        
        
        # break

    index = (t_base_index, t_right_index, t_left_index)
    while True:
        path = [index] + path
        # print(path)

        if configuration_map[index[0]][index[1]][index[2]].type == 2:
            break
        
        # print(configuration_map[index[0]][index[1]][index[2]])
        index = configuration_map[index[0]][index[1]][index[2]].parent
    
    return path

def find_next_configuration():
    global path, s_base_angle, s_left_angle, s_right_angle

    if path:
        conf_index = path[0]
        path = path[1:]

        base_angle  = get_angle_from_index(conf_index[0])
        right_angle = get_angle_from_index(conf_index[1])
        left_angle = get_angle_from_index(conf_index[2])
        

        if base_angle != s_base_angle:
            s_base_angle = base_angle
            return 0, base_angle
        elif right_angle != s_right_angle:
            s_right_angle = right_angle
            return 1, right_angle
        elif left_angle != s_left_angle:
            s_left_angle = left_angle
            return 2, left_angle

def handle_new_config(req):

    print( " NEW CONFIGURATION RECIEVED : ", req)

    initialize_configuration_map(req.base_angle, req.right_angle, req.left_angle)
    print(get_path())

    rate = rospy.Rate(100)

    while path:
        value = find_next_configuration()
        if value:
            msg = servo()
            msg.motor_id, msg.angle = value
            
            # print(" Sending : ", value)
            pub.publish(msg)
        rate.sleep()

    return RobotServoConfigureResponse(True)

def run_configuration_manager():
    rospy.init_node('configuration_handler', anonymous=True)

    s = rospy.Service('new_configuraton', RobotServoConfigure, handle_new_config)
    rospy.spin()


if __name__ == '__main__':
    try:
        run_configuration_manager()
    except rospy.ROSInterruptException:
        pass