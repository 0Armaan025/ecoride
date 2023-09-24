import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green[700], // Customize primary color
      scaffoldBackgroundColor: Colors.green[100], // Customize background color
    ),
    home: ForumScreen(),
  ));
}

class Post {
  final String title;
  final String content;
  List<String> comments;

  Post({required this.title, required this.content, List<String>? comments})
      : this.comments = comments ?? [];
}

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  TextEditingController commentController = TextEditingController();
  List<Post> forumPosts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum'),
      ),
      body: ListView.builder(
        itemCount: forumPosts.length,
        itemBuilder: (context, index) {
          return _buildForumPostCard(forumPosts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreatePostDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildForumPostCard(Post post) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[700], // Customize text color
              ),
            ),
            SizedBox(height: 8),
            Text(post.content),
            SizedBox(height: 16),
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                _navigateToCommentsScreen(context, post.comments ?? []);
              },
              child: Text(
                'Comments:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 8),
            _buildCommentInputField(post),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentInputField(Post post) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: 'Add a comment...',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {},
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Comment added!'),
              ),
            );
            setState(() {
              post.comments.add(commentController.text);
              commentController.clear();
            });
          },
        ),
      ],
    );
  }

  Future<void> _showCreatePostDialog(BuildContext context) async {
    String title = '';
    String content = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create New Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Content'),
                onChanged: (value) {
                  content = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  forumPosts.add(Post(title: title, content: content));
                });
                Navigator.of(context).pop();
              },
              child: Text('Post'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToCommentsScreen(BuildContext context, List<String> comments) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CommentsScreen(comments: comments),
      ),
    );
  }
}

class CommentsScreen extends StatelessWidget {
  final List<String> comments;

  CommentsScreen({required this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.grey[200],
            title: Text(
              comments[index],
              style: TextStyle(
                color: Colors.green[900], // Customize text color
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
