import 'package:flutter/material.dart';
import 'package:test_one/pages/Go.dart';
import 'package:test_one/pages/set_photo_page.dart';
import '../utils/constants.dart';
import 'package:test_one/myPage/my_profile_page.dart';

class KPayMyPage extends StatelessWidget {
   const KPayMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text("My",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20,bottom: 30),
                color: kPrimaryKPayColor,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.white,width: 2)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SetPhotoPage()));
                          },
                          child: Image.asset("assets/images/animal.png",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfilePage()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ABCDEFGF",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Icon(Icons.phone_android,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6,),
                              Text("09*******79",
                                style: TextStyle(
                                  color: Colors.white38
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyItems(),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text("Log Out",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),
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

class MyItems extends StatelessWidget {
  MyItems({
    super.key,
  });

  final List<String> myLabels =["Nearby", "Coupons", "Pattern Management", "PIN Management", "Change Phone Number", "Choose Language", "Limits & Fee", "Tutorials", "Help & Feedback", "About KBZPay", "Share App", "Settings"];
  final List<IconData> myIcons =[Icons.location_on, Icons.pattern, Icons.percent,Icons.lock, Icons.phone_locked, Icons.text_format, Icons.shield, Icons.book, Icons.question_mark, Icons.star, Icons.share, Icons.settings ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListView.builder(
        itemCount: 12,
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => NextPage(title: myLabels[index], bodyIndex: index,)));
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(myIcons[index],
                        color: kPrimaryKPayColor,
                      ),
                      SizedBox(width: 12,),
                      Text(myLabels[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right,
                        size: 30,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Divider(),
                  SizedBox(height: 8,)
                ],
              ),
            );
          }),
    );
  }
}
