import "package:card_app/src/modules/creation/creation_page.dart";
import "package:card_app/src/modules/home/bloc/home_cubit.dart";
import "package:card_app/src/modules/home/home_page.dart";
import "package:card_app/src/modules/splash/splash_screen.dart";
import "package:flutter_modular/flutter_modular.dart";

const String splashRoute = "/";
const String homeRoute = "/home";
const String creationRoute = "/creation";

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(splashRoute, child: (context, args) => const SplashScreen()),
    ChildRoute(homeRoute, child: (context, args) => const HomePage()),
    ChildRoute(creationRoute, child: (context, args) => const CreationPage()),
  ];
}
