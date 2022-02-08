import 'package:flutter/material.dart';

class GameRooms extends StatelessWidget {
  const GameRooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalCandidates = 100;
    return ListView.separated(
      itemCount: totalCandidates,
      itemBuilder: (_, int index) {
        int gameRoom = ++index;
        return Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white70,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.gamepad),
              Text('Game room ' + gameRoom.toString()),
              const Icon(Icons.transit_enterexit),
            ],
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
