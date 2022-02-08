import 'package:flutter/material.dart';

class GameCredits extends StatelessWidget {
  const GameCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalRooms = 100;
    return ListView.separated(
      itemCount: totalRooms,
      itemBuilder: (_, int index) {
        return Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white70,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('About', style: TextStyle(fontWeight: FontWeight.w700)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'pattern of skipping will keep going around the circle until there is only one person remaining - the survivor!',
                  textAlign: TextAlign.center,
                ),
              ),
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
