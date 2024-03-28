import 'package:flutter/material.dart';

class AYAPayPartnerDashboardPage extends StatelessWidget {
  const AYAPayPartnerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 28),
              height: 120,
              decoration: BoxDecoration(
                color: Color.fromRGBO(187, 43, 42, 1.0),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45))
              ),
              child: Align(
                alignment: Alignment.topCenter,
                  child: Text("Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  )),
            ),

            Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 90),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(Icons.wallet,
                      color: Color.fromRGBO(187, 43, 42, 1.0),
                      size: 30,
                    ),
                    SizedBox(width: 12,),

                    Text("Wallet Balance",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    Spacer(),

                    Text( "1,827,273,277",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),

                    SizedBox(
                      width: 4,
                    ),

                    Text("MMK",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
