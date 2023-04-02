import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NudityDetect extends StatefulWidget {
  const NudityDetect({super.key});

  @override
  State<NudityDetect> createState() => _NudityDetectState();
}

class _NudityDetectState extends State<NudityDetect> {
  bool? result = false;
  String? url;
  TextEditingController checkController = TextEditingController();
  getNudityCheck() async {
    Dio dio = Dio();
    final response = await dio.get(
      'https://nsfw-nude-detection.p.rapidapi.com/function/nsfw-wrapper',
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '692d5467c0mshe97c68ba53989f6p1998bbjsn77e8777b19d6',
          'X-RapidAPI-Host': 'nsfw-nude-detection.p.rapidapi.com',
        },
      ),
      queryParameters: {
        'url': url,
      },
    );
    print(response.data['nsfw_score']);
    if (response.data['nsfw_score'] > 0.6) {
      result = true;
    } else {
      result = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Nudity Detection'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
            child: Center(
                child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(
                    //   'PASTE YOUR URL AND PRESS ENTER',
                    //   style: TextStyle(
                    //     color: Colors.indigo.shade200,
                    //     fontSize: 20,
                    //   ),
                    //),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: checkController,
                          decoration: InputDecoration(
                            hintText: 'Enter Image URL Here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            result = null;
                            setState(() {});
                            url = checkController.text;
                            await getNudityCheck();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                          ),
                          child: const Text(
                            'CHECK',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      alignment: Alignment.center,
                      child: result == null
                          ? const Center(child: CircularProgressIndicator())
                          : result == true
                              ? const Text(
                                  'Contains Nudity',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : url == null
                                  ? const Text('NO IMAGE YET',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.indigoAccent))
                                  : Image.network(
                                      url!,
                                      fit: BoxFit.cover,
                                    ),
                    ),
                  ],
                ),
              ),
            )),
          )),
    );
  }
}
