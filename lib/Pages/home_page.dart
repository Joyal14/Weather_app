import 'dart:math';

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
    var cityName = [
      "Mumbai",
      "Udupi",
      "Londan",
      "New York",
      "Dehli",
      "Japan",
      "Spain"
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(254, 254, 254, 1),
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    );

    // Retrieve arguments from route settings
    var arguments = ModalRoute.of(context)?.settings.arguments;
    // Checks the arguments
    if (arguments is Worker) {
      Worker worker = arguments;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 99, 177),
          title: const Text(
            "Weather App",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 3, 99, 177),
                  Color.fromARGB(255, 33, 190, 225)
                ]),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  onChanged: (String q) {},
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                      hintText: "Search $city",
                      prefixIcon: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                      border: border,
                      enabledBorder: border,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      filled: true),
                ),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         height: 65,
              //         padding: const EdgeInsets.all(10),
              //         margin: const EdgeInsets.symmetric(
              //             horizontal: 20, vertical: 8),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: Colors.white.withOpacity(0.5)),
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 10, vertical: 13),
              //           child: Text('Temperature: ${worker.temp}'),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      elevation:
                          5, // Optional: Add elevation for a shadow effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Temperature',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              worker.temp,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      elevation:
                          5, // Optional: Add elevation for a shadow effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Temperature',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 200),
                            Text(
                              worker.temp,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Temperature',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '25°C', // Replace with actual temperature data
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '60%', // Replace with actual humidity data
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Dsiplays the arguments from the routes
              Text('Humidity: ${worker.humidity}'),
              Text('Wind Speed: ${worker.airSpeed}'),
              Text('Weather: ${worker.weather}'),
              Text('Description: ${worker.description}'),
              // Add more Text widgets or UI components as needed
            ],
          ),
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
