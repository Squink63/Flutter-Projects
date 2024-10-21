
import 'package:api_app/data/model/tracker_model.dart';
import 'package:api_app/data/vos/category_vo.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class SelectCategoryPage extends StatelessWidget {
  const SelectCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.cancel_outlined, color: Colors.white,),
        ),
        centerTitle: true,
        title: Text(
          "Select Category",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
            //   Navigator.pop(context);
            },
            child: Icon(Icons.check, color: Colors.white,)
            )
        ],
      ),

      body: SelectCategoryBodyView(),
    );
  }
}

class SelectCategoryBodyView extends StatefulWidget {
  const SelectCategoryBodyView({super.key});

  @override
  State<SelectCategoryBodyView> createState() => _SelectCategoryBodyViewState();
}

class _SelectCategoryBodyViewState extends State<SelectCategoryBodyView> {

  final TrackerModel _model = TrackerModel();

  String selectedText = "Expenses";
  String bd = "";
  List<CategoryVO> allCategories = [];
  List<CategoryVO> categoriesByType = [];

  @override
  void initState() {
    List<CategoryVO> categoriesFromDatabase = _model.getCategoriesFromDatabase();
    setState(() {
      allCategories = categoriesFromDatabase;
      categoriesByType = categoriesFromDatabase.where((category) => category.categoryType == selectedText).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          margin: EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Divider(),

                SizedBox(height: 12,),

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 80,
                    mainAxisSpacing: 20,
                    childAspectRatio: 20
                    ),
                    itemCount: categoriesByType.length,
                   itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pop(context, categoriesByType[index]);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            // padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.pink
                            ),
                            child: Icon(
                              Icons.face
                            ),
                            
                          ),
                      
                          Text(categoriesByType[index].categoryName)
                        ],
                      ),
                    );
                   })


              ],
            ),
          ),
        ),

        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            // height: 100,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.white,
            child: SelectionView(
              selectedText: selectedText,
               onTapSelection: (text) {
                setState(() {
                  selectedText = text;
                  categoriesByType = allCategories.where((category) => category.categoryType == selectedText).toList();

                  if(text == "Expenses") {
                    bd = "This is Expenses";
                  } else if (text == "Income") {
                    bd = "This is Income";
                  } else {
                    bd = "This is Savings";
                  }
                });
               }
            ),
          ),
        ),

      ],
    );
  }
}

class SelectionView extends StatelessWidget {
  final String selectedText;
  final Function(String) onTapSelection;
  const SelectionView({super.key, required this.selectedText, required this.onTapSelection});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 220, 220, 220),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Expanded(
            child: SelectionButtonView(
              isSelected: selectedText == "Expenses",
              selectedColor: (selectedText == "Expenses") ? Colors.red : Color.fromARGB(255, 220, 220, 220),
              label: "Expenses",
              onTapButton: (){
                onTapSelection("Expenses");
              },
              
            ),
          ),

          Expanded(
            child: SelectionButtonView(
              isSelected: selectedText == "Income",
              selectedColor: (selectedText == "Income") ? Colors.green : Color.fromARGB(255, 220, 220, 220),
              label: "Income",
              onTapButton: (){
                onTapSelection("Income");
              },
              
            ),
          ),

          Expanded(
            child: SelectionButtonView(
              isSelected: selectedText == "Savings",
              selectedColor: (selectedText == "Savings") ? kPrimaryColor : Color.fromARGB(255, 220, 220, 220),
              label: "Savings",
              onTapButton: (){
                onTapSelection("Savings");
              },
              
            ),
          )
        ],
      ),
    );
  }
}

class SelectionButtonView extends StatelessWidget {
  final bool isSelected;
  final Color selectedColor;
  final String label;
  final Function onTapButton;
  const SelectionButtonView({super.key, required this.isSelected, required this.label, required this.onTapButton, required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapButton();
      },
      child: Container(
        height: 40,
        // padding: EdgeInsets.all( 8),
        decoration: BoxDecoration(
          color: selectedColor,
          borderRadius: BorderRadius.circular(20)
        ),
      
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (isSelected) ? Colors.white : kPrimaryColor
            ),
          ),
        ),
      ),
    );
  }
}