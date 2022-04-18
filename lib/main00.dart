import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Flutter Switch Example"),
      ),
      body: Center(
        child: ToggleSwitch(
          minWidth: 300.0,
          cornerRadius: 20.0,
          activeBgColors: [[Color(0xff0079D0)], [Color(0xff0079D0)]],
          activeFgColor: Color(0xffECEFF1),
          inactiveBgColor: Color(0xffECEFF1),
          inactiveFgColor: Colors.black,
          initialLabelIndex: 1,
          totalSwitches: 2,
          labels: ['Обычное тест', 'Тонкое тесто'],
          radiusStyle: true,
          onToggle: (index) {
            print('switched to: $index');
          },
        ),

      ),
    );
  }
}