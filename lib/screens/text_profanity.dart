import 'package:flutter/material.dart';
import 'package:profanity_filter/profanity_filter.dart';

class TextProfanity extends StatefulWidget {
  const TextProfanity({super.key});

  @override
  State<TextProfanity> createState() => _TextProfanityState();
}

class _TextProfanityState extends State<TextProfanity> {
  List<String> prof = [];
  final filter = ProfanityFilter();
  String censoredText = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profanity Detect'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Type Something Here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    onChanged: (value) {
                      // print(filter.hasProfanity(value));
                      prof = filter.getAllProfanity(value);

                      censoredText = filter.censorString(value);
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Profanity:',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(children: [
                    ...prof.map((e) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(5),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList()
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Censored Text:',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 40,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(censoredText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 25,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
