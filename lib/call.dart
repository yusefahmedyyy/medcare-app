import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Mycall extends StatelessWidget {
  const Mycall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(
          'Message Us',
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          shape:
              StadiumBorder(side: BorderSide(width: 4.0, color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 104, 198, 241),
          foregroundColor: Colors.white,
          elevation: 30,
          shadowColor: Color.fromARGB(255, 254, 255, 255),
        ),
        onPressed: () async {
          final phonenumber = '02001156558242';
          final url = 'sms:$phonenumber';
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
      ),
    );
  }
}
