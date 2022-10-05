import 'package:flutter/material.dart';

import 'package:ui_project/widgets/favorite_contact.dart';
import 'package:ui_project/widgets/recent_chats.dart';

import '../widgets/catagory_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const CatagorySelector(),
          Expanded(
            child: Container(
              // ignore: sort_child_properties_last
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(children: [
                const FavoriteContact(),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: const RecentChats(),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
