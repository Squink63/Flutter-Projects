// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
class SetPhotoPage extends StatelessWidget {
  const SetPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text(""
            "Set Photo",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.3),
          child: Image.asset("assets/images/animal.png",
            width: 100,
            height: 100,
          ),
        ),
      ),
      bottomSheet: BottomSheetView(),
    );
  }
}

class BottomSheetView extends StatefulWidget {
  const BottomSheetView({
    super.key,
  });

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  // late CameraController _cameraController;
  // late List<CameraDescription> cameras;

  // @override
  // void initState() {
  //   super.initState();
  //   initCamera();
  // }
  //
  // Future<void> initCamera() async {
  //   cameras = await availableCameras();
  //   // Choose the first camera in the list
  //   CameraController controller = CameraController(cameras[0], ResolutionPreset.medium);
  //   await controller.initialize();
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     // Assign the controller to a variable in the state
  //     _cameraController = controller;
  //   });
  // }
  //
  // void startCamera() {
  //   if (_cameraController != null) {
  //     _cameraController?.startImageStream((CameraImage image) {
  //       // Handle the camera image data here
  //     });
  //   }
  // }
  //
  // void stopCamera() {
  //   if (_cameraController != null) {
  //     _cameraController?.stopImageStream();
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   _cameraController?.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryKPayColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),

                )
              ),
              child: Text("Take a Photo",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                // if (_cameraController != null && !_cameraController.value.isStreamingImages) {
                //   startCamera();
                // } else {
                //   stopCamera();
                // }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),

                  )
              ),
              child: Text("Choose From Album",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
