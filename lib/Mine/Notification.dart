import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NotificationPage extends StatelessWidget {
  final List<String> images = [
    'assets/images/Baseball_3.png',
    'assets/images/Boxer_1.png',
    'assets/images/Fitgirl_12.png',
  ];

  final List<Map<String, String>> notifications = [
    {
      'title': 'Notification 1',
      'subtitle': 'This is the content of notification 1.',
      'image': 'https://www.example.com/avatar1.jpg',
    },
    {
      'title': 'Notification 2',
      'subtitle': 'This is the content of notification 2.',
      'image': 'https://www.example.com/avatar2.jpg',
    },
    {
      'title': 'Notification 3',
      'subtitle': 'This is the content of notification 3.',
      'image': 'https://www.example.com/avatar3.jpg',
    },
    {
      'title': 'Notification 4',
      'subtitle': 'This is the content of notification 4.',
      'image': 'https://www.example.com/avatar4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationPage'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: images.map((item) => Container(
              child: Center(
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
            )).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(notifications[index]['image'] ?? ''),
                  ),
                  title: Text(notifications[index]['111111111'] ?? ''),
                  subtitle: Text(notifications[index]['subtitle'] ?? ''),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}