import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/module/taskdata.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String tasktitle;
    return Container(
      color: Color(
          0xff6A686A), //this container is added to give a round bordering to the container as it also of the same color.
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 20, right: 30),
          child: Column(
            children: <Widget>[
              Text(
                "Add Task",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.blue),
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
                onChanged: (newText) {
                  tasktitle = newText;
                },
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "What you wanna do ?",
                  helperMaxLines: 2,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 5.0)),
                  fillColor: Colors.blue,
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: FlatButton(
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Provider.of<Taskdata>(context, listen: false)
                        .addTask(tasktitle);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
