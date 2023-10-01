import 'package:flutter/material.dart';

class CreaTasks extends StatefulWidget {
  const CreaTasks({super.key});

  @override
  State<CreaTasks> createState() => _CreaTasksState();
}

class _CreaTasksState extends State<CreaTasks> {
  List<TaskItem> _listaTasks = [];
  final taskController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    taskController.dispose();
    super.dispose();
  }

  void _aggiungiUnaTask(String task) {
    setState(() {
      _listaTasks.add(TaskItem(task, setState));
    });
    taskController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(9.0, 40.0, 9.0, 0.0),
            child: Text(
              'Inserisci i tuoi task',
              style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: 'ZenLoop',
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black38,
                      blurRadius: 15.0,
                      offset: Offset(2.0, 4.0),
                    )
                  ]),
            ),
          ),
          Expanded(
            //FIXME: sostituire con contenitore che scrolla ma che si espande con il contenuto
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(9.0, 9.0, 20.0, 0.0),
              itemCount: _listaTasks.length,
              itemBuilder: (context, index) {
                final item = _listaTasks[index];
                return item.buildTaskItem(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(9.0, 0, 20.0, 9.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Oggi devo...',
                icon: Icon(Icons.star_border_rounded),
              ),
              controller: taskController,
              onSubmitted: (val) {
                _aggiungiUnaTask(taskController.text);
              },
              onEditingComplete: () {},
            ),
          )
        ]),
      ),
    );
  }
}

/// A ListItem that contains data to display a message.
class TaskItem {
  final String taskText;
  bool important = false;
  final setStateParent;

  TaskItem(this.taskText, this.setStateParent);

  Icon getFlagIcon(context) {
    if (important) {
      return Icon(
        Icons.flag,
        color: Theme.of(context).colorScheme.secondary,
      );
    } else {
      return Icon(
        Icons.flag_outlined,
        color: Theme.of(context).colorScheme.secondary,
      );
    }
  }

  //TODO: gestione della modifica del task => corrisponde modifica nella lista
  Widget buildTaskItem(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: TextEditingController(text: taskText),
              decoration: InputDecoration(
                  icon: Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.secondary,
              )),
            ),
          ),
          IconButton(
              onPressed: () {
                setStateParent((){
                  important = !important;
                });
              },
              icon: getFlagIcon(context))
        ],
      );
}
