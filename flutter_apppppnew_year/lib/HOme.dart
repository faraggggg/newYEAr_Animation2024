// home_page.dart

// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfettiController _confettiControllerLeft;
  late ConfettiController _confettiControllerRight;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _confettiControllerLeft = ConfettiController(duration: const Duration(seconds: 10));
    _confettiControllerRight = ConfettiController(duration: const Duration(seconds: 10));

    showBanner();
  }

  @override
  void dispose() {
    _confettiControllerLeft.dispose();
    _confettiControllerRight.dispose();
    super.dispose();
  }

  showBanner() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _visible = true;
        _confettiControllerLeft.play();
        _confettiControllerRight.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.HeSpRl5tqtXB1O1ufyl4EAAAAA?pid=ImgDet&w=199&h=299&c=7&dpr=2"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedScale(
            scale: _visible ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Container(
              padding: const EdgeInsets.only(bottom: 250),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 244, 245, 245),
                  ),
                  children: [
                    TextSpan(
                      text: "HAPPY NEW YEAR \n",
                      style: GoogleFonts.jua(
                        textStyle: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextSpan(
                      text: "2024",
                      style: GoogleFonts.jua(
                        textStyle: const TextStyle(
                            fontSize: 140, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _confettiControllerLeft,
              blastDirection: -pi / 3,
              emissionFrequency: 0.01,
              numberOfParticles: 10,
              maximumSize: const Size(20, 10),
              maxBlastForce: 40,
              minBlastForce: 30,
              gravity: 0.1,
              shouldLoop: true,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _confettiControllerRight,
              blastDirection: -3 * pi / 4,
              emissionFrequency: 0.01,
              numberOfParticles: 10,
              maximumSize: const Size(20, 10),
              maxBlastForce: 40,
              minBlastForce: 30,
              gravity: 0.1,
              shouldLoop: true,
            ),
          ),
        ],
      ),
    );
  }
}
