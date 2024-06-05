

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';
import 'package:the_library_app/list_items/shelf_list_item_view.dart';
import 'package:the_library_app/pages/create_shelf_page.dart';
import 'package:the_library_app/pages/shelf_details_page.dart';
import 'package:the_library_app/utils/colors.dart';
import 'package:the_library_app/utils/dimens.dart';

class YourShelvesTabView extends StatelessWidget {
  const YourShelvesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: kMargin100),
          itemCount: shelfList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShelfDetailsPage()));
              },
              child: Column(
                children: [

                  SizedBox(
                    height: kMarginMedium2,
                  ),

                  ShelfListItemView(shelf: shelfList[index],),

                  Divider(
                    color: kBlankColor,
                    height: 0.2,
                  )
                ],
              ),
            );
          }),

      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kMargin50)
        ),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateShelfPage()));
        },
        icon: Icon(Icons.edit),
        label: Text('Create new'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class EmptyShelfView extends StatelessWidget {
  const EmptyShelfView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.library_books,
            size: 100,
          ),

          SizedBox(height: 15,),

          Text("No Shelves",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),

          SizedBox(height: 10,),

          Text("Create shelves to match the way\nyou think.",
            style: TextStyle(
                color: kSecondaryTextColor,

            ),
          ),

        ],
      ),
    );
  }
}
