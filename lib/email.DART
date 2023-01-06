import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Myemail extends StatelessWidget {
  const Myemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(
          'Mail Us',
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
           shape: StadiumBorder(
                                        side: BorderSide(
                                            width: 4.0, color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 104, 198, 241),
          foregroundColor: Colors.white,
          elevation: 30,
          shadowColor: Colors.white,
        ),
        onPressed: () async {
          final TOEMAIL = 'MEDCARE@gmail.com';
          final subject = 'contact us!';
          final message = 'hello medcare i would like to ...';
          final url = 'mailto:$TOEMAIL?subject=${subject}&body=$message';
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
      ),
    );
  }
}
