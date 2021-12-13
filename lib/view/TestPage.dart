import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    var watch = context.watch<Counter>();
    return Column(
      children: [
        Text("${watch.count}"),
        TextButton(
            onPressed: () {
              counter.increment();
            },
            child: Text("click"))
      ],
    );
  }
}

class Counter extends ChangeNotifier {
  int count = 1;

  void increment() {
    count++;
    notifyListeners();
  }
}

void build(int num,{String? name,int age = 30}){
  print('age $age num ');
}

