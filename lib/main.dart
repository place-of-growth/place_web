import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
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
    var res = await http.post(Uri.parse('${url_server}/get_events'));
    if (jsonDecode(res.body)['status'] == 'ok') {
      events = jsonDecode(res.body)['events'];
      setState(() {});
    }
    print(events);
  }

  void checkAuth() async {
    Timer.periodic(Duration(seconds: 2), (timer) async {
      var res = await http.post(Uri.parse('${url_server}/auth'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_1.png')),
                SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_1.png')),
                SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_1.png')),
                SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_1.png')),
                SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_1.png')),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035, right: MediaQuery.of(context).size.width * 0.035),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                'Ханты-Мансийск,\nул. Промышленная, 19',
                                style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.w300, color: Colors.white),
                              )),
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '+7 (3467) 388-217',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 28, fontWeight: FontWeight.w300, color: Colors.white, decoration: TextDecoration.underline),
                                  ),
                                  Text(
                                    'tp@tp86.ru',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 28, fontWeight: FontWeight.w300, color: Colors.white, decoration: TextDecoration.underline),
                                  )
                                ],
                              )),
                          Row(
                            children: [
                              Image.asset(
                                'assets/vkIcon.png',
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                'assets/youtubeIcon.png',
                                width: 50,
                                height: 50,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/footerIcons.png',
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          const Spacer(),
                          Text(
                            '© АУ «Технопарк высоких технологий», 2012 — 2023',
                            style: GoogleFonts.montserrat(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ), // Задний фон
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const AppBarProject(),
                    SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_3.png')),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(child: SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_4.png'))),
                    Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 200,
                        ),
                        events == null
                            ? const SizedBox()
                            : Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Image.asset('assets/bg_2.png'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width * 0.035, right: MediaQuery.of(context).size.width * 0.035),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        events.length <= 0
                                            ? const Expanded(child: SizedBox())
                                            : Expanded(
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                  child: Container(
                                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white.withOpacity(0.1),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.white.withOpacity(0.25),
                                                            spreadRadius: 0,
                                                            blurRadius: 84.0,
                                                            offset: const Offset(9, 9),
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.black.withOpacity(0.25),
                                                            spreadRadius: 0,
                                                            blurRadius: 42.0,
                                                            offset: const Offset(-7, -7),
                                                          ),
                                                        ],
                                                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        ClipRRect(
                                                          child: Image.network('$url_server/get_photo_events?image=' + events[0]['photo_event']),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        Container(
                                                          margin: const EdgeInsets.only(left: 20, right: 5, top: 15),
                                                          child: Text(
                                                            events[0]['title_event'],
                                                            style: GoogleFonts.montserrat(
                                                                fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: const EdgeInsets.only(left: 20, right: 5, top: 15, bottom: 15),
                                                          child: Text(
                                                            events[0]['description_event'],
                                                            style: GoogleFonts.montserrat(
                                                                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 18),
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
                                            ? const Expanded(child: SizedBox())
                                            : Expanded(
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                  child: Container(
                                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white.withOpacity(0.1),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.white.withOpacity(0.25),
                                                            spreadRadius: 0,
                                                            blurRadius: 84.0,
                                                            offset: const Offset(9, 9),
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.black.withOpacity(0.25),
                                                            spreadRadius: 0,
                                                            blurRadius: 42.0,
                                                            offset: const Offset(-7, -7),
                                                          ),
                                                        ],
                                                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        ClipRRect(
                                                          child: Image.network('$url_server/get_photo_events?image=' + events[1]['photo_event']),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        Container(
                                                          margin: const EdgeInsets.only(left: 20, right: 5, top: 15),
                                                          child: Text(
                                                            events[1]['title_event'],
                                                            style: GoogleFonts.montserrat(
                                                                fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: const EdgeInsets.only(left: 20, right: 5, top: 15, bottom: 15),
                                                          child: Text(
                                                            events[1]['description_event'],
                                                            style: GoogleFonts.montserrat(
                                                                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 18),
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
                                            ? const Expanded(child: SizedBox())
                                            : Expanded(
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                                  child: Container(
                                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white.withOpacity(0.1),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.white.withOpacity(0.25),
                                                            spreadRadius: 0,
                                                            blurRadius: 84.0,
                                                            offset: const Offset(9, 9),
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.black.withOpacity(0.25),
                                                            spreadRadius: 0,
                                                            blurRadius: 42.0,
                                                            offset: const Offset(-7, -7),
                                                          ),
                                                        ],
                                                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        ClipRRect(
                                                          child: Image.network('$url_server/get_photo_events?image=' + events[2]['photo_event']),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        Container(
                                                          margin: const EdgeInsets.only(left: 20, right: 5, top: 15),
                                                          child: Text(
                                                            events[2]['title_event'],
                                                            style: GoogleFonts.montserrat(
                                                                fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: const EdgeInsets.only(left: 20, right: 5, top: 15, bottom: 15),
                                                          child: Text(
                                                            events[2]['description_event'],
                                                            style: GoogleFonts.montserrat(
                                                                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 18),
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                    Text(
                                      'Смотреть больше',
                                      style: GoogleFonts.montserrat(decoration: TextDecoration.underline, color: Colors.white),
                                    )
                                  ])
                                ],
                              ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(child: SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_5.png'))),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.035,
                      right: MediaQuery.of(context).size.width * 0.025,
                      top: 0,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/bg_6.png',
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035, top: 120),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 20, right: 5, top: 15),
                                    child: Image.asset(
                                      'assets/text_bg_1.png',
                                      width: 300,
                                      height: 70,
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                                  child: Text(
                                    'Выстрой свою траекторию профессионального\nразвития и развития проекта за счёт теста на\nпроверку твоих навыков.',
                                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 34),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20, bottom: 40),
                                  child: TextButton(
                                      onPressed: () {
                                        var phoneController = TextEditingController();
                                        var isCheck = false;
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            bool buttonEnabled = false;
                                            var isCall = 0; // Состояние виджета 0 = ожидает ввода номера телефона, 1 = ожидает звонка от пользователя
                                            return AlertDialog(
                                                contentPadding: const EdgeInsets.all(0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                content: StatefulBuilder(builder: (context, setStateAlert) {
                                                  return Container(
                                                    margin: EdgeInsets.symmetric(
                                                      vertical: MediaQuery.of(context).size.width * 0.02,
                                                      horizontal: MediaQuery.of(context).size.width * 0.02,
                                                    ),
                                                    width: MediaQuery.of(context).size.width * 0.25,
                                                    child: StatefulBuilder(builder: (context, setStateAlert) {
                                                      return Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Вход",
                                                            style: GoogleFonts.montserrat(
                                                                fontSize: 30, fontWeight: FontWeight.w900, color: const Color(0xff7E57C2)),
                                                          ),
                                                          isCall == 0
                                                              ? Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      "Введите номер телефона",
                                                                      style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w500),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 30,
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context).size.width * 0.25,
                                                                      height: 40,
                                                                      child: Container(
                                                                        decoration: const BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.black38,
                                                                              blurRadius: 17,
                                                                              offset: Offset(4, 4),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        child: TextField(
                                                                          controller: phoneController,
                                                                          keyboardType: TextInputType.number,
                                                                          cursorColor: Colors.black,
                                                                          style: GoogleFonts.exo2(fontSize: 16, color: Colors.black),
                                                                          inputFormatters: [
                                                                            MaskedInputFormatter('+7 (###) ###-##-##',
                                                                                allowedCharMatcher: RegExp(r'[0-9]')),
                                                                            LengthLimitingTextInputFormatter(18),
                                                                          ],
                                                                          decoration: InputDecoration(
                                                                            errorBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                  color: const Color(0xFFF7FF88).withOpacity(0), width: 3.0),
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                  color: const Color(0xFFF7FF88).withOpacity(0), width: 3.0),
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color(0xffe5e5e5), width: 1.0),
                                                                              borderRadius: BorderRadius.circular(40),
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Colors.black, width: 1.0),
                                                                              borderRadius: BorderRadius.circular(40),
                                                                            ),
                                                                            hintText: '+7(900)000 00-00',
                                                                            hintStyle: GoogleFonts.montserrat(
                                                                                fontSize: 14,
                                                                                color: Colors.black.withOpacity(0.16),
                                                                                fontWeight: FontWeight.w500),
                                                                            filled: true,
                                                                            fillColor: Colors.white,
                                                                          ),
                                                                          onChanged: (value) {
                                                                            if (value.length == 18) {
                                                                              buttonEnabled = true;
                                                                            } else {
                                                                              buttonEnabled = false;
                                                                            }
                                                                            setStateButtonCallback(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        StatefulBuilder(builder: (context, setStateCheckbox) {
                                                                          setStateCheckboxCallback = setStateCheckbox;
                                                                          return Checkbox(
                                                                            value: isCheck,
                                                                            onChanged: (value) {
                                                                              isCheck = !isCheck;
                                                                              setStateCheckboxCallback(() {});
                                                                              setStateButtonCallback(() {});
                                                                            },
                                                                            fillColor: const MaterialStatePropertyAll(Color(0xff7E57C2)),
                                                                          );
                                                                        }),
                                                                        Text(
                                                                          'Хочу стать интересодержателем системы',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 14,
                                                                              color: const Color(0xff7E57C2)),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 20,
                                                                    ),
                                                                    StatefulBuilder(builder: (context, setStateButton) {
                                                                      setStateButtonCallback = setStateButton;
                                                                      return SizedBox(
                                                                        height: 40,
                                                                        width: MediaQuery.of(context).size.width,
                                                                        child: TextButton(
                                                                            style: TextButton.styleFrom(
                                                                              elevation: 20,
                                                                              backgroundColor: phoneController.text.length == 18 && isCheck == true
                                                                                  ? Color(0xff7E57C2)
                                                                                  : Colors.white,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(18.0),
                                                                                side: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 0.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            onPressed: phoneController.text.length == 18
                                                                                ? () async {
                                                                                    var res = http.post(Uri.parse('$url_server/reg_phone'),
                                                                                        body: {'phone': phoneController.text});
                                                                                    isCall = 1;
                                                                                    setStateAlert(() {});
                                                                                  }
                                                                                : null,
                                                                            child: Text(
                                                                              'Подтвердить номер',
                                                                              style: GoogleFonts.montserrat(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  color: phoneController.text.length == 18 && isCheck == true
                                                                                      ? Colors.white
                                                                                      : Colors.black.withOpacity(0.28)),
                                                                            )),
                                                                      );
                                                                      return AnimatedCrossFade(
                                                                          firstChild: Container(
                                                                            width: MediaQuery.of(context).size.width * 0.25,
                                                                            height: 50,
                                                                            decoration: const BoxDecoration(
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    color: Colors.black38,
                                                                                    blurRadius: 17,
                                                                                    offset: Offset(4, 4),
                                                                                  ),
                                                                                ],
                                                                                color: Color(0xffe5e5e5),
                                                                                borderRadius: BorderRadius.all(Radius.circular(30))),
                                                                            child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text("Подтвердить номер",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        color: Colors.black.withOpacity(0.28),
                                                                                        fontSize: 18)),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          secondChild: MouseRegion(
                                                                            cursor: SystemMouseCursors.click,
                                                                            onEnter: (isHover) {
                                                                              // colorButton = const Color(0xffd0524f);
                                                                              setStateButton(() {});
                                                                            },
                                                                            onExit: (isHover) {
                                                                              // colorButton = const Color(0xffd42d28);
                                                                              setStateButton(() {});
                                                                            },
                                                                            child: GestureDetector(
                                                                              onTap: () {
                                                                                // confirm_phone(phoneController.text);
                                                                                // isResponse = 1;
                                                                                setStateButton(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 0.25,
                                                                                height: 50,
                                                                                decoration: const BoxDecoration(
                                                                                    // color: colorButton,
                                                                                    borderRadius: BorderRadius.all(Radius.circular(30))),
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    // isResponse == 0
                                                                                    //     ?
                                                                                    Text("Подтвердить номер",
                                                                                        textAlign: TextAlign.center,
                                                                                        style: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            color: Colors.black.withOpacity(0.28),
                                                                                            fontSize: 18))
                                                                                    //     : const CircularProgressIndicator(
                                                                                    //   color: Colors.white,
                                                                                    // ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          crossFadeState:
                                                                              buttonEnabled ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                                                          duration: const Duration(milliseconds: 200));
                                                                    }),
                                                                  ],
                                                                )
                                                              : Column(
                                                                  children: [
                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    RichText(
                                                                        textDirection: TextDirection.ltr,
                                                                        text: TextSpan(
                                                                          text: "Для подтверждения входа позвоните по номеру ",
                                                                          style: GoogleFonts.exo2(
                                                                              fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
                                                                          children: <TextSpan>[
                                                                            TextSpan(
                                                                              text: "8 (800) 555-86-07 ",
                                                                              style: GoogleFonts.exo2(
                                                                                  fontSize: 17,
                                                                                  color: const Color(0xff7E57C2),
                                                                                  fontWeight: FontWeight.w500),
                                                                            ),
                                                                            TextSpan(
                                                                              text: "(звонок бесплатный)",
                                                                              style: GoogleFonts.exo2(
                                                                                  fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                    // const CircularProgressIndicator(
                                                                    //   color: Color(0xff7E57C2),
                                                                    // ),
                                                                    Lottie.asset('assets/loading.json', width: 250, height: 250),
                                                                  ],
                                                                ),
                                                          RichText(
                                                              textDirection: TextDirection.ltr,
                                                              text: TextSpan(
                                                                text: "Продолжая, вы соглашаетесь ",
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize: 16, color: const Color(0xff7E7E7E), fontWeight: FontWeight.w500),
                                                                children: <TextSpan>[
                                                                  TextSpan(
                                                                    text: "со сбором и обработкой персональных данных и пользовательским соглашением",
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize: 16, color: const Color(0xff7E57C2), fontWeight: FontWeight.w500),
                                                                  ),
                                                                ],
                                                              )),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                                  );
                                                }));
                                          },
                                        );
                                      },
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(const Color(0xffED006C).withOpacity(0.84)),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: const BorderSide(color: Colors.white, width: 2),
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                                        child: Text(
                                          'СТАРТУЕМ',
                                          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width, child: Image.asset('assets/bg_7.png')),
              ],
            ), // Контент
          ],
        ),
      ),
    );
  }
}
