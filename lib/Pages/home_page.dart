import 'package:flutter/material.dart';
import 'package:mausam_app/workers/work.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Retrieve arguments from route settings
    var arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments is Worker) {
      Worker worker = arguments;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
        ),
        body: Column(
          children: [
            Text('Temperature: ${worker.temp}'),
            Text('Humidity: ${worker.humidity}'),
            Text('Wind Speed: ${worker.airSpeed}'),
            Text('Weather: ${worker.weather}'),
            Text('Description: ${worker.description}'),
            // Add more Text widgets or UI components as needed
          ],
        ),
      );
    } else {
      // Handle the case when arguments are not of type Worker
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Invalid data received."),
        ),
      );
    }
  }
}
