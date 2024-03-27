import 'package:flutter/material.dart';

class ABankLoginPage extends StatelessWidget {
  const ABankLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.6],
                colors: [
                  Color.fromRGBO(4, 0, 95, 1.0),
                  Color.fromRGBO(85, 0, 127, 1.0)
                ]
            )
        ),

        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Text("Eng",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),

                    SizedBox(
                      width: 10,
                    ),

                    Text("Esp",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
                child: Row(
                  children: [
                    Image.asset("assets/images/a_bank_logo.png",
                      width: 100,
                      height: 100,
                    ),

                    Text("A bank",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 60
                      ),
                    )
                  ],
                ),
              ),

              Text("Username",
                style: TextStyle(
                  color: Colors.white
                ),
              ),

              TextField(

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Text("Password",
                style: TextStyle(
                    color: Colors.white
                ),
              ),

              TextField(

                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                  suffixIcon: Icon(Icons.password)
                ),
              ),

              Row(
                children: [
                  Checkbox(
                      value: false,
                      onChanged:(value) {

                  }),

                  Text("Remember me",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(85, 0, 127, 1.0),
                    ),
                    child: Text("Login with Account",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )),
              ),

              SizedBox(
                height: 90,
              ),


              Align(
                alignment: Alignment.bottomCenter,
                child: Text("Don't have account?",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Text("Signup Now!",
                  style: TextStyle(
                      color: Colors.orange
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
