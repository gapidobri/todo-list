import 'package:flutter/material.dart';
import 'package:todo_list/screens/add/widgets/add_form.widget.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  static const routeName = '/add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add item'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: AddForm(),
      ),
    );
  }
}
