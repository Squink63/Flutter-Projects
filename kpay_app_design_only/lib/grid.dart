
import 'package:flutter/material.dart';

void main() {
  runApp( GirdViewWidget());
}

  class GirdViewWidget extends StatelessWidget {
     GirdViewWidget({super.key});
    final List<String> _list = List.generate(100, (index) => "Item $index");

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: Container(
                color: const Color.fromRGBO(64, 170, 119, 1.0),
                child: Column(
                  children: [
                    const Text("SunFlower",
                    style: TextStyle(
                      fontSize: 30
                    ),),
                    GridView.builder(
                      itemCount: _list.length,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 100,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8
                    ),
                        itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_list[index]))
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: index % 2 == 0 ? Colors.red : Colors.green,
                          child: Text(_list[index]),
                        ),
                      );
                        }),
                  ],
                ),
              ),
            ),
          )
        ),
      );
    }
  }


