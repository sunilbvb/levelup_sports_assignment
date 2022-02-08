import 'package:flutter/material.dart';
import 'package:levelup_sports_assignment/tabs/game_room.dart';

class GameRooms extends StatelessWidget {
  const GameRooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalCandidates = 100;
    return ListView.separated(
      itemCount: totalCandidates,
      itemBuilder: (_, int index) {
        int gameRoom = ++index;
        return InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const GameRoom()));
          },
          child: Container(
            color: Colors.blueGrey[100],
            padding: const EdgeInsets.all(15),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo_small_transparent.png', height: 50),
                Text(
                  'Game room ' + gameRoom.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const Icon(Icons.gamepad),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1,
          height: 1,
        );
      },
    );
  }
}
