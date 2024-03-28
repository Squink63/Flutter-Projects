import 'package:flutter/material.dart';


import '../utils/constants.dart';

class ChangePinPage extends StatelessWidget {
  const ChangePinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text("Change PIN",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ChangePinFunctions(label: 'Enter Old PIN',),
              Divider(),
              SizedBox(height: 8,),
              ChangePinFunctions(label: 'New PIN',),
              Divider(),
              SizedBox(height: 8,),
              ChangePinFunctions(label: 'Confirm New PIN',),
              Divider(),

              SizedBox(
                height: 60,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryKPayColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    )
                  ),
                  child: Text("Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePinFunctions extends StatefulWidget {
  final String label;
  const ChangePinFunctions({
    super.key, required this.label,
  });

  @override
  State<ChangePinFunctions> createState() => _ChangePinFunctionsState();
}

class _ChangePinFunctionsState extends State<ChangePinFunctions> {
  bool isShowed = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.verified_user_outlined,
          color: kPrimaryKPayColor,
        ),
        Spacer(),
        Text(widget.label,
          style: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontSize: 18,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: (){
            setState(() {
              isShowed = !isShowed;
            });
          },
          child: Icon(isShowed ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: kPrimaryKPayColor,
          ),
        )
      ],
    );
  }
}
