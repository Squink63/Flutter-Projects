import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfileList {

  Widget profilePhoto;

  String fullName;

  String mobileNo;

  String gender;

  Widget level;

  String idType;

  String idNumber;

  Widget dateOfBirth;

  IconData facePhoto;

  IconData myAddress;

  Widget employment;

  IconData deleteAccount;

  MyProfileList(
      this.profilePhoto,
      this.fullName,
      this.mobileNo,
      this.gender,
      this.level,
      this.idType,
      this.idNumber,
      this.dateOfBirth,
      this.facePhoto,
      this.myAddress,
      this.employment,
      this.deleteAccount);
}

class MyProfile {
  String label;

  Widget endWidget;

  MyProfile(this.label, this.endWidget);
}


List<MyProfile> myProfile = [
  MyProfile("Profile Photo", ProfilePhoto()),
  MyProfile("Full Name", TextView(text: 'ABCDEFG',)),
  MyProfile("Mobile No.", TextView(text: "*******9995")),
  MyProfile("Gender", TextView(text: "Male")),
  MyProfile("Level", Level()),
  MyProfile("ID Type", TextView(text: "NRC")),
  MyProfile("ID Number", TextView(text: "******585")),
  MyProfile("Date of Birth", DateOfBirth()),
  MyProfile("Face Photo and ID Card", Icon(Icons.chevron_right,
    size: 30,
    color: Colors.grey,
  )),
  MyProfile("My Address", Icon(Icons.chevron_right,
    size: 30,
    color: Colors.grey,
  )),
  MyProfile("Employment", Employment()),
  MyProfile("Delete Account", Icon(Icons.chevron_right,
    size: 30,
    color: Colors.grey,
  )),

];

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/animal.png",
          width: 50,
          height: 50,
        ),
        SizedBox(width: 8,),
        Icon(Icons.chevron_right,
          size: 30,
          color: Colors.grey,
        )
      ],
    );
  }
}

class Level extends StatelessWidget {
  const Level({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text("LV1.5",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

class TextView extends StatelessWidget {
  final String text;
  const TextView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400
      ),
    );
  }
}

class DateOfBirth extends StatelessWidget {
  const DateOfBirth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextView(text: "*****"),
        SizedBox(width: 6,),
        Icon(Icons.chevron_right,
          size: 30,
          color: Colors.grey,
        )
      ],
    );
  }
}

class Employment extends StatelessWidget {
  const Employment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextView(text: "Self Employment"),

        SizedBox(width: 6,),

        Icon(Icons.chevron_right,
          size: 30,
          color: Colors.grey,
        )
      ],
    );
  }
}




