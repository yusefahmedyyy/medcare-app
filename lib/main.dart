import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tetris/button.dart';
import 'package:tetris/call.dart';
import 'package:tetris/email.DART';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(const MyApp());
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'Group 6945.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 160,
                ),
                Center(
                  child: Lottie.asset('91148-vital-signs.json'),
                ),
                SizedBox(
                  height: 50,
                ),
                Mybutton(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MED CARE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String status = '';
  Future checkconnection() async {
    final connectionstatus = await Connectivity().checkConnectivity();
    if (connectionstatus == ConnectivityResult.wifi ||
        connectionstatus == ConnectivityResult.mobile) {
      setState(() {
        status = 'connected to internet';
      });
    } else {
      setState(() {
        status = 'WARNING: no internet connection';
      });
    }
  }

  @override
  void initState() {
    checkconnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'iPhone 14 Pro Max - 2.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      width: 180,
                      height: 180,
                      color: Color.fromARGB(255, 164, 217, 241),
                      alignment: Alignment.center,
                      child: Image.asset(
                        '6 2[Converted] 1.png',
                        scale: 1.1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    ' GREETINGS !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(6.0, 6.0),
                            blurRadius: 0.5,
                            color: Color.fromARGB(104, 32, 32, 32),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (status == 'WARNING: no internet connection')
                          Text(
                            status,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 138, 7, 14),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        Link(
                            target: LinkTarget.self,
                            uri: Uri.parse('http://crossfire-epic.tk/home'),
                            builder: (context, followLink) => ElevatedButton(
                                  onPressed: (() {
                                    if (status == 'connected to internet')
                                      followLink!();
                                    else
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                              title: Text(
                                                "NO INTERNET CONNECTION",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              content: const Text(
                                                  "  please connect to the internet ")));
                                  }),
                                  child: Image.asset('Group 6873.png'),
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(
                                        side: BorderSide(
                                            width: 4.0,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255))),
                                    backgroundColor:
                                        Color.fromARGB(255, 200, 228, 241),
                                    foregroundColor: Colors.white,
                                    elevation: 20,
                                    shadowColor:
                                        Color.fromARGB(255, 165, 205, 238),
                                  ),
                                )),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: Lottie.asset('lf30_editor_5ytlpiif.json')),
                        Text(
                          ' -Reach us-',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Mycall(),
                            SizedBox(
                              width: 40,
                            ),
                            Myemail()
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
