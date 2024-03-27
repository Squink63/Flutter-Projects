import 'package:flutter/material.dart';

import '../main.dart';

class ForgetPinPage extends StatelessWidget {
  const ForgetPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text("Face Verification",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              FaceVerificationSteps(step: '1', task: 'Position your face within\nthis frame',),
              SizedBox(height: 12,),
              FaceVerificationSteps(step: '2', task: 'Blink your eyes',),
              SizedBox(height: 12,),
              FaceVerificationSteps(step: '3', task: 'Shake your head',),
              SizedBox(height: 12,),

            ],
          ),
        ),
      ),
    );
  }
}

class FaceVerificationSteps extends StatelessWidget {
  final String step;
  final String task;
  const FaceVerificationSteps({super.key, required this.step, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset("${kImage}face.jpeg",
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Step $step",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(task,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

