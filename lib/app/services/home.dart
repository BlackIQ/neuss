import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _guess = TextEditingController();
  var nSelected = Random().nextInt(10);

  int points = 10;

  void chance() {
    int got = int.parse(_guess.text);

    if (got == nSelected) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          elevation: 0,
          title: const Text(
            'Good job',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Selected number was $nSelected.'),
                const Text('And you entered what exactly it was.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _guess.clear();
                nSelected = Random().nextInt(10);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Next one!',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      );
      setState(() {
        points++;
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          elevation: 0,
          title: const Text(
            'Ok, no!',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Selected number was $nSelected.'),
                Text('But you entered $got.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _guess.clear();
                nSelected = Random().nextInt(10);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Try again',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
      setState(() {
        points--;
      });
    }
    if (points == 0) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          elevation: 0,
          title: const Text(
            'Ok, no!',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                Text('Your points are equal to 0.'),
                Text('In this case you have to close and open the app.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: const Text(
                'Exit the app',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guess N',
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              points.toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Guess a number!',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Just guess a number and tap on the button.',
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text('Min = 1', style: TextStyle(color: Colors.lightBlue)),
                Text('Max = 250', style: TextStyle(color: Colors.lightBlue)),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Guess number',
                hintText: 'What you guess',
              ),
              controller: _guess,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'See my change',
              ),
              onPressed: () => chance(),
            ),
          ],
        ),
      ),
    );
  }
}
