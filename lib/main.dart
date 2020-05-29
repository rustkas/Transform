import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Transform Widget";
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Slider(
            min: 0.0,
            max: MediaQuery.of(context).size.width / 2,
            activeColor: Colors.purple,
            inactiveColor: Colors.purpleAccent,
            value: sliderValue,
            onChanged: (newValue) {
              setState(() {
                sliderValue = newValue;
              });
            },
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Center(
                  child: Transform.rotate(
                    angle: sliderValue * math.pi / 160,
                    child: Container(
                      color: Colors.grey,
                      height: 75.0,
                      width: 75.0,
                      child: Center(
                        child: Text(
                          'Rotate',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Center(
                  child: Transform.scale(
                    scale: sliderValue / 120,
                    child: Container(
                      color: Colors.purple,
                      height: 75.0,
                      width: 75.0,
                      child: Center(
                          child: Text(
                        "Scale",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Row(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(sliderValue * 1.0, 0.0),
                      child: Container(
                        color: Colors.black,
                        height: 75.0,
                        width: 75.0,
                        child: Center(
                            child: Text(
                          "Translate",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
