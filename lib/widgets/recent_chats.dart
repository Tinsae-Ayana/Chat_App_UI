import 'package:flutter/material.dart';
import 'package:ui_project/models/message.dart';
import 'package:ui_project/views/chat_screen.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
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
                    builder: (_) => ChatScreen(user: chats[index].sender)));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage(chats[index].sender.imageUrl),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chats[index].sender.name,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            chats[index].text,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(chats[index].time),
                    const SizedBox(height: 5.0),
                    const Text('New')
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
