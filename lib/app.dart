import 'package:flutter/material.dart';
import 'package:todo_list/screens/add/add.screen.dart';
import 'package:todo_list/screens/home/home.screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AddScreen.routeName: (context) => const AddScreen(),
      },
    );
  }
}
