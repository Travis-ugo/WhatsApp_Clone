import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:lost/Desktop/desktop_chatroom.dart';
import 'desktop_chat.dart';
import 'desktop_menu.dart';
import 'desktop_draw.dart';

class Web extends StatelessWidget {
  const Web({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();
    return Scaffold(
      endDrawer: const SizedBox(
        width: 450,
        child: Drawer(
          elevation: 0.0,
          child: WebDrawer(),
        ),
      ),
      drawerScrimColor: Colors.transparent,
      drawer: const SizedBox(
        width: 450,
        child: Drawer(
          elevation: 0.0,
          child: WebDrawer(),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                CupertinoIcons.search,
                size: 20,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
          const SizedBox(width: 25),
          const Icon(
            Icons.expand_more,
            size: 20,
          ),
          const SizedBox(width: 25),
        ],
        title: const MenuBar(),
      ),
      body: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
            width: 450,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                  child: Field(
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        icon: Icon(CupertinoIcons.search, size: 15),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: 'Search or start new chart',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: const WebChat(),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ChatRoomWeb(),
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  const Field({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(60),
      ),
      child: Center(child: child),
    );
  }
}
