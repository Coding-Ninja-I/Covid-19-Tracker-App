
import 'dart:async';

import 'package:covid_tracker/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{


  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  void dispose()
  {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer for the animation duration on the screen and then moving to the next screen
    Timer(Duration(seconds: 4), () =>Navigator.push(context, MaterialPageRoute(builder: (context) => WorldStateScreen())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image(image: AssetImage('images/virus.png')),
                  ),
                ),
                builder: (BuildContext context, Widget? child){
                  return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi ,
                      child: child,
                  );
                },
                ),
            //SizedBox(height: MediaQuery.of(context).size.height * 08,),
            SizedBox(height: 80,),
            Align(
                alignment: Alignment.center,
                child: const Text ("Covid-19 Tracker App",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                    , letterSpacing: 2,color: Colors.teal),))

          ],
        ),
      ),
    );
  }
}
