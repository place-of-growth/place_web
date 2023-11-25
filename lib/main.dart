import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:place_of_growth/appBarProject.dart';
import 'package:http/http.dart' as http;
import 'package:place_of_growth/globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  void initState() {
    super.initState();
    getEvents();
  }

  void getEvents() async {
    var res = await http.post(Uri.parse('${url_server}get_events'));
    if (jsonDecode(res.body)['status'] == 'ok') {
      events = jsonDecode(res.body)['events'];
      setState(() {});
    }
    print(events);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(child: Container(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_1.png'))),
            Column(
              children: <Widget>[
                AppBarProject(),
                events == null
                    ? SizedBox()
                    : Column(
                        children: [
                          Text(
                            'АФИША МЕРОПРИЯТИЙ',
                            style: GoogleFonts.montserrat(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 60),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035, right: MediaQuery.of(context).size.width * 0.035),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                events.length <= 0
                                    ? Expanded(child: SizedBox())
                                    : Expanded(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16, right: 16, top: 14),
                                            decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.37),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white.withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 84.0,
                                                    offset: Offset(9, 9),
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 42.0,
                                                    offset: Offset(-7, -7),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(Radius.circular(30))),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  child: Image.network(url_server + 'get_photo_events?image=' + events[0]['photo_event']),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20, right: 5, top: 15),
                                                  child: Text(
                                                    events[0]['title_event'],
                                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20, right: 5, top: 15, bottom: 15),
                                                  child: Text(
                                                    events[0]['description_event'],
                                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 18),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.05,
                                ),
                                events.length <= 1
                                    ? Expanded(child: SizedBox())
                                    : Expanded(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16, right: 16, top: 14),
                                            decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.37),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white.withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 84.0,
                                                    offset: Offset(9, 9),
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 42.0,
                                                    offset: Offset(-7, -7),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(Radius.circular(30))),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  child: Image.network(url_server + 'get_photo_events?image=' + events[1]['photo_event']),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20, right: 5, top: 15),
                                                  child: Text(
                                                    events[1]['title_event'],
                                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20, right: 5, top: 15, bottom: 15),
                                                  child: Text(
                                                    events[1]['description_event'],
                                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 18),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.05,
                                ),
                                events.length <= 2
                                    ? Expanded(child: SizedBox())
                                    : Expanded(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16, right: 16, top: 14),
                                            decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.37),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white.withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 84.0,
                                                    offset: Offset(9, 9),
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 42.0,
                                                    offset: Offset(-7, -7),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(Radius.circular(30))),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  child: Image.network(url_server + 'get_photo_events?image=' + events[2]['photo_event']),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20, right: 5, top: 15),
                                                  child: Text(
                                                    events[2]['title_event'],
                                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20, right: 5, top: 15, bottom: 15),
                                                  child: Text(
                                                    events[2]['description_event'],
                                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 18),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
