import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget{
  const OTPScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.chevron_left,
              color: Colors.white,),
            );
          }
        ),
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

              const Text("Please enter your SMS code",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0
                ),),

              const SizedBox(
                height: 25.0,
              ),



              Wrap(
                spacing: 8.5,
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)
                        ),
                        filled: true,
                        fillColor: Colors.white
                      ),
                      style: const TextStyle(
                        color: Colors.white,

                      ),
                      keyboardType: TextInputType.phone,
                    )
                  ),

                  SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)
                            ),
                            filled: true,
                            fillColor: Colors.white
                        ),
                        style: TextStyle(
                          color: Colors.white,

                        ),
                        keyboardType: TextInputType.phone,
                      )),

                  SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)
                            ),
                            filled: true,
                            fillColor: Colors.white
                        ),
                        style: TextStyle(
                          color: Colors.white,

                        ),
                        keyboardType: TextInputType.phone,
                      )),

                  SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)
                            ),
                            filled: true,
                            fillColor: Colors.white
                        ),
                        style: TextStyle(
                          color: Colors.white,

                        ),
                        keyboardType: TextInputType.phone,
                      )),

                  SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)
                            ),
                            filled: true,
                            fillColor: Colors.white
                        ),
                        style: TextStyle(
                          color: Colors.white,

                        ),
                        keyboardType: TextInputType.phone,
                      )),

                  SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)
                            ),
                            filled: true,
                            fillColor: Colors.white
                        ),
                        style: TextStyle(
                          color: Colors.white,

                        ),
                        keyboardType: TextInputType.phone,
                      )),
                ]
              ),

              const SizedBox(
                height: 10.0,
              ),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
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


