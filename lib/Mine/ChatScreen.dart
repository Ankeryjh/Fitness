import 'package:flutter/material.dart';
import 'package:fithealth/Mine/Chat.dart';

class ChatScreen extends StatelessWidget {
  final Chat chat;

  ChatScreen({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                final message = 'this is a message,but they are same';
                final isMe = index % 2 == 0;
                return _buildChatItem(isMe, message);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(bool isMe, String message) {
    if (isMe) {
      // 左边的消息
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent, // 将背景色设置为灰色
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(chat.avatar),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0),
        ],
      );
    } else {
      //右边的消息
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/images/head3.jpg"),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}