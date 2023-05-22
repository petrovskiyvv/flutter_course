import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter")),
        body: Align(
          alignment: Alignment.center,
          child: CounterAndInstructionWidget(),
        ),
      ),
    );
  }
}

class CounterAndInstructionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Tap "-" to decrement',
            ),
            CounterWidget(),
            Text(
              'Tap "+" to increment',
            ),
          ],
        ));
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      margin: EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: IconButton(
              onPressed: () {
                setState(() {
                  _counter--;
                });
              },
              icon: const Icon(Icons.remove,),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
          Expanded(
              child: Text(
                "$_counter",
                textAlign: TextAlign.center,
              )),
          Expanded(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                icon: const Icon(Icons.add),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              )),
        ],
      ),
    );
  }
}
