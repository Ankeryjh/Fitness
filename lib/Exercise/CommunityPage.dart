import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}
class _CommunityPageState extends State<CommunityPage>{
  Map<String, Map<String, dynamic>> _postStates = {
    'post1': {'liked': false, 'comments': []},
    'post2': {'liked': false, 'comments': []},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            GFCard(
              title: GFListTile(
                avatar: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/head4.jpg'),
                  radius: 30,
                ),
                title: Text('Aliec',
                  style: TextStyle(
                  fontWeight: FontWeight.bold, // make the name bold
                  fontSize: 18, // increase the font size of the name
                ),),
                subTitle: Text('2 hours ago'),
              ),
              content: Text('Today is so tired  .',

              ),
              buttonBar: GFButtonBar(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _postStates['post1']?['liked'] = !_postStates['post1']?['liked'];
                      });
                    },
                    child: GFButton(
                      onPressed: (){},
                      text: 'Like',

                    ),
                  ),
                  GFButton(
                    onPressed: () {
                      _showCommentDialog(context,'bob');
                    },
                    text: 'Comment',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Share',
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            GFCard(
              title: GFListTile(
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/head8.jpg'),
                  ),
                  title: Text('Eva', style: TextStyle(
                    fontWeight: FontWeight.bold, // make the name bold
                    fontSize: 18, // increase the font size of the name
                  )),
                  subTitle: Text('3 hours ago')),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My status'),
                  SizedBox(height: 8),
                  Text('Want to exercise but afraid of being tired'),
                  SizedBox(height: 8),
                  Image.asset(
                    'assets/images/conmmen1.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              buttonBar: GFButtonBar(
                children: [
                  GFButton(
                    onPressed: () {},
                    text: 'Like',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Comment',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Share',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            GFCard(
              title: GFListTile(
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/head6.jpg'),
                  ),
                  title: Text('Nova', style: TextStyle(
                    fontWeight: FontWeight.bold, // make the name bold
                    fontSize: 18, // increase the font size of the name
                  )),
                  subTitle: Text('3 hours ago')),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Fitness'),
                  SizedBox(height: 8),
                  Text('The thing to do today is Exercise'),
                  SizedBox(height: 8),
                  Image.asset(
                    'assets/images/comment2.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              buttonBar: GFButtonBar(
                children: [
                  GFButton(
                    onPressed: () {},
                    text: 'Like',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Comment',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Share',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            GFCard(
              title: GFListTile(
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/head3.jpg'),
                  ),
                  title: Text('Jueli', style: TextStyle(
                    fontWeight: FontWeight.bold, // make the name bold
                    fontSize: 18, // increase the font size of the name
                  )),
                  subTitle: Text('3 hours ago')),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('This is the title of the post.'),
                  SizedBox(height: 8),
                  Text('This is the content of the post.'),
                  SizedBox(height: 8),
                  Image.asset(
                    'assets/images/comment3.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              buttonBar: GFButtonBar(
                children: [
                  GFButton(
                    onPressed: () {},
                    text: 'Like',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Comment',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Share',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            GFCard(
              title: GFListTile(
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/head10.jpg'),
                  ),
                  title: Text('Anker'),
                  subTitle: Text('3 hours ago')),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('This is the title of the post.'),
                  SizedBox(height: 8),
                  Text('This is the content of the post.'),
                  SizedBox(height: 8),
                  Image.asset(
                    'assets/images/comment4.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              buttonBar: GFButtonBar(
                children: [
                  GFButton(
                    onPressed: () {},
                    text: 'Like',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Comment',
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Share',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );

  }

  void _showCommentDialog(BuildContext context, String postId) {
    TextEditingController _commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add a comment'),
        content: TextField(
          controller: _commentController,
          decoration: InputDecoration(
            hintText: 'Enter your comment here',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _postStates[postId]?['comments'].add({
                  'name': 'Bob',
                  'text': _commentController.text,
                });
              });
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}


