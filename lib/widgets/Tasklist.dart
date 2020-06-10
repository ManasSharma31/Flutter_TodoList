import 'package:flutter/material.dart';
import 'package:todoey_flutter/module/taskdata.dart';
import 'tasktile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //taskdata is equivalent to Provider.of<TaskData>(context)
    return Consumer<Taskdata>(builder: (context, taskdata, child) {
      return ListView.builder(
          itemCount: taskdata.getCount(),
          itemBuilder: (context, index) {
            return TaskTile(
              t: index + 1,
              longpresscallback: () {
                taskdata.deleteTask(index);
              },
              title: taskdata.tasks[index].name,
              ischecked: taskdata.tasks[index].isDone,
              callback: (value) {
                taskdata.updateTask(taskdata.tasks[index]);
              },
            );
          });
    });
  }
}
