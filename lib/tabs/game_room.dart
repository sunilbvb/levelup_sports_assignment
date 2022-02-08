import 'package:flutter/material.dart';

class GameRoom extends StatefulWidget {
  const GameRoom({Key? key}) : super(key: key);

  @override
  State<GameRoom> createState() => _GameRoomState();
}

class _GameRoomState extends State<GameRoom> {
  // setting the 100 players in a game room
  List<int> totalCandidatesList = List.generate(100, (index) => ++index);
  final GlobalKey<AnimatedListState> animatedListKey =
      GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    returnWinnerOfTheCardGame(totalCandidatesList);
  }

  Future<int> returnWinnerOfTheCardGame(List<int> totalCandidatesList) async {
    List<int> totalRemainingCandidates = [];
    int startIndex = 0;
    int endIndex = 0;
    for (int i = 0; i < totalCandidatesList.length; ++i) {
      endIndex = endIndex + i;
      startIndex = endIndex;
      startIndex--;
      if (startIndex >= totalCandidatesList.last &&
          endIndex >= totalCandidatesList.last) {
        break;
      }
      if (startIndex >= totalCandidatesList.length &&
          endIndex >= totalCandidatesList.length) {
        break;
      }
      if (!startIndex.isNegative) {
        totalRemainingCandidates
            .add(totalCandidatesList.sublist(startIndex, endIndex).first);
      }
    }
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    for (var element in totalRemainingCandidates) {
      int index = totalCandidatesList.indexOf(element);
      doAnimation(index);
    }

    if (totalCandidatesList.length > 1) {
      returnWinnerOfTheCardGame(totalCandidatesList);
    }
    return totalCandidatesList.first;
  }

  void doAnimation(int index) {
    if (animatedListKey.currentState != null) {
      animatedListKey.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: Container(
            height: 100,
            color: Colors.blueGrey,
            child: Center(
              child: Image.asset(
                'assets/logo_full_transparent.png',
                height: 40,
              ),
            ),
          ),
        ),
        duration: const Duration(milliseconds: 1000),
      );
      totalCandidatesList.removeAt(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blueGrey[100],
      body: AnimatedList(
        key: animatedListKey,
        initialItemCount: totalCandidatesList.length,
        itemBuilder: (_, int index, animation) {
          int playerCard = totalCandidatesList[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Player ' + playerCard.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      Image.network(
                          'https://picsum.photos/250?category=actor?image=$playerCard'),
                    ],
                  ),
                ),
                const Divider(height: 1),
                if (totalCandidatesList.length == 1) ...[
                  const Divider(height: 1),
                  Text(
                    totalCandidatesList.first.toString() + '\nSurvivor',
                    style: const TextStyle(fontSize: 80),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset('assets/logo_small_transparent.png', height: 300),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
