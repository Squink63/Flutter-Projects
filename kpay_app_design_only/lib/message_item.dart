

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_one/main.dart';

class MessageItem extends StatelessWidget {
  final int index;
  const MessageItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    index.isEven ? "assets/images/animal.png" : "assets/images/jj_express.png" ,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(
                  width: 16,
                ),
                Text(index.isEven ? "Najfjnsfnsjnjf" : "JJ Express",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),

                SizedBox(
                  width: 12,
                ),

                Icon(Icons.notifications_off,
                  color: Colors.grey,
                ),

                Spacer(),

                Icon(Icons.more_vert,
                  color: Colors.grey,
                )
              ],
            ),
          ),

          SizedBox(
            height: 12,
          ),

          Image.asset(
              index.isEven ? "assets/images/image.png" : "assets/images/post.jpeg",
            width: double.infinity,
            height: 150,
          ),

          SizedBox(
            height: 8,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text( index.isEven ? "As A Man Thinketh | အပိုင်း (၃)" : "Yangon To Mandalay",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),

          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ReactionView(),
          )
        ],
      ),
    );
  }
}

class ReactionView extends StatefulWidget {
  const ReactionView({super.key});

  @override
  State<ReactionView> createState() => _ReactionViewState();
}

class _ReactionViewState extends State<ReactionView> {
  bool onTapLike = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("13 min(s) ago",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),

        Spacer(),
        SizedBox(
          width: 80,
          child: ListTile(
            onTap: (){
              setState(() {
                onTapLike = !onTapLike;
              });
            },
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(onTapLike ? "assets/images/like.png" : "assets/images/like_filled.png",
              width: 20,
              height: 20,
              color: onTapLike ? Colors.grey : kPrimaryKPayColor,
            ),
            title: Text("Like"),
            titleTextStyle: TextStyle(
              color: Colors.grey,

            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: ListTile(
            onTap: (){},
            contentPadding: EdgeInsets.zero,
            leading: Image.asset("assets/images/speech-bubble.png",
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            title: Text("Message"),
            titleTextStyle: TextStyle(
              color: Colors.grey,

            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: ListTile(
            onTap: (){
              showCustomBottomSheet(context);
            },
            contentPadding: EdgeInsets.zero,
            leading: Image.asset("assets/images/social.png",
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            title: Text("Share"),
            titleTextStyle: TextStyle(
              color: Colors.grey,

            ),
          ),
        ),


      ],
    );
  }
}

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.6,
          child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 245, 247, 1.0),
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                children: [
                  SizedBox(height: 80,),
                  GridView.builder(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 35,
                        mainAxisExtent: 110,
                        crossAxisSpacing: 20
                      ),
                      itemBuilder: (context,index){
                        return ShareItem(index: index);
                      },
                    itemCount: 5,
                      ),
                  Spacer(),
                  Text("Cancel",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                  )
                ],
              )
          ),
        );
      });
}

class ShareItem extends StatelessWidget {
  final int index;
  ShareItem({super.key, required this.index});

  final List<String> shareLabel =["Share to Friends", "Share", "Refresh", "Open with\nBrowser", "Copy Url"];
  final List<IconData> shareIcon = [Icons.share, Icons.file_upload, Icons.refresh, Icons.open_in_browser, Icons.copy];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(shareIcon[index],
              size: 20,
              color: kPrimaryKPayColor,
            ),
          ),
          SizedBox(height: 12,),
          Text(shareLabel[index],
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}


