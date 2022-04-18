import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int initialIndex = 0;
  final _sizeprice = {
      20.0: 200.0,
      30.0: 250.5,
      40.0: 300.0,
      50.0: 400.0,
  };
  final _souses = {
    1:15,
    2:13,
    3:14,
  };

  int _testo = 1;
  Color bluecol = const Color(0xff0079D0);
  String Titleapp = "Калькулятор пиццы";
  int _sous = 1;
  bool _isCheese = true;
  double _selpizzasize = 20.0;
  double? _pizzaprice = 0.0;

  double? _price(){
    setState(() {
      _pizzaprice = _sizeprice[_selpizzasize];
      if (_testo == 1){
        _pizzaprice = _pizzaprice! + 150;
      }
      if(_isCheese){
        _pizzaprice = _pizzaprice! + 120;
      }
      _pizzaprice = _pizzaprice! + _souses[_sous]!;
    });
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: const [
                Expanded(child: SizedBox()),
                SizedBox(
                  child: Image(
                      image: AssetImage('assets/pizza1.png')),
                  //Placeholder(),
                  width: 232,
                  height: 123,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              Titleapp,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Выбери параметры:",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ToggleSwitch(
              minWidth: 300.0,
              cornerRadius: 20.0,
              activeBgColors: [[bluecol], [bluecol]],
              activeFgColor: const Color(0xffECEFF1),
              inactiveBgColor: const Color(0xffECEFF1),
              inactiveFgColor: Colors.black,
              initialLabelIndex: initialIndex,
              totalSwitches: 2,
              labels: const ['Обычное тесто', 'Тонкое тесто'],
              radiusStyle: true,
              onToggle: (index) {
                 print('switched to: $index');
                 setState(() {
                    _testo = index!;
                    initialIndex = index;
                    _price();
                 });
                 },
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding( // "Размер"
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: const [
                  Text('Размер:', style: TextStyle(fontSize: 18),),
                  Expanded(child: SizedBox()),

                ],
              ),
            ),
            Padding(   // Выбор размера пиццы
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(children: [
                Text('$_selpizzasize см',
                style: const TextStyle(
                  fontSize: 25.0,
                ),),
                Slider(
                  min: 20,
                  max: 50,
                  activeColor: bluecol,
                  inactiveColor: Colors.white,
                  value: _selpizzasize,
                  divisions: 3,
                  onChanged: (v){
                    setState(() {
                      _selpizzasize = v;
                      print(v);
                      _price();
                    });
                  },
                ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: const [
                  Text('Соус:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,), ),
                  Expanded(child: SizedBox()),

                ],
              ),
            ),  // текст "соус"
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: .5
                        ),
                      ),
                  ),
                  child: Row(
                    children: [
                      const Text('Острый'),
                      const Expanded(child: SizedBox()),
                      Radio(
                          activeColor: Colors.green,
                          value: 1,
                          groupValue: _sous,
                          onChanged: (value){
                            setState(() {
                              _sous = 1;
                              _price();
                            });
                          },
                      ),
                    ]
                  ),
                ),
            ),  // соус острый "1"
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: .5
                    ),
                  ),
                ),
                child: Row(
                    children: [
                      const Text('Кисло-сладкий'),
                      const Expanded(child: SizedBox()),
                      Radio(
                        activeColor: Colors.green,
                        value: 2,
                        groupValue: _sous,
                        onChanged: (value){
                          setState(() {
                            _sous = 2;
                            _price();
                          });
                        },
                      ),
                    ]
                ),
              ),
            ),  // соус кислосладкий "2"
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: 1
                    ),
                  ),
                ),
                child: Row(
                    children: [
                      const Text('Сырный'),
                      Expanded(child: const SizedBox()),
                      Radio(
                        activeColor: Colors.green,
                        value: 3,
                        groupValue: _sous,
                        onChanged: (value){
                          setState(() {
                            _sous = 3;
                            _price();
                          });
                        },
                      ),
                    ]
                ),
              ),
            ),  // соус сырный "3"
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
              child: Container(
                color: const Color(0xFFF0F0F0),
                child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          child: Image(
                              image: AssetImage('assets/cheese.png')),
                          //Placeholder(),
                          width: 36,
                          height: 34,
                        ),
                      ),
                      const Expanded(
                        child: Text('Дополнительный сыр',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),),
                      ),
                      Switch(
                        activeColor: bluecol,
                          value: _isCheese,
                          onChanged: (value) {
                            setState(() {
                              _isCheese = value;
                              _price();
                            });
                          }),
                    ]
                ),
              ),
            ),   // Дополнительный сыр
            Padding(   // Выбор размера пиццы
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(children: [
                Row(
                  children: [
                    Text('Стоимость:')
                  ],
                ),
                Text('$_pizzaprice руб.',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
