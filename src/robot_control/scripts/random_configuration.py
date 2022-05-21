from robot_control.srv import RobotServoConfigure, RobotServoConfigureResponse
import rospy
import random

random.seed()


if __name__ == "__main__":
    rospy.wait_for_service('new_configuraton')

    while True:
        new_configuration = rospy.ServiceProxy('new_configuraton', RobotServoConfigure)
        base_angle = random.choice(range(-30, 31))
        right_angle = random.choice(range(-30, 31))
        left_angle = random.choice(range(-30, 31))
        print(base_angle, right_angle, left_angle)
        resp = new_configuration(base_angle, right_angle, left_angle)
        print("SUCCESS")
        # break