import 'package:flutter/material.dart';
import 'package:todo_list/screens/home/models/list_item.model.dart';
import 'package:todo_list/screens/home/widgets/card.widget.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  final List<ToDoListItem> items;
  final Function(int i, bool done) onChanged;
  final Function(int i) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, i) => ToDoCard(
        item: items[i],
        onChanged: (done) => onChanged(i, done ?? false),
        onDelete: () => onDelete(i),
      ),
    );
  }
}
