import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:kanbyme/screens/creaTasks/CreaTasks.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'KANBYME',
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.pinkAccent,
                  ),
                ),
                Text(
                  'Cosa ti va di fare oggi?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print('button pressed!');
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const CreaTasks()),
                );
              },
              child: Text('Crea la tua Kanban Board'),
            ),
          ],
        ),
      ),
    );
  }
}
