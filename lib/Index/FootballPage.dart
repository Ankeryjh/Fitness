import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:fithealth/Conponment/fl_charts.dart';
import 'package:fithealth/Conponment/Barcharts.dart';
import 'package:fithealth/Conponment/Linecharts.dart';

class FootballPage extends StatefulWidget {
  @override
  _FootballPageState createState() => _FootballPageState();
  }
  class _FootballPageState extends State<FootballPage> {
  final List<Widget> _pages = [
  BarChartSample1(),
  LineChartSample1(),
  BarChartSample2(),
  ];
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports'),
        backgroundColor: Colors.blueGrey,
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
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Football_1.png',
                  width: 250,
                  height: 240,
                ),
                SizedBox(height: 10),
                Text(
                  'FootBall',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 10),
                GFProgressBar(
                  percentage: 0.7,
                  lineHeight: 18,
                  width: 460,
                  alignment: MainAxisAlignment.center,
                  child: const Text(
                    '70%',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                  ),
                  leading: Icon(Icons.sports_soccer,color:Colors.white,size: 30,),
                  backgroundColor: Colors.white,
                  progressBarColor: GFColors.SUCCESS,
                ),
              ],
            ),
          ),

          Expanded(
            child: Stack(
              children: [
                _pages[_currentIndex],
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex =
                            (_currentIndex - 1) % _pages.length;
                      });
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex =
                            (_currentIndex + 1) % _pages.length;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
        )
    );
  }
}

