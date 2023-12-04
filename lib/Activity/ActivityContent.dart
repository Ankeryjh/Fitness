import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:fithealth/Activity/Yagapage.dart';
import 'package:fithealth/Activity/Volleyballpage.dart';
import 'package:fithealth/Activity/Boxerpage.dart';

class ActivityContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Volleyballpage()),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Volleyball_10.png',
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 30.0),
                  // add some space between the image and the text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Volleyball',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          GFProgressBar(
                            percentage: 0.2,
                            lineHeight: 12,
                            width: 360,
                            alignment: MainAxisAlignment.start,
                            child: const Text(
                              '20%',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blueAccent),
                            ),
                            backgroundColor: Colors.white,
                            progressBarColor: GFColors.SUCCESS,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Yogapage()),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/fitgirl_14.png',
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 30.0),
                  // add some space between the image and the text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yoga',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          GFProgressBar(
                            percentage: 0.4,
                            lineHeight: 12,
                            width: 360,
                            alignment: MainAxisAlignment.start,
                            child: const Text(
                              '40%',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blueAccent),
                            ),
                            backgroundColor: Colors.white,
                            progressBarColor: GFColors.SUCCESS,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Boxerpage()),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Boxer_8.png',
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 30.0),
                  // add some space between the image and the text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Boxer',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          GFProgressBar(
                            percentage: 0.8,
                            lineHeight: 12,
                            width: 360,
                            alignment: MainAxisAlignment.start,
                            child: const Text(
                              '80%',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blueAccent),
                            ),
                            backgroundColor: Colors.white,
                            progressBarColor: GFColors.SUCCESS,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Baseball_3.png',
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 30.0),
                // add some space between the image and the text
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Baseball',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        GFProgressBar(
                          percentage: 0.56,
                          lineHeight: 12,
                          width: 360,
                          alignment: MainAxisAlignment.start,
                          child: const Text(
                            '56%',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent),
                          ),
                          backgroundColor: Colors.white,
                          progressBarColor: GFColors.SUCCESS,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Basketball_1.png',
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 30.0),
                // add some space between the image and the text
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Basketball',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        GFProgressBar(
                          percentage: 0.6,
                          lineHeight: 12,
                          width: 360,
                          alignment: MainAxisAlignment.start,
                          child: const Text(
                            '60%',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent),
                          ),
                          backgroundColor: Colors.white,
                          progressBarColor: GFColors.SUCCESS,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/weightlifter_13.png',
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 30.0),
                // add some space between the image and the text
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'barbell bench press',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        GFProgressBar(
                          percentage: 0.27,
                          lineHeight: 12,
                          width: 360,
                          alignment: MainAxisAlignment.start,
                          child: const Text(
                            '27%',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent),
                          ),
                          backgroundColor: Colors.white,
                          progressBarColor: GFColors.SUCCESS,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Fitgirl_12.png',
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 30.0),
                // add some space between the image and the text
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'dumbbell squat',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        GFProgressBar(
                          percentage: 0.48,
                          lineHeight: 12,
                          width: 360,
                          alignment: MainAxisAlignment.start,
                          child: const Text(
                            '48%',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent),
                          ),
                          backgroundColor: Colors.white,
                          progressBarColor: GFColors.SUCCESS,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
