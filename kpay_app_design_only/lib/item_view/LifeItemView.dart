import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';import 'package:test_one/utils/constants.dart';

import 'my_service_item.dart';


class Items extends StatefulWidget {
  final int listItemLabelIndex;
  const Items({
    super.key, required this.listItemLabelIndex,
  });

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final List<String> lifeItemLabelList = ["Mini Apps", "My Services", "Gift Card", "Recharge and Bill Payment", "Finance and Loan Services", "Other Services"];

  final List<int> gridItemCount = [4,6,6,4,3,11];
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(lifeItemLabelList[widget.listItemLabelIndex],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Visibility(
                visible: widget.listItemLabelIndex > 1,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                    child: Icon(Icons.keyboard_arrow_down)),
              )
            ],
          ),

          Visibility(
            visible: isVisible,
            child: SizedBox(
              height: 16,
            ),
          ),

          Visibility(
            visible: isVisible,
              child: GridViewItem(
                  gridItemCount: gridItemCount,
                  listItemLabelIndex: widget.listItemLabelIndex
              )
          ),

          Visibility(
            visible: isVisible,
            child: SizedBox(
              height: 16,
            ),
          ),

          Visibility(
            visible: widget.listItemLabelIndex == 0,
              child: RecentAppsView()
          )
        ],
      ),
    );
  }
}

/// Recent Apps View
class RecentAppsView extends StatelessWidget {
  const RecentAppsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(244, 245, 247, 1.0),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: kPrimaryKPayColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomRight: Radius.circular(8))
            ),
            child: Text("Recent",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset("assets/images/kpay_logo.png",
                          width: 55,
                          height: 55,
                        ),
                      ),

                      SizedBox(width: 16,)
                    ],
                  );
                },
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.gridItemCount,
    required this.listItemLabelIndex,
  });

  final List<int> gridItemCount;
  final int listItemLabelIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 10,
          mainAxisExtent: 80
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        return ListItemApp(listItemIconIndex: index, gridItemCount: gridItemCount, listItemLabelIndex: listItemLabelIndex,);
      },
      itemCount:gridItemCount[listItemLabelIndex],
    );
  }
}