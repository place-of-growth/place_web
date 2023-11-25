import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarProject extends StatefulWidget {
  const AppBarProject({super.key});

  @override
  State<AppBarProject> createState() => _AppBarProjectState();
}

class _AppBarProjectState extends State<AppBarProject> {
  var eventStyle = GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 26, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Text(
            'На взлёт!',
            style: eventStyle,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Text(
            'Афиша',
            style: eventStyle,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Text(
            'Участнику',
            style: eventStyle,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Text(
            'Меры поддержки',
            style: eventStyle,
          ),
          Spacer(),
          Image.asset(
            'assets/auth.png',
            width: 40,
            height: 40,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
        ],
      ),
    );
  }
}
