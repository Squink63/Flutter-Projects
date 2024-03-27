import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const FlowerWidget());
}

class FlowerWidget extends StatelessWidget {
  const FlowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(64, 170, 119, 1.0),
            centerTitle: true,
            title: const Text("Sunflower",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30
            ),),
            bottom: TabBar(
              indicatorColor: Colors.yellow,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Image.asset("assets/images/potted-plant.png",width: 25,height: 25,),
                  text: "My Garden",
                ),

                Tab(
                  icon: Image.asset("assets/images/tea-leaf.png",
                    width: 25,
                    height: 25,),
                  text: "Plant List",
                ),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            color: const Color.fromRGBO(64, 170, 119, 1.0),
            child: const Center(
              child: FlowerGird(),
            ),
          ),
        ),
      ),
    );
  }
}

class FlowerGird extends StatelessWidget {
  const FlowerGird({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30),
      itemBuilder: (context, index) {
        return FlowerItem(index: index,);
      },
      itemCount: 10,
    );
  }
}

class FlowerItem extends StatelessWidget {
  final int index;
  const FlowerItem({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20))
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
            child: Image.network(
              index.isEven ?
              "https://images.immediate.co.uk/production/volatile/sites/10/2018/02/3aa7e6ab-3dea-4440-8825-78ce8556fc6a-45fbc11.jpg?quality=90&resize=940,627" :
                  "https://images.saymedia-content.com/.image/t_share/MTc5OTUxNjcwNDE4MzUxMjI2/plant-mamas-care-tips-for-watermelon-peperomia.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 110,),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(

              child: Text("Sunflower"))
        ],
      ),
    );
  }
}
