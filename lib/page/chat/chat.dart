import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatScreen extends StatefulWidget {
  final String senderId;
  final String receiverId;

  ChatScreen({required this.senderId, required this.receiverId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  final TextEditingController controller = TextEditingController();

  void sendMessage(String text) {
    if (text.isNotEmpty) {
      final message = {
        'senderId': widget.senderId,
        'receiverId': widget.receiverId,
        'text': text,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };

      // Save message under a unique chat ID (combination of sender and receiver IDs)
      final chatId = _generateChatId(widget.senderId, widget.receiverId);
      database.child('chats/$chatId').push().set(message);
      controller.clear();
    }
  }

  String _generateChatId(String senderId, String receiverId) {
    return senderId.compareTo(receiverId) < 0
        ? '${senderId}_$receiverId'
        : '${receiverId}_$senderId';
  }

  @override
  Widget build(BuildContext context) {
    final chatId = _generateChatId(widget.senderId, widget.receiverId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.receiverId}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: database.child('chats/$chatId').orderByChild('timestamp').onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData && snapshot.data != null) {
                  final event = snapshot.data as DatabaseEvent;
                  final messages = event.snapshot.value as Map<dynamic, dynamic>?;

                  if (messages == null) {
                    return Center(child: Text('No messages yet.'));
                  }

                  final messageList = messages.entries.map((entry) {
                    final messageData = entry.value as Map<dynamic, dynamic>;
                    return Message(
                      senderId: messageData['senderId'],
                      text: messageData['text'],
                      isMe: messageData['senderId'] == widget.senderId,
                    );
                  }).toList();

                  return ListView.builder(
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(message: messageList[index]);
                    },
                  );
                }

                return Center(child: Text('Error loading messages.'));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => sendMessage(controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String senderId;
  final String text;
  final bool isMe;

  Message({required this.senderId, required this.text, required this.isMe});
}

class ChatBubble extends StatelessWidget {
  final Message message;

  ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.text,
          style: TextStyle(color: message.isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
