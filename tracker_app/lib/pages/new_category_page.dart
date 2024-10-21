

import 'package:api_app/data/model/tracker_model.dart';
import 'package:api_app/data/vos/category_vo.dart';
import 'package:api_app/pages/account_page.dart';
import 'package:api_app/pages/categories_page.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';

enum CategoryType { expenses, income, savings }

class NewCategoryPage extends StatefulWidget {
  const NewCategoryPage({super.key});

  @override
  State<NewCategoryPage> createState() => _NewCategoryPageState();
}

class _NewCategoryPageState extends State<NewCategoryPage> {

  // Model
  final TrackerModel _model = TrackerModel();

  CategoryType _character = CategoryType.expenses;


  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    String categoryType = "Expenses";

    // Convert CategoryType enum to string for display purposes
    switch (_character) {
      case CategoryType.expenses:
        setState(() {
          categoryType = "Expenses";
        });
        
        break;
      case CategoryType.income:
        setState(() {
          categoryType = "Income";
        });
        
        break;
      case CategoryType.savings:
        setState(() {
          categoryType = "Savings";
        });
        
        break;
    }

    CategoryVO categoryToSave = CategoryVO(categoryName: nameController.text, categoryType: categoryType);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 236, 236),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "New Category",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.check, color: Colors.white,)
            )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: (){
          if (nameController.text.isNotEmpty) {
            setState(() {
            _model.saveCategoryToDatabase(CategoryVO(categoryName: nameController.text, categoryType: categoryType));
            });
            Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CategoriesPage()),
            (Route<dynamic> route) => false, 
          );
          // Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Name Required")));
          }

          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(categoryToSave.categoryName)));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.65,
          height: 50,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [

            SizedBox(
              height: 6,
            ),

            Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                    
                    hintText: "Name",
                    border: InputBorder.none,
                    prefixIcon: CategoryIcon(),
                  
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Category Type"
                    ),
                  ),
                ),

                Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Expenses'),
                      leading: Radio<CategoryType>(
                        value: CategoryType.expenses,
                        groupValue: _character,
                        onChanged: (CategoryType? value) {
                          setState(() {
                            _character = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Income'),
                      leading: Radio<CategoryType>(
                        value: CategoryType.income,
                        groupValue: _character,
                        onChanged: (CategoryType? value) {
                          setState(() {
                            _character = value!;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: const Text('Savings'),
                      leading: Radio<CategoryType>(
                        value: CategoryType.savings,
                        groupValue: _character,
                        onChanged: (CategoryType? value) {
                          setState(() {
                            _character = value!;
                          });
                        },
                      ),
                    ),


                  ],
                )
          ],
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey
      ),
      child: Icon(
        Icons.face,
        size: 16,
      ),
      
    );
  }
}

