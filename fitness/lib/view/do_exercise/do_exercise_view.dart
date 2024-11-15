import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class DoExerciseView extends StatefulWidget {
  const DoExerciseView({super.key});

  @override
  State createState() => _DoExerciseViewState();
}

class _DoExerciseViewState extends State {
  CameraController? controller;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future initCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras.isEmpty) return;

      controller = CameraController(
        cameras[0],
        ResolutionPreset.max,  // Sử dụng độ phân giải tối đa
        enableAudio: false,
      );

      await controller!.initialize();

      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      _showCameraException(e);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Camera'),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: Stack(
        children: [
          Transform.scale(
            scale: 2 / controller!.value.aspectRatio,
            child: Center(
              child: CameraPreview(controller!),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.switch_camera, color: Colors.white, size: 30),
                    onPressed: cameras.length > 1
                        ? () {
                      onNewCameraSelected(
                        cameras[controller!.description == cameras[0] ? 1 : 0],
                      );
                    }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }

    controller = CameraController(
      cameraDescription,
      ResolutionPreset.max,  // Sử dụng độ phân giải tối đa
      enableAudio: false,
    );

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _showCameraException(CameraException e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.code}\n${e.description}')),
    );
  }
}