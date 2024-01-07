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

  @override
  void initState() {
    super.initState();
    start(city);
  }

  void start(String city) async {
    Worker instance = Worker(locations: city);

    try {
      // Check if the widget is still mounted before calling setState
      if (mounted) {
        await instance.getData();

        setState(() {
          worker = instance;
        });

        Future.delayed(const Duration(seconds: 2), () {
          // Check if the widget is still mounted before navigating
          if (mounted) {
            Navigator.pushReplacementNamed(
              context,
              '/home_page',
              arguments: worker,
            );
          }
        });
      }
    } catch (e) {
      // Handle any errors that might occur during async operations
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extracting the city from the arguments
    Map<String, dynamic>? search =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (search?.isNotEmpty ?? false) {
      city = search?['searchText'];
    }
    start(city);

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
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "By Joyal Dsilva",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
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
