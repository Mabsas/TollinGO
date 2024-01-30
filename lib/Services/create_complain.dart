import 'package:flutter/material.dart';


class ChatBox extends StatefulWidget {
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  bool _initialMessageSent = false;

  @override
  void initState() {
    super.initState();
    _sendInitialMessage();
  }

  void _sendInitialMessage() {
    if (!_initialMessageSent) {
      _addMessage(
        "Hey sanaf, please tell us what's the issue?",
        sender: 'Automated',
        isAutomated: true,
      );
      _initialMessageSent = true;
    }
  }

  void _addMessage(String text, {String sender = 'User', bool isAutomated = false}) {
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        sender: sender,
        time: DateTime.now(),
        isAutomated: isAutomated,
      ));
    });
  }

  void _handleUserMessage(String text) {
    // Add your logic here to handle user messages
    // You can customize this method based on your application's requirements
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Create Complain',
          style: TextStyle(fontSize: 17.0, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[300],
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final ChatMessage message = _messages[index];
                return Container(
                  color: message.isAutomated ? Colors.blueGrey[100] : Colors.white,
                  child: ListTile(
                    title: Text(message.text),
                    subtitle: Text(message.sender),
                    leading: CircleAvatar(
                      child: message.isAutomated
                          ? Image.asset(
                        'assests/image/logo.png',
                        width: 40.0,
                        height: 40.0,
                      )
                          : Text(message.sender[0]),
                    ),
                    trailing: Text(message.time.toString()),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                    onSubmitted: (String text) {
                      _addMessage(text);
                      _handleUserMessage(text);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String userMessage = _textController.text;
                    _addMessage(userMessage);
                    _handleUserMessage(userMessage);
                    _textController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  ChatMessage({
    required this.text,
    required this.sender,
    required this.time,
    required this.isAutomated,
  });

  final String text;
  final String sender;
  final DateTime time;
  final bool isAutomated;
}
