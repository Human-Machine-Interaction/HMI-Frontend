import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'exercise.dart';
import 'action.dart';
import 'constraint.dart';

final squat = Exercise(
    name: 'Squat',
    requiredReps: 2,
    actions: [
      const Action(
        constraints: [
          Constraint(
            joint: PoseLandmarkType.leftHip,
            p1: PoseLandmarkType.leftKnee,
            p2: PoseLandmarkType.leftShoulder,
            targetAngle: 180,
            tolerance: 30,
            message: 'Keep your upper body straight',
          ),
          Constraint(
            joint: PoseLandmarkType.rightHip,
            p1: PoseLandmarkType.rightKnee,
            p2: PoseLandmarkType.rightShoulder,
            targetAngle: 180,
            tolerance: 30,
            message: 'Keep your upper body straight',
          ),
          Constraint(
            joint: PoseLandmarkType.leftKnee,
            p1: PoseLandmarkType.leftAnkle,
            p2: PoseLandmarkType.leftHip,
            targetAngle: 180,
            message: 'Keep your left leg straight',
          ),
          Constraint(
            joint: PoseLandmarkType.rightKnee,
            p1: PoseLandmarkType.rightAnkle,
            p2: PoseLandmarkType.rightHip,
            targetAngle: 180,
            message: 'Keep your right leg straight',
          ),
        ],
        holdTime: Duration(seconds: 3),
      ),
      const Action(
        constraints: [
          Constraint(
            joint: PoseLandmarkType.leftHip,
            p1: PoseLandmarkType.leftKnee,
            p2: PoseLandmarkType.leftShoulder,
            targetAngle: 120,
            tolerance: 30,
            message: 'Squat down, bend your hips',
          ),
          Constraint(
            joint: PoseLandmarkType.rightHip,
            p1: PoseLandmarkType.rightKnee,
            p2: PoseLandmarkType.rightShoulder,
            targetAngle: 120,
            tolerance: 30,
            message: 'Squat down, bend your hips',
          ),
          Constraint(
            joint: PoseLandmarkType.leftKnee,
            p1: PoseLandmarkType.leftAnkle,
            p2: PoseLandmarkType.leftHip,
            targetAngle: 90,
            message: 'Bend your knees more',
          ),
          Constraint(
            joint: PoseLandmarkType.rightKnee,
            p1: PoseLandmarkType.rightAnkle,
            p2: PoseLandmarkType.rightHip,
            targetAngle: 90,
            message: 'Bend your knees more',
          ),
        ],
        holdTime: Duration(seconds: 5)
      )
    ]
);