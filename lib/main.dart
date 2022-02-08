import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 1 3 6 10 15 21  
void main(){
  int totalCandidates = 100;  
  List<int> totalCandidatesList = List.generate(totalCandidates, (index) => ++index);  
  returnWinnerOfTheCardGame(totalCandidatesList);
}

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
