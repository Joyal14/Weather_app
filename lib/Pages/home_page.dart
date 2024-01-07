import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mausam_app/workers/work.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  // Method to handle the search functionality
  void search() async {
    String searchText = searchController.text;

    // Perform any additional validation or processing if needed

    // Navigate to the LoadingPage with the search text
    Navigator.pushNamed(context, "/loading_page", arguments: {
      "searchText": searchText,
    });
  }

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
      String temp = worker.temp.toString().substring(0, 2);
      String speed = worker.airSpeed.toString().substring(0, 2);
      if (temp == "NA") {
        print("NA");
      } else {
        temp = worker.temp.toString().substring(0, 4);
        speed = worker.airSpeed.toString().substring(0, 4);
      }
      String icon = worker.icons;

      String percentage = worker.humidity.toString();

      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 99, 177),
          title: const Text(
            "Weather App",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                    controller: searchController,
                    onChanged: (String q) {},
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                        hintText: "Search $city",
                        prefixIcon: GestureDetector(
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") ==
                                "") {
                              print("blank search");
                            } else {
                              Navigator.pushNamed(
                                context,
                                "/loading_page",
                                arguments: {
                                  "searchText": searchController.text
                                },
                              );
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                        ),
                        border: border,
                        enabledBorder: border,
                        fillColor: const Color.fromARGB(223, 255, 255, 255),
                        filled: true),
                  ),
                ),
                Card(
                  color: Colors.white.withOpacity(0.7),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 90,
                    width: 350, // Set the desired height
                    padding: const EdgeInsets.all(18),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://openweathermap.org/img/wn/$icon@2x.png',
                          scale: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                worker.description,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "In ${worker.locations}", // Replace with actual temperature data
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white.withOpacity(0.7),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 250,
                    width: 350, // Set the desired height
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.thermostat,
                          size: 32.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                temp,
                                style: const TextStyle(
                                    fontSize: 90, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "C",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.white.withOpacity(0.7),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 170,
                            width: 100, // Set the desired height
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.air,
                                  size: 40,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  speed, // Replace with actual temperature data
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'Km/hr', // Replace with actual temperature data
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.white.withOpacity(0.7),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 170,
                            width: 100, // Set the desired height
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.water,
                                  size: 40,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  percentage,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Precent', // Replace with actual temperature data
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Dsiplays the arguments from the routes
                // Text('Humidity: ${worker.humidity}'),
                // Text('Wind Speed: ${worker.airSpeed}'),
                // Text('Weather: ${worker.weather}'),
                // Text('Description: ${worker.description}'),
                // Add more Text widgets or UI components as needed
              ],
            ),
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
