import 'package:flutter/material.dart';
import 'package:todo_list/screens/home/models/list_item.model.dart';

class AddForm extends StatelessWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();

    void _onAdd() {
      Navigator.of(context).pop(
        ToDoListItem(title: _controller.text),
      );
    }

    return Column(
      children: [
        TextField(
          controller: _controller,
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _onAdd,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
