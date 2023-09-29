import 'package:flutter/material.dart';

class CreaTasks extends StatefulWidget {
  const CreaTasks({super.key});

  @override
  State<CreaTasks> createState() => _CreaTasksState();
}

class _CreaTasksState extends State<CreaTasks> {
 List<String> _listaTasks = [];
 final taskController = TextEditingController();

 @override
 void dispose() {
   // Clean up the controller when the widget is disposed.
   taskController.dispose();
   super.dispose();
 }

 void _aggiungiUnaTask(String task) {
   setState(() {
    _listaTasks.add(task);
   });
   print(_listaTasks);
   taskController.clear();
 }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: [
            Text('Inserisci i tuoi task',
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepPurple
            ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: _listaTasks.map((e) => Text(e)).toList(),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Inserisci il tuo task',
              ),
              controller: taskController,
              onSubmitted: (val) {
               _aggiungiUnaTask(taskController.text);
                }
            )
          ]
      ),
    );
  }
}
