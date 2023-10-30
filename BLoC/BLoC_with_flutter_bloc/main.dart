import 'package:bloc_example/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BLoC with flutter_bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => ColorBloc(),
          child: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC with flutter_bloc"),
        centerTitle: true,
      ),
      body: Center(
          child: BlocBuilder<ColorBloc, Color>(
              builder: (context, currentColor) => AnimatedContainer(
                    height: 100,
                    width: 100,
                    color: currentColor,
                    duration: Duration(milliseconds: 500),
                  ))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.add(RedColorEvent());
            },
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(GreenColorEvent());
            },
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
