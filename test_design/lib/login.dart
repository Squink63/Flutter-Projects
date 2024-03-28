import 'package:flutter/material.dart';
import 'package:test_one/otp.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 56, 109, 1.0),
      ),

      body: Container(
        padding: const EdgeInsets.all(25.0),
        color: const Color.fromRGBO(35, 56, 109, 1.0),
        child:  Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Image.asset("assets/images/logo.png",
                width: 150.0,),
              ),

              const SizedBox(
                height: 15.0,
              ),

              const Text("Log-in with your Phone number",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22.0
              ),),

              const SizedBox(
                height: 25.0,
              ),



               SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,

                  ),
                  keyboardType: TextInputType.phone,
                )),

              const SizedBox(
                height: 10.0,
              ),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OTPScreen()));
                  },
                  style: ElevatedButton.styleFrom(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)
                      )
                  ),
                  child: const Text("Next",
                    style: TextStyle(
                      color: Color.fromRGBO(35, 56, 109, 1.0),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15.0,
              ),

              Row(
                children: [
                  Checkbox(value: true, onChanged: (bool? value) {  },
                  checkColor: Colors.black,),

                  const Text("By continuing, I agree to the Terms of Service",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.0
                  ),)
                ],
              )
            ],
          ),
        ),

      ),
    );
  }

}


