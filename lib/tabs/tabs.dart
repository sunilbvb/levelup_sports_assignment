import 'package:flutter/material.dart';
import 'package:levelup_sports_assignment/tabs/game_credits.dart';
import 'package:levelup_sports_assignment/tabs/game_rooms.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/nerd.png', height: 45),
            ],
          ),
          backgroundColor: Colors.black,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Game Rooms'),
              Tab(text: 'Game Credits'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [GameRooms(), GameCredits()],
        ),
      ),
    );
  }
}
