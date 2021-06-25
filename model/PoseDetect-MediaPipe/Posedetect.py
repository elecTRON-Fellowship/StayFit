import mediapipe as mp
import cv2
import numpy as np

mp_drawing = mp.solutions.drawing_utils
mp_pose = mp.solutions.pose

cap = cv2.VideoCapture(0)
with mp_pose.Pose(min_detection_confidence = 0.6,min_tracking_confidence = 0.6) as pose:
    while cap.isOpened():
        ret,frame = cap.read()
        image = cv2.cvtColor(frame,cv2.COLOR_BGR2RGB) #converting image to RBG
        image.flags.writeable = False

        results = pose.process(image) #pose detection

        image.flags.writeable = True
        image = cv2.cvtColor(image,cv2.COLOR_RGB2BGR) #converting image back to BGR

        try:
            landmarks = results.pose_landmarks.landmark
            print(landmarks)
        except:
            pass

        mp_drawing.draw_landmarks(image,results.pose_landmarks,mp_pose.POSE_CONNECTIONS,
                                    mp_drawing.DrawingSpec(color=(245,117,66), thickness = 4,circle_radius = 5)
                                            )


        cv2.imshow("StayFit",image)

        if cv2.waitKey(10) & 0xFF == ord('q'):
            break

cap.release()
cv2.destroyAllWindows()
