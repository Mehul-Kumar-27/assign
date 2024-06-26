// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assign/components/confirm_drive.dart';
import 'package:assign/components/driver_details.dart';
import 'package:assign/components/select_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:assign/components/dragable_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
              options: const MapOptions(
                  initialCenter: LatLng(51.5, -0.09),
                  initialZoom: 13,
                  interactionOptions: InteractionOptions(
                    flags: ~InteractiveFlag.doubleTapZoom,
                  )),
              children: [
                openTileLayer,
              ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const DriverDetails(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)))),
                tooltip: 'Increment',
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const ConfirmDrive(),
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)))),
                tooltip: 'Increment',
                child: const Icon(
                  Icons.car_rental_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => buildScroableSheet(),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)))),
          tooltip: 'Increment',
          child: const Icon(Icons.search, color: Colors.white),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildScroableSheet() {
    double size = 0.9;

    return DraggableScrollableSheet(
        initialChildSize: size,
        builder: (context, ScrollController controller) => Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SelectAddress(
              onTap: () {
                Navigator.pop(context);
              },
            )));
  }
}

TileLayer get openTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
