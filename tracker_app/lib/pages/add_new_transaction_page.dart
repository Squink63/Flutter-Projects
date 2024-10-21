
import 'package:api_app/data/model/tracker_model.dart';
import 'package:api_app/data/vos/category_vo.dart';
import 'package:api_app/data/vos/transaction_vo.dart';
import 'package:api_app/pages/account_page.dart';
import 'package:api_app/pages/home_page.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:api_app/pages/new_category_page.dart';
import 'package:api_app/pages/select_category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewTransactionPage extends StatefulWidget {
  const AddNewTransactionPage({super.key});

  @override
  State<AddNewTransactionPage> createState() => _AddNewTransactionPageState();
}

class _AddNewTransactionPageState extends State<AddNewTransactionPage> {

  final TrackerModel _model = TrackerModel();

DateTime? selectedDate;
TextEditingController categoryController = TextEditingController();
TextEditingController amountController = TextEditingController();
TextEditingController noteController = TextEditingController();
CategoryVO? categoryToShow;

  // Method to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Default date
      firstDate: DateTime(2000), // Earliest date
      lastDate: DateTime(2101),  // Latest date
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "New Transaction",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        // actions: [
        //   InkWell(
        //     onTap: (){
        //     //   Navigator.pop(context);
        //     },
        //     // child: Icon(Icons.check, color: Colors.white,)
        //     )
        // ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6)
            ),
            child: TextField(
              controller: categoryController,
              onTap: () async {
                final selectedCategory = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectCategoryPage(),
                  ),
                );
                if (selectedCategory != null) {
                  setState(() {
                    categoryToShow = selectedCategory;
                    categoryController.text = selectedCategory.categoryName;
                  });
                }
              },
              readOnly: true,
              decoration: InputDecoration(
              
              hintText: "Category",
              border: InputBorder.none,
              prefixIcon: CategoryIcon(),
            
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6)
            ),
            child: TextField(
              controller: noteController,
              decoration: InputDecoration(
              
              hintText: "Note",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.note),
            
              ),
            ),
          ),

          SizedBox(
            height: 16,
          ),
 

          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6)
            ),
            child: Row(
              children: [
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Icon(Icons.calendar_month)),
                  SizedBox(width: 10,),
                Text(
                  selectedDate == null
                  ? 'No date selected'
                  : "${selectedDate?.toLocal()}".split(' ')[0],
                  style: TextStyle(

                  ),
                  ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.all(16),
            height: 80,
            child: TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                hintText: "Amount",
                prefixIcon: Icon(Icons.currency_exchange)
              ),
            ),
          )


        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: (){
          if (amountController.text.isNotEmpty) {
            setState(() {
              TransactionVO transactionToSave = TransactionVO(
                category: categoryToShow?.categoryName ?? "",
                 note: noteController.text,
                  date: "${selectedDate?.toLocal()}".split(' ')[0],
                   amount: amountController.text,
                    type: categoryToShow!.categoryType );
              transactionaToShow.add(transactionToSave);
              _model.saveTransactionToDatabase(transactionToSave);
              
              }
            );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
               (route) =>false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Amount is Required")));
          }
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
    );
  }
}