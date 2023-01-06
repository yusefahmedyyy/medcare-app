import 'package:flutter/material.dart';
import 'main.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'WELCOME',
        style: TextStyle(fontSize: 35),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(side: BorderSide(width: 2.0, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 104, 198, 241),
        foregroundColor: Colors.white,
        elevation: 30,
        shadowColor: Color.fromARGB(255, 65, 162, 241),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: 'MED CARE',
                )));
      },
    );
  }
}
