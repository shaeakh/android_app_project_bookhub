import 'package:flutter/material.dart';
class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          MessageItem(
            sender: 'Nixon Deb Antu',
            message: 'Please, could you send me some pic of your product!',
            time: '2 hours ago',
            unread: true,
          ),
          Divider(
            height: 10,
          ),
          MessageItem(
            sender: 'Arnob Sem',
            message: '10k possible ?',
            time: '4 hours ago',
            unread: true,
          ),
          Divider(
            height: 10,
          ),
          MessageItem(
            sender: 'Nafi Ullah',
            message: 'Last Price ?',
            time: '7 hours ago',
            unread: false,
          ),
          Divider(
            height: 10,
          ),
          MessageItem(
            sender: 'Abid Hasan Rifat',
            message: 'I want 10',
            time: '12 hours ago',
            unread: true,
          ),
          Divider(
            height: 10,
          ),
          MessageItem(
            sender: 'Amit Hasan Joy',
            message: 'I am interested',
            time: 'Yesterday',
            unread: false,
          ),
          Divider(
            height: 10,
          ),
          // Add more MessageItems as needed
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool unread;

  const MessageItem({
    required this.sender,
    required this.message,
    required this.time,
    required this.unread,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      leading: CircleAvatar(
        backgroundColor: Color(0xfff10d76),
        child: Icon(
            Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(sender),
      subtitle: Text(message),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time),
          if (unread)
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                child : Text(
                  'New',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
        ],
      ),
      onTap: () {
        // Handle tapping on a message
        // Navigate to a detailed message screen or take other actions
      },
    );
  }
}