import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kanbyme/screens/creaTasks/CreaTasks.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onTertiary,
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
                Image.asset(
                  'asset/images/PNG/DrawKit-daily-life-vector-illustration-07.png',
                ),
                Text(
                  'KanbyMe',
                  style: TextStyle(
                      fontSize: 80,
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
                Text(
                  'Cosa ti va di fare oggi?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              icon: Icon(
                CupertinoIcons.rocket_fill,
              ),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColorLight,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  elevation: 7),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const CreaTasks()),
                );
              },
              label: Text('Crea la tua Kanban Board'),
            ),
          ],
        ),
      ),
    );
  }
}
