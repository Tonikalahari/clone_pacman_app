import 'package:flutter/material.dart';

import '../main.dart';

class StartGamePage extends StatelessWidget {
  const StartGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Card(
            color: Colors.black,
            child: Text(
              'Press "START" and lets play',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            "assets/images/crystal_01d.png",
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ElevatedButton(
                onPressed: () {
              
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
                    return const HomeGamePage();
                  }), (route) => false);
                },
                child: const Text('START GAME'),
              ),
            ),
          ),
          const Divider(
            height: 200,
          ),
          const Card(
            color: Colors.black,
            child: Text(
              'desenvovido por Antonio Manoel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
