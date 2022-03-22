import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/screens/add/add.screen.dart';
import 'package:todo_list/screens/home/models/list_item.model.dart';
import 'package:todo_list/screens/home/widgets/todo_list.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ToDoListItem> items = [];
  late final SharedPreferences sharedPreferences;

  @override
  void initState() {
    SharedPreferences.getInstance().then((instance) {
      sharedPreferences = instance;
      final itemKeys = sharedPreferences.getStringList('list');
      if (itemKeys != null) {
        setState(() {
          for (final itemKey in itemKeys) {
            if (sharedPreferences.containsKey(itemKey)) {
              items.add(ToDoListItem(title: itemKey, done: sharedPreferences.getBool(itemKey)!));
            }
          }
        });
      }
    });
    super.initState();
  }

  void _saveList() {
    sharedPreferences.setStringList('list', items.map((e) => e.title).toList());
  }

  void _onChanged(int i, bool done) {
    sharedPreferences.setBool(items[i].title, done);
    setState(() => items[i].done = done);
  }

  void _onDelete(int i) {
    sharedPreferences.remove(items[i].title);
    setState(() => items.removeAt(i));
    _saveList();
  }

  @override
  Widget build(BuildContext context) {
    void _addItem() async {
      final item = await Navigator.of(context).pushNamed(AddScreen.routeName) as ToDoListItem?;
      if (item != null) {
        setState(() => items.add(item));
        sharedPreferences.setBool(item.title, false);
        _saveList();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ToDoList(
        items: items,
        onChanged: _onChanged,
        onDelete: _onDelete,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }
}
