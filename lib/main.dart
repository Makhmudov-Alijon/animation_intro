import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  int _counter = 0;
  bool isLarge = false;
  double heightAndWeight=200;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),

    vsync: this,
  );

  // Create an animation with value of type "double"
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linearToEaseOut,
  );


  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
     isLarge=true;
     _controller.forward();
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
          duration: const Duration(seconds: 1), // Set the duration here
          color:isLarge ?  const Color(0xff0070F5) : const Color(0xff356C2D),
          child: Stack(


            children: <Widget>[
              AnimatedAlign(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                alignment: Alignment(isLarge ? -0.8:0, isLarge ? -0.5 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      width: isLarge ? 50.0 : 150.0,
                      height: isLarge ? 50.0 : 150.0,
                      child: Image.asset(
                        'assets/havas.png',
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      switchInCurve: Curves.easeInOutCubic,
                      child: Text(
                        isLarge ? 'Доброе утро, \nДруг':"С нами дешево",
                        key: ValueKey<String>("$isLarge"),
                        style: TextStyle(fontSize: isLarge ? 32 :20,color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Stack(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: isLarge ?  Center(
                        child: Image.asset(
                          'assets/sun.png',
                          fit: BoxFit.cover,
                        ),
                      ):SizedBox(),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: isLarge ?  Center(
                        child: RotationTransition(
                          turns: _animation,
                          child: Image.asset(
                            'assets/Group.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ):SizedBox(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     setState(() {
      //       isLarge = !isLarge;
      //     });
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
