import 'package:flutter/material.dart';
import 'package:ui_project/models/message.dart';
import '../models/user.dart';

class ChatScreen extends StatefulWidget {
  User user;
  ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.user.name),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              // decoration: const BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(30.0),
              //         topRight: Radius.circular(30.0))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.only(top: 15.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                ),
              ),
            ),
          ),
          _buildMessageComposer()
        ],
      ),
    );
  }

  _buildMessage(message, isMe) {
    return Container(
        decoration: BoxDecoration(
            color: isMe ? Colors.blueGrey : Colors.lightBlue,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0))
                : const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        margin: isMe
            ? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
            : const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                right: 80.0,
              ),
        child: Text(
          message.text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
        ));
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(children: [
        IconButton(
          icon: const Icon(
            Icons.photo,
            color: Colors.blue,
            size: 30,
          ),
          onPressed: () {},
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Send Messag',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.send,
            color: Colors.blue,
            size: 30,
          ),
          onPressed: () {},
        ),
      ]),
    );
  }
}
