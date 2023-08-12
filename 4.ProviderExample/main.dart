import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart'; //add "provider: ^6.0.5" at pubspec.yaml dependencies

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BoolChanger()),
      ],
      child: const MyApp(),
    ),
  );
}

class BoolChanger with ChangeNotifier {
  bool _state = true;

  bool get state => _state;

  void changeState() {
    _state = !_state;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProviderExample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'ProviderExample',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.purple,
          ),
          body: const Center(
              child: Column(children: <Widget>[
            AnimatedContainerExample(),
            SwitchExample(),
          ]))),
    );
  }
}

class AnimatedContainerExample extends StatelessWidget {
  const AnimatedContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 200.0,
      height: 200.0,
      color: context.watch<BoolChanger>().state
          ? Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0)
          : Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
      alignment: Alignment.center,
      duration: const Duration(seconds: 2),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: context.read<BoolChanger>().state,
      activeColor: const Color.fromARGB(255, 54, 244, 54),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          context.read<BoolChanger>().changeState();
        });
      },
    );
  }
}
