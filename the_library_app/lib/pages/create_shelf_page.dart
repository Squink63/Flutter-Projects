
import 'package:flutter/material.dart';
import 'package:the_library_app/utils/colors.dart';

import '../data/vos/shelf_vo.dart';
import '../utils/dimens.dart';

class CreateShelfPage extends StatefulWidget {
  const CreateShelfPage({super.key});

  @override
  State<CreateShelfPage> createState() => _CreateShelfPageState();
}

class _CreateShelfPageState extends State<CreateShelfPage> {

  ShelfVO createdShelf = ShelfVO();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        scrolledUnderElevation: 0,
        leading: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor,
              ),
            ),
            Text(
              "Library",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kTextRegular2x
              ),

            ),
          ],
        ),
        leadingWidth: kMargin100,
        title: Text(
          "Create shelf",
          style:
          TextStyle(color: Colors.white,),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              height: kMarginXLarge,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium3),
              child: TextField(
                maxLength: 50,
                autofocus: true,
                cursorColor: kPrimaryColor,
                cursorHeight: kMargin40,
                style: TextStyle(
                  fontSize: kTextRegular22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  focusColor: kPrimaryColor,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)
                  ),
                  hintText: "Shelf name",
                  hintStyle: TextStyle(
                      fontSize: kTextRegular3x,
                      color: kSecondaryTextColor
                  ),
                  helperStyle: TextStyle(
                    fontSize: kTextRegular2x,
                    color: kSecondaryTextColor
                  )
                ),
                onSubmitted: (text){
                  if (text.isNotEmpty){
                    setState(() {
                      createdShelf.shelfName = text;
                      shelfList.add(createdShelf);
                    });
                    Navigator.pop(context);
                  }
                },

              ),
            ),

            SizedBox(
              height: kMarginMedium2,
            ),

            Divider(
              color: kBlankColor,
              height: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
