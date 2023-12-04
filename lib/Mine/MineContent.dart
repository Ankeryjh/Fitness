import 'dart:js';
import 'package:flutter/material.dart';
import 'package:fithealth/Login/LoginPage.dart';
import 'package:fithealth/Mine/ExerciseCalendarPage.dart';
import 'package:fithealth/Mine/Profile.dart';
import 'package:fithealth/Mine/Community.dart';
import 'package:fithealth/Mine/Chat.dart';
import 'package:fithealth/Mine/Goals.dart';
import 'package:fithealth/Mine/Notification.dart';
class MineContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/head10.jpg'),
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange[300],
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatCard('Time', '2h', Icons.timer, Colors.orange),
                buildStatCard('Calories', '1000', Icons.local_fire_department, Colors.red),
                buildStatCard('Sleep', '8h', Icons.bedtime, Colors.blue),
              ],
            ),
          ),
          SizedBox(height: 60),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            padding: EdgeInsets.symmetric(horizontal:   35),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              buildModuleCard(context,'Exercise Calendar', Icons.calendar_today, Colors.orange,ExerciseCalendarPage()),
              buildModuleCard(context,'Notifications', Icons.notifications, Colors.red,NotificationPage()),
              buildModuleCard(context,'Chat', Icons.chat, Colors.blue,ChatPage()),
              buildModuleCard(context,'Community', Icons.camera_alt, Colors.green,CommunityPage()),
              buildModuleCard(context,'Goals', Icons.flag, Colors.purple,GoalsPage()),
              buildModuleCard(context,'Profile', Icons.person, Colors.teal,ProfilePage()),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStatCard(String title, String value, IconData icon, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: color),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildModuleCard(BuildContext context,String title, IconData icon, Color color,Widget page) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}