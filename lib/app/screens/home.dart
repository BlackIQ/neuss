import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

    if (got >= 0 && got <= 10) {
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
    }
    else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          elevation: 0,
          title: const Text(
            'Less and more',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                Text('Number should be less than 11 and more that 0.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Got it',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      );
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
            TextButton(
              onPressed: () {
                setState(() {
                  points = 10;
                  Navigator.of(context).pop();
                });
              },
              child: const Text(
                'Start over',
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
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    'Nuess',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'Guess a number between selected minimum and maximum.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Start over',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              onTap: () {
                setState(() {
                  points = 10;
                });
              },
            ),
            ListTile(
              title: const Text(
                'How to play',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'About app',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              onTap: () async {
                await launch('https://github.com/BlackIQ/neuss');
              },
            ),
          ],
        ),
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
                Text('Min = 0', style: TextStyle(color: Colors.lightBlue)),
                Text('Max = 10', style: TextStyle(color: Colors.lightBlue)),
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
