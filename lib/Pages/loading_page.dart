import 'package:flutter/material.dart';
import 'package:mausam_app/workers/work.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late Worker worker;
  String city = "Udupi";
  void start() async {
    Worker instance = Worker(locations: city);
    await instance.getData();
    setState(() {
      worker = instance;
    });

    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
        context,
        '/home_page',
        arguments: worker,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(63, 63, 63, 1),
      body: Center(
        child: SafeArea(
          child: Column(children: [
            Image.asset(
              "images/Weather-Background-PNG.png",
              height: 380,
              width: 380,
            ),
            const Text(
              "Weather App",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "By Joyal Dsilva",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            const SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          ]),
        ),
      ),
    );
  }
}
