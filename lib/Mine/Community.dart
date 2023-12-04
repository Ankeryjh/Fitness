import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  final _commentController = TextEditingController();
  bool _isCommentVisible = false;

 late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _commentController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildFloatingMessage(String user, String message) {
    return Container(
      decoration: BoxDecoration(

        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          SizedBox(height: 4.0),
          Text(
              message,
            style:TextStyle(
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    _animationController.forward(); // 启动动画

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFFF6EDEE),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
            ),
            Spacer(),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/head2.png'),
          ),
          SizedBox(width: 8.0),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: screenHeight / 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'assets/images/communit.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 70,
                            height: 170,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite),
                                  color: Colors.red,
                                  onPressed: () {},
                                ),
                                SizedBox(height: 4.0),
                                IconButton(
                                  icon: Icon(Icons.chat_bubble),
                                  color: Colors.blue,
                                  onPressed: () {
                                    setState(() {
                                      _isCommentVisible = true;
                                    });
                                  },
                                ),
                                SizedBox(height: 4.0),
                                IconButton(
                                  icon: Icon(Icons.more_vert),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget?child) {
                return Transform.translate(
                  offset: Offset(0, (1 - _animation.value) * 200),
                  child: child,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFloatingMessage('Bob', 'Great photo!'),
                  SizedBox(height: 8.0),
                  _buildFloatingMessage('David', 'Love it!'),
                  SizedBox(height: 8.0),
                  _buildFloatingMessage('James', 'Awesome shot!'),
                  SizedBox(height: 8.0),
                  _buildFloatingMessage('Anek', 'exercise every day, come on'),
                  SizedBox(height: 8.0),
                  _buildFloatingMessage('Eva', 'you will be whoever you want to be'),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}