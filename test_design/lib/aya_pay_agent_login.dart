import 'package:flutter/material.dart';
import 'package:test_one/aya_pay_agent_home.dart';
import 'package:test_one/aya_pay_partner_main.dart';

import 'aya_pay_partner_home_page.dart';

class AYAPayAgentLogin extends StatelessWidget {
  const AYAPayAgentLogin({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        body: SafeArea(
          child: Column(
            children: [

              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("MY"),
                    Switch(
                        value: true,
                        onChanged: ArgumentError.value,
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.red,
                      thumbColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    Text("EN"),

                    SizedBox(
                      width: 16,
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset("assets/images/aya_logo.png",
                  width: 100,
                  height: 100,
                ),
              ),

              Text("AYAPay Partner",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "User ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)
                      )
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)
                        )
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Pin",
                        suffixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)
                        )
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                width: double.infinity,
                child: Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AYAPayPartnerMainPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                      child: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    );
                  }
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Image.asset("assets/images/fingerprint.png",
                width: 50,
                height: 50,
              ),

              SizedBox(
                height: 30,
              ),

              Text("Forget PIN?",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
