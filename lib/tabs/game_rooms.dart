import 'package:flutter/material.dart';
import 'package:levelup_sports_assignment/tabs/game_room.dart';

class GameRooms extends StatelessWidget {
  const GameRooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalCandidates = 100;
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff181818),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        itemCount: totalCandidates,
        itemBuilder: (_, int index) {
          int gameRoom = ++index;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const GameRoom()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/bg.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '200 Players',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white70),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white70,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Divider(
              thickness: 1,
              color: Colors.white10,
              height: 1,
            ),
          );
        },
      ),
    );
  }
}
