import 'package:flutter/material.dart';
import 'package:todo_list/screens/home/models/list_item.model.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({
    Key? key,
    required this.item,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  final ToDoListItem item;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    void _onLongPressStart(LongPressStartDetails details) {
      showMenu<String>(
        context: context,
        position: RelativeRect.fill,
        items: [
          PopupMenuItem<String>(
            value: 'delete',
            child: const Text('Delete'),
            onTap: onDelete,
          )
        ],
      );
    }

    return GestureDetector(
      onLongPressStart: _onLongPressStart,
      child: Card(
        child: ListTile(
          title: Text(item.title),
          trailing: Checkbox(
            value: item.done,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
