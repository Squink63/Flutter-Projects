import 'package:flutter/material.dart';
import 'package:test_one/data/my_profilfe.dart';
import 'package:test_one/my_profile/next_to_my_profile_page.dart';
import 'package:test_one/set_photo_page.dart';

import '../main.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 247, 1.0),
      appBar: AppBar(
        backgroundColor: kPrimaryKPayColor,
        centerTitle: true,
        title: Text("My Profile",
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyProfileItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyProfileItems extends StatelessWidget {
  const MyProfileItems({
    super.key,
  });


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
            MyProfile item = myProfile[index];
            return GestureDetector(
              onTap: (){
                if(index == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SetPhotoPage()));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NextToMyProfilePage(
                        index: index,
                        profile: item,
                      )));
                }
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 12,),
                      Text(item.label,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),
                      ),
                      Spacer(),
                      item.endWidget
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
