import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/widgets/Tasklist.dart';
import 'package:todoey_flutter/module/taskdata.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_custom.dart';

class TodeyMain extends StatelessWidget {
  //we cannot use setchange on a stateless widget thus we use func callback to pass one value from a screen to the previous screen.
  //on pressing the we call the function which it has achieved through Constructor and the value to tht function.
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    String formatDate = DateFormat.yMMMd().format(date);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => SingleChildScrollView(
                          child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TaskScreen(),
                      )));
            }),
        backgroundColor: Colors.black54,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 70, left: 40),
                child: Container(
                  // decoration: BoxDecoration(image: AssetImage()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.list,
                          size: 60.0,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Todoey",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "$formatDate",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                          ]),
                      Text(
                        "${Provider.of<Taskdata>(context).getCount()} Tasks",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    child: TaskList(),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20.0)))),
              ),
            ]));
  }
}
