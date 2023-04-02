import 'package:flutter/material.dart';
import 'package:mark0/screens/nudity_detect.dart';
import 'package:mark0/screens/text_profanity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('CHOOSE AN OPTION',
                style: TextStyle(
                  fontSize: 25,
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return const TextProfanity();
                }));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Text Profanity',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return const NudityDetect();
                }));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Nudity Detection',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
