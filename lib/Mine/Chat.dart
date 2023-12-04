  import 'package:flutter/material.dart';
  import 'package:fithealth/Mine/ChatScreen.dart';
  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: ChatPage(),
      );
    }
  }

  class ChatPage extends StatefulWidget {
    @override
    _ChatPageState createState() => _ChatPageState();
  }

  class _ChatPageState extends State<ChatPage> {
    int _selectedIndex = 0;

    List<Widget> _chatScreen = [
      Chats(),
      Contacts(),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'WECHAT',
            style: TextStyle(color: Colors.greenAccent,fontWeight:FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],

              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Text(
                      'Chats',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: _selectedIndex == 0 ? Colors.greenAccent : Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(15),

                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Text(
                      'Contacts',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: _selectedIndex == 1 ? Colors.greenAccent : Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(15),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: _chatScreen[_selectedIndex],
              ),
            ),
          ],
        ),
      );
    }
  }

  class Chat {
    final String name;
    final String message;
    final String avatar;
    bool hasUnreadMessages;
    Chat({required this.name, required this.message, required this.avatar,this.hasUnreadMessages = false});
  }

  class Chats extends StatelessWidget {
    final List<Chat> chats = [
      Chat(name: 'Alice', message: 'Hi there!', avatar: 'assets/images/head9.jpg',hasUnreadMessages: true),
      Chat(name: 'Bob', message: 'How are you?', avatar: 'assets/images/head10.jpg',hasUnreadMessages: true),
      Chat(name: 'Charlie', message: 'What are you up to?', avatar: 'assets/images/head3.jpg'),
      Chat(name: 'David', message: 'Did you see the game last night?', avatar: 'assets/images/head4.jpg',hasUnreadMessages: true),
      Chat(name: 'Eva', message: 'Let\'s grab lunch soon.', avatar: 'assets/images/head5.jpg'),
      Chat(name: 'Frank', message: 'Can you send me the report?', avatar: 'assets/images/head6.jpg'),
      Chat(name: 'Grace', message: 'Happy birthday!', avatar: 'assets/images/head7.jpg'),
      Chat(name: 'Henry', message: 'Where should we meet?', avatar: 'assets/images/head8.jpg'),
    ];

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chat: chats[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(chats[index].avatar),
                    ),
                    if (chats[index].hasUnreadMessages)
                      Positioned(
                        top: 15,
                        left: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                title: Text(
                  chats[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(chats[index].message),
                trailing: Text('12:30'),
              ),
            ),
          );
        },
      );
    }
  }

  class Contacts extends StatelessWidget {
    final List<Chat> chats = [
      Chat(name: 'Official', message: 'Hi there!', avatar: 'assets/images/icon.png',hasUnreadMessages: true),
      Chat(name: 'sports organization', message: 'How are you?', avatar: 'assets/images/icon4.jpg',hasUnreadMessages: true),
      Chat(name: 'Volleyball Club', message: 'What are you up to?', avatar: 'assets/images/icon1.jpg'),
      Chat(name: 'Basketball Club', message: 'Did you see the game last night?', avatar: 'assets/images/icon5.jpg',hasUnreadMessages: true),
      Chat(name: 'Box Club', message: 'Let\'s grab lunch soon.', avatar: 'assets/images/icon3.jpg'),
    ];

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Stack(
                children:[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(chats[index].avatar),
                  ),
                  if (chats[index].hasUnreadMessages) // Show the dot if there are unread messages
                    Positioned(
                      top: 15,
                      left: 0,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              title: Text(
                chats[index].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(chats[index].message),
              trailing: Text('12:30'),
            ),
          );
        },
      );
    }
  }