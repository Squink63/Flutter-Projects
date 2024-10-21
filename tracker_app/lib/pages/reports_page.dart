import 'package:api_app/data/model/tracker_model.dart';
import 'package:api_app/data/vos/transaction_vo.dart';
import 'package:api_app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {

  Map<String, double> etMap = {
    
  };

  Map<String, double> itMap = {
    
  };

  final TrackerModel _model = TrackerModel();

  String selectedText = "Expenses";
  String bd = "";

  List<TransactionVO> allTransactions = [];
  List<TransactionVO> expenseTransactions = [];
  List<TransactionVO> incomeTransactions = [];
  List<TransactionVO> expenseTransactionsByDate = [];
  List<TransactionVO> incomeTransactionsByDate = [];
  String totalIncome = "0";
  String totalExpanses = "0";
  String balance = "0";
  List<int> expensesAmountList = [];
  DateTime? selectedDate;
  

   @override
  void initState() {
    List<TransactionVO> transactionsFromDatabase = _model.getTransactionsFromDatabase();
    setState(() {
      allTransactions = transactionsFromDatabase;
      expenseTransactions = transactionsFromDatabase.where((t) => t.type == "Expenses").toList();
      incomeTransactions = transactionsFromDatabase.where((t) => t.type == "Income").toList();

      calculate();
   
    });
    super.initState();
  }

   void calculate() {

    if(selectedDate == null) {
      expenseTransactionsByDate = expenseTransactions.where((t) => t.date == "${DateTime.now().toLocal()}".split(' ')[0]).toList();
     
      incomeTransactionsByDate = incomeTransactions.where((t) => t.date == "${DateTime.now().toLocal()}".split(' ')[0]).toList();
    } else {
      expenseTransactionsByDate = expenseTransactions.where((t) => t.date == "${selectedDate?.toLocal()}".split(' ')[0]).toList();
     
      incomeTransactionsByDate = incomeTransactions.where((t) => t.date == "${selectedDate?.toLocal()}".split(' ')[0]).toList();
    }
     
     
     expensesAmountList = expenseTransactionsByDate.map((t) => int.parse(t.amount)).toList();
     if (expenseTransactionsByDate.isEmpty) {
       totalExpanses = "0";
     } else {
       totalExpanses = expensesAmountList.reduce((first, second) => first + second).toString();
     
       for(var et in expenseTransactionsByDate) {
       if (etMap.containsKey(et.category)) {
       etMap[et.category] = etMap[et.category]! + double.parse(et.amount);
       } else {
         etMap[et.category] = double.parse(et.amount);
       }
     }
     }
     
     if (incomeTransactionsByDate.isEmpty) {
       totalIncome = "0";
     } else {
       totalIncome = incomeTransactionsByDate.map((t) => int.parse(t.amount)).toList().reduce((first, second) => first + second).toString();
     
       for(var it in incomeTransactionsByDate) {
       if (itMap.containsKey(it.category)) {
       itMap[it.category] = itMap[it.category]! + double.parse(it.amount);
       } else {
         itMap[it.category] = double.parse(it.amount);
       }
     }
     }
     
     
     
     balance = (int.parse(totalIncome) - int.parse(totalExpanses)).toString();
   }

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

        calculate();

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: InkWell(
          onTap: (){
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(balance)));
          },
          child: Icon(Icons.safety_check),
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: () => _selectDate(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Text(
                (selectedDate == null)
                ? "${DateTime.now().toLocal()}".split(' ')[0]
                : "${selectedDate?.toLocal()}".split(' ')[0],
                style: TextStyle(
                  color: Colors.white
                ),
              ),
          
              Icon(Icons.keyboard_arrow_down, color: Colors.white,)
            ],
          ),
        )
      ),
      body: Stack(
        children: [

        

          SingleChildScrollView(
            child: (selectedText == "Expenses" && expenseTransactionsByDate.isNotEmpty)
            ? ExpenseReportView(
              dataMap: etMap,
               colorList: [],
                totalExpanses: totalExpanses,)
            : (selectedText == "Income" && incomeTransactionsByDate.isNotEmpty)
            ? IncomeReportView(dataMap: itMap, colorList: [], totalIncome: totalIncome,) 
            : SizedBox(
              height: 500,
              child: Center(
                  child: Text(
                    "There is no data to generate report."
                  ),
                ),
            )
          ),

          

          Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            // height: 100,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
            color: Colors.white,
            child: ReportSelectionView(
              selectedText: selectedText,
               onTapSelection: (text) {
                setState(() {
                  selectedText = text;
                  
                });
               }
            ),
          ),
        ),
        ]
      ),
    );
  }
}

class ExpenseReportView extends StatelessWidget {
  final String totalExpanses;
  const ExpenseReportView({
    super.key,
    required this.dataMap,
    required this.colorList, required this.totalExpanses,
  });

  final Map<String, double> dataMap;
  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
      
          Row(
            children: [
              Text(
                "Expenses",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
      
                
              ),
      
              Spacer(),
      
              Text(
                "${NumberFormat("#,###").format(int.parse(totalExpanses))} Ks",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),

          Divider(),

          SizedBox(height: 16,),
      
          Center(
            child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width,
                
                initialAngleInDegree: 0,
                chartType: ChartType.values.first,
                ringStrokeWidth: 32,
                // centerText: "HYBRID",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.rectangle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 0,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
          ),
        ],
      ),
    );
  }
}

class IncomeReportView extends StatelessWidget {
  final String totalIncome;
  const IncomeReportView({
    super.key,
    required this.dataMap,
    required this.colorList, required this.totalIncome,
  });

  final Map<String, double> dataMap;
  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
      
          Row(
            children: [
              Text(
                "Income",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
      
                
              ),
      
              Spacer(),
      
              Text(
                "${NumberFormat("#,###").format(int.parse(totalIncome))} Ks",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),

          Divider(),

          SizedBox(height: 16,),
      
          Center(
            child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                // centerText: "HYBRID",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.rectangle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 0,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
          ),
        ],
      ),
    );
  }
}

class ReportSelectionView extends StatelessWidget {
  final String selectedText;
  final Function(String) onTapSelection;
  const ReportSelectionView({super.key, required this.selectedText, required this.onTapSelection});


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
            child: ReportSelectionButtonView(
              isSelected: selectedText == "Expenses",
              selectedColor: (selectedText == "Expenses") ? Colors.red : Color.fromARGB(255, 220, 220, 220),
              label: "Expenses",
              onTapButton: (){
                onTapSelection("Expenses");
              },
              
            ),
          ),
    
          Expanded(
            child: ReportSelectionButtonView(
              isSelected: selectedText == "Income",
              selectedColor: (selectedText == "Income") ? Colors.green : Color.fromARGB(255, 220, 220, 220),
              label: "Income",
              onTapButton: (){
                onTapSelection("Income");
              },
              
            ),
          ),
        ],
      ),
    );
  }
}

class ReportSelectionButtonView extends StatelessWidget {
  final bool isSelected;
  final Color selectedColor;
  final String label;
  final Function onTapButton;
  const ReportSelectionButtonView({super.key, required this.isSelected, required this.label, required this.onTapButton, required this.selectedColor});

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