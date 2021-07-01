import 'package:flutter/material.dart';
import 'package:filepicker_windows/filepicker_windows.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q-Flasher',
      home: const MyHomePage(title: 'Q-Flasher Demo'),
      theme: _buildShrineTheme(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

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
  TextEditingController _editingController;
  int _counter = 0;

  void _incrementCounter() {
    _editingController = TextEditingController(text: "Bin");
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final int count = 4;
  String Board = 'Web:Bit';
  String Serial = '115200';
  String Port = 'COM1';
  String Mode = 'Erase';
  @override
  Widget build(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      title: Text('About Me'),
      content: Text('Made by Qubot.1445788683@qq.com'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    );
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          DropdownButton(
            value: Mode,
            items: <DropdownMenuItem>[
              DropdownMenuItem(
                value: 'Erase',
                child: const Text('擦除'),
              ),
              DropdownMenuItem(
                value: 'Programing',
                child: const Text('烧写'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                Mode = value;
                if (Mode == 'Programing') {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SecondScreen()),
                  );
                }
              });
            },
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('开发板设置'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('开发板'),
                      DropdownButton(
                        value: Board,
                        items: <DropdownMenuItem>[
                          DropdownMenuItem(
                            value: 'Web:Bit',
                            child: const Text('Web:Bit'),
                          ),
                          DropdownMenuItem(
                            value: 'Web:AI-ESP8285',
                            child: const Text('Web:AI-ESP8285'),
                          ),
                          DropdownMenuItem(
                            value: 'Web:AI-K210',
                            child: const Text('Web:AI-K210'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            Board = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('串口设置'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('端口'),
                      DropdownButton(
                        value: Port,
                        items: <DropdownMenuItem>[
                          DropdownMenuItem(
                            value: 'COM1',
                            child: const Text('COM1'),
                          ),
                          DropdownMenuItem(
                            value: 'COM2',
                            child: const Text('COM2'),
                          ),
                          DropdownMenuItem(
                            value: 'COM3',
                            child: const Text('COM3'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            Port = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('波特率'),
                      DropdownButton(
                        value: Serial,
                        items: <DropdownMenuItem>[
                          DropdownMenuItem(
                            value: '9600',
                            child: const Text('9600'),
                          ),
                          DropdownMenuItem(
                            value: '115200',
                            child: const Text('115200'),
                          ),
                          DropdownMenuItem(
                            value: '1152000',
                            child: const Text('1152000'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            Serial = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Bin:'),
                      VerticalDivider(),
                      Expanded(
                        child: TextField(
                          controller: _editingController,
                        ),
                      ),
                      VerticalDivider(),
                      OutlinedButton(
                        onPressed: () {
                          final file = OpenFilePicker()
                            ..filterSpecification = {
                              'Bin (*.bin)': '*.bin',
                              'svg (*.svg)': '*.svg',
                              'Word Document (*.doc)': '*.doc',
                              'Web Page (*.htm; *.html)': '*.htm;*.html',
                              'Text Document (*.txt)': '*.txt',
                              'All Files': '*.*'
                            }
                            ..defaultFilterIndex = 0
                            ..defaultExtension = 'doc'
                            ..title = 'Select a document';

                          final result = file.getFile();
                          if (result != null) {
                            _editingController.text = result.path;
                            print(result.path);
                          }
                          // Respond to button press
                        },
                        child: Text("..."),
                      ),
                      VerticalDivider(),
                      Text('@'),
                      VerticalDivider(),
                      Container(width: 80.0, child: TextField())
                    ],
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SecondScreen()),
                );
                // Respond to button press
              },
              child: Text("Start"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(context: context, builder: (context) => dialog);
        },
        tooltip: 'About',
        child: const Icon(Icons.help_outline),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Launch new screen'),
          onPressed: () {
            // Navigate to second screen when tapped!
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String Mode = 'Programing';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
        actions: [
          DropdownButton(
            value: Mode,
            items: <DropdownMenuItem>[
              DropdownMenuItem(
                value: 'Erase',
                child: const Text('擦除'),
              ),
              DropdownMenuItem(
                value: 'Programing',
                child: const Text('烧写'),
              ),
            ],
            onChanged: (value) {
              Mode = value;
              if (Mode == 'Erase') {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: new Text('Go back!'),
        ),
      ),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: shrinePink100,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
