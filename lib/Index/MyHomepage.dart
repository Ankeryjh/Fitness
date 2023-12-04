import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fithealth/Index/FootballPage.dart';
import 'package:fithealth/Index/FitgirlPage.dart';
import 'package:fithealth/Index/BaseballPage.dart';
import 'package:fithealth/Index/BasketballPage.dart';
import 'package:fithealth/Index/BoxerPage.dart';
import 'package:fithealth/Index/VolleyballPage.dart';
import 'package:fithealth/Activity/ActivityContent.dart';
import 'package:fithealth/Exercise/CommunityPage.dart';
import 'package:fithealth/Mine/MineContent.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}
//-------定义全局属性-------------
class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedBar = 0;

  void _onBarSelected(int index) {
    setState(() {
      _selectedBar = index;
    });

    switch (index) {
      case 0:
      // 点击首页，显示推荐页面
        break;
      case 1:
      // 点击社区，显示运动页面
        break;
      case 2:
      // 点击我的运动，显示活动页面
        break;
      case 3:
      // 点击我的，显示个人中心页面
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(),
        bottomNavigationBar: ConvexAppBar(
        items: [
        TabItem(
        icon: Icon(Icons.home, color:Color(0xFFFFCBCB)),
    title: 'Home',
    ),
    TabItem(
    icon: Icon(Icons.offline_share, color: Color(0xFFFFCBCB)),
    title: 'society',
    ),
    TabItem(
    icon: Icon(Icons.directions_run, color: Color(0xFFFFCBCB)),
    title: 'sports',
    ),
    TabItem(
    icon: Icon(Icons.person, color: Color(0xFFFFCBCB)),
    title: 'Mine',
    ),
    ],
    activeColor: Colors.purpleAccent,
    color: Colors.black38,
    onTap: _onBarSelected,
    initialActiveIndex: _selectedBar,
    backgroundColor: Color(0xFFCBACD8),
    ),
    );
  }

  Widget _buildBody() {
    switch (_selectedBar) {
      case 0:
      // 显示推荐页面
        return _buildRecommendationContent();
      case 1:
      // 显示运动页面
        return CommunityPage();
      case 2:
      // 显示活动页面
        return ActivityContent();
      case 3:
      // 显示个人中心页面
        return MineContent();
      default:
        return SizedBox.shrink();
    }
  }

//
  Widget _buildRecommendationContent() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Good Morning',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFFCBACD8),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Anker',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: _buildContainerWithImageAndText(
                    color: Colors.lightBlueAccent,
                    image: 'assets/images/Volleyball_1.png',
                    text: 'Volleyball',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VolleyballPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildContainerWithImageAndText(
                    color: Colors.blueGrey,
                    image: 'assets/images/Football_1.png',
                    text: 'Football',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FootballPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: _buildContainerWithImageAndText(
                    color: Colors.pinkAccent,
                    image: 'assets/images/fitgirl_10.png',
                    text: 'Fitgirl',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  FitgirlPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildContainerWithImageAndText(
                    color: Colors.purple,
                    image: 'assets/images/Basketball_6.png',
                    text: 'Basketball',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BasketballPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: _buildContainerWithImageAndText(
                    color: Colors.redAccent,
                    image: 'assets/images/Boxer_1.png',
                    text: 'Boxer',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  BoxerPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildContainerWithImageAndText(
                    color: Color(0xFFFFCBCB),
                    image: 'assets/images/Baseball_3.png',
                    text: 'Baseball',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  BaseballPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
  Widget _buildContainerWithImageAndText({
    required Color color,
    required String image,
    required String text,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 140,
              height: 150,
            ),
            // SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}











