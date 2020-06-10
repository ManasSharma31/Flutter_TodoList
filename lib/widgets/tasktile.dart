import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.title,
      this.ischecked,
      this.callback,
      this.longpresscallback,
      this.t});
  final String title;
  final bool ischecked;
  final Function callback;
  final Function longpresscallback;
  final int t;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longpresscallback,
        title: Text(
          t.toString() + ": " + title,
          style: TextStyle(
              fontSize: 20.0,
              decoration: ischecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.blue,
          value: ischecked,
          onChanged: callback,
        ));
  }
}
