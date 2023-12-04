import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
class BaseballPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports'),
        backgroundColor:Color(0xFFFFCBCB),
      ),
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
        ),
        ),
      child:Column(
        children: [
          Container(
            width: double.infinity,
            height: 340,
            decoration: BoxDecoration(
              color: Color(0xFFFFCBCB),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Baseball_3.png',
                  width: 250,
                  height: 240,
                ),
                SizedBox(height: 10),
                Text(
                  'Baseball',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 10),
                GFProgressBar(
                  percentage: 0.6,
                  lineHeight: 18,
                  width: 460,
                  alignment: MainAxisAlignment.center,
                  child: const Text(
                    '60%',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                  ),
                  leading: Icon(Icons.sports_baseball,color:Colors.brown,size: 30,),
                  backgroundColor: Colors.white,
                  progressBarColor: GFColors.SUCCESS,
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  '页面内容',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
        )
    );
  }
}