import 'package:flutter/material.dart';

class AYAPayPartnerHomePage extends StatefulWidget {
  const AYAPayPartnerHomePage({super.key});

  @override
  State<AYAPayPartnerHomePage> createState() => _AYAPayPartnerHomePageState();
}

class _AYAPayPartnerHomePageState extends State<AYAPayPartnerHomePage> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.person,
                    size: 50,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("ABCDE",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  Spacer(),
                  Icon(Icons.notifications,
                    size: 40,
                  )
                ],
              ),

              Container(
                padding: EdgeInsets.only(right: 10,left: 10,top: 16,bottom: 50),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(148, 46, 43, 1.0),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Balance",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      children: [
                        Text(isVisible ? "1,827,273,277" : "**********",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w500
                          ),
                        ),

                        SizedBox(
                          width: 4,
                        ),

                        Text("MMK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500
                          ),
                        ),

                        Spacer(),

                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(isVisible ?Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 16,),

              Image.asset("assets/images/app_home.png")
            ],
          ),
        ),
      ),
    );
  }
}
