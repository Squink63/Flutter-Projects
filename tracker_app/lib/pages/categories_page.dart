

import 'package:api_app/data/model/tracker_model.dart';
import 'package:api_app/data/vos/category_vo.dart';
import 'package:api_app/pages/account_page.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:api_app/pages/new_category_page.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  final bool? fromTransaction;
  const CategoriesPage({super.key, this.fromTransaction});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {

  // Model
  final TrackerModel _model = TrackerModel();
  List<CategoryVO> categoriesToShow = [];

  @override
  void initState() {
    List<CategoryVO> categoriesFromDatabase = _model.getCategoriesFromDatabase();
    setState(() {
      categoriesToShow = categoriesFromDatabase;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: GestureDetector(
          onTap: (){
            navigateToNext(context, MainPage());
          },
          child: Text(
            "Categories",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              navigateToNext(context, NewCategoryPage());
            },
            child: Icon(Icons.add, color: Colors.white,)
            )
        ],
      ),

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categoriesToShow.length,
        itemBuilder: (context, index) {
          CategoryVO category = categoriesToShow[index];
          return CategoryListItemView(
            icon: Icon(Icons.face),
             itemName: category.categoryName,
              onTapDelete: (){
                setState(() {
                  _model.deleteCategory(index);
                  categoriesToShow.removeAt(index);
                });
              });
        }
        ),
    );
  }
}

class CategoryListItemView extends StatelessWidget {
  final Widget icon;
  final String itemName;
  final Function onTapDelete;
  const CategoryListItemView({super.key, required this.icon, required this.itemName, required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 2),
      child: Row(
        children: [

          icon,
      
          SizedBox(
            width: 16,
          ),
      
          Text(
            itemName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),
          ),

          Spacer(),
      
          GestureDetector(
            onTap: (){
              onTapDelete();
            },
            child: Icon(Icons.delete, color: Colors.red,)
            )
      
          
        ],
      ),
    );
  }
}