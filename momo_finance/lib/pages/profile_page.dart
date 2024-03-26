import 'package:flutter/material.dart';
import 'package:momo_finance/pages/home_page.dart';
import 'package:momo_finance/pages/profile_option_1.dart';
import 'package:momo_finance/utils/colors.dart';
import 'package:momo_finance/utils/strings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomSheet: FractionallySizedBox(
        heightFactor: 0.6,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0,
                left: 0,
                top: -50,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePageOption1()));
                  },
                  child: Image.asset("$kImage/profile_image.png",
                    width: 100,
                    height: 100,
                  ),
                ),
              ),

              Positioned(
                top: 60,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text("Welcome, Khine!",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      ),
                    ),


                    SizedBox(
                      width: 150,
                      child: ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Yangon",
                          style: TextStyle(

                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Item(icon: Icons.contacts, label: "Registered Information")
                    ),

                    SizedBox(height: 10,),
                    Divider(),

                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Item(icon: Icons.send, label: "About MO MO Finance")
                    ),

                    SizedBox(height: 10,),
                    Divider(),

                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Item(icon: Icons.settings, label: "Setting")
                    ),

                    SizedBox(height: 10,),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
