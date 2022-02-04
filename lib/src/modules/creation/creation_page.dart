import "package:card_app/src/modules/creation/creation_screen.dart";
import "package:card_app/src/modules/home/bloc/home_cubit.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";

class CreationPage extends StatefulWidget {
  const CreationPage({Key? key}) : super(key: key);

  @override
  _CreationPageState createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  final HomeCubit _cubit = Modular.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: const CreationScreen(),
    );
  }
}
