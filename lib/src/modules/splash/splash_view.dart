import "dart:async";
import "package:card_app/src/app_module.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Modular.to.navigate(homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.indigo),
          ),
          Image.asset(
            "assets/image_1.png",
            height: 100,
            width: 200,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Opacity(
                      opacity: 0.8,
                      child: Container(
                        height: 120.0,
                        width: 270.0,
                        decoration: const BoxDecoration(
                          color: Colors.white60,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Cardmag",
                              style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
