import 'package:flutter/material.dart';
import 'package:levelup_sports_assignment/tabs/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level Up Sports',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Tabs(),
    );
  }
}
// 1 3 6 10 15 21
// void main(){
//   int totalCandidates = 100;
//   List<int> totalCandidatesList = List.generate(totalCandidates, (index) => ++index);
// returnWinnerOfTheCardGame(totalCandidatesList);
// }

int returnWinnerOfTheCardGame(List<int> totalCandidatesList) {
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
  totalCandidatesList
      .removeWhere((element) => totalRemainingCandidates.contains(element));
  if (totalCandidatesList.length > 1) {
    returnWinnerOfTheCardGame(totalCandidatesList);
  }
  return totalCandidatesList.first;
}
