import 'package:flutter/material.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
import 'package:tollin_go/Services/create_complain.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HelpLine'),
        backgroundColor: Colors.blueGrey.shade500,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade300,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Color.fromARGB(255, 100, 108, 112)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(hintText: 'Send a message'),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    _dialogFlowRequest(text);
  }

  Future<void> _dialogFlowRequest(String text) async {
    print("Sending user message to Dialogflow: $text");

    AuthGoogle authGoogle = await AuthGoogle(
      fileJson: 'assets/flutter-plou-2b7aed3eb8a7.json',
    ).build();

    DialogFlow dialogflow =
        DialogFlow(authGoogle: authGoogle, language: Language.english);

    AIResponse response = await dialogflow.detectIntent(text);
    String message = response.getMessage() ?? '';
  
    print("Received response from Dialogflow: $message");

    ChatMessage botMessage = ChatMessage(
      text: message,
      isUserMessage: false,
    );
  
    setState(() {
      _messages.insert(0, botMessage);
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: CircleAvatar(
              child: Icon(Icons.person), // Change this to the desired user icon
              backgroundColor: isUserMessage ? Colors.blue : Colors.white,
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: isUserMessage ? Colors.blue.shade600 : Colors.blueGrey.shade500,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: isUserMessage ? Radius.circular(8.0) : Radius.zero,
                  bottomRight:
                      isUserMessage ? Radius.zero : Radius.circular(8.0),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
