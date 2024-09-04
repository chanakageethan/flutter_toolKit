import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

final ZoomDrawerController z = ZoomDrawerController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 0,
      style: DrawerStyle.defaultStyle,
      showShadow: false,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * .65,
      duration: const Duration(milliseconds: 500),
      angle: 0.0,
      mainScreen: MainScreen(),
      menuScreen: const MenuScreen(),
      mainScreenOverlayColor: Colors.black.withOpacity(0.5),
      mainScreenScale: 0.0,
      menuScreenWidth: MediaQuery.of(context).size.width * .65,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;
  final _tween = Tween(
    begin: const Duration(hours: 1),
    end: Duration.zero,
  );

  Future<void> addShared() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
    setState(() {});
  }

  Future<int> getValue() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('counter') ?? 0;
  }

  void _incrementCounter() {
    _counter++;
    addShared();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text("Test App"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            z.toggle!();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            TweenAnimationBuilder<Duration>(
              duration: const Duration(hours: 1),
              tween: _tween,
              builder: (_, Duration value, __) => Text(value.toString()),
            ),
            FutureBuilder(
              future: getValue(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return const Text('noData');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: const Scaffold(
        backgroundColor: Colors.indigo,
        body: Padding(
          padding: EdgeInsets.only(left: 25),
          child: Center(
            child: Text(
              'kkkk',
            ),
          ),
        ),
      ),
    );
  }
}
