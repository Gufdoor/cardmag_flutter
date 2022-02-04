import "package:card_app/src/domain/card_model.dart";
import "package:card_app/src/i18n/strings.g.dart";
import "package:card_app/src/modules/home/bloc/home_cubit.dart";
import "package:card_app/src/modules/home/bloc/home_state.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CreationScreen extends StatefulWidget {
  const CreationScreen({Key? key}) : super(key: key);

  @override
  _CreationScreenState createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  final _myNameController = TextEditingController();
  final _myNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _myNameController.dispose();
    _myNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            t.creationScreen.title,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        backgroundColor: Colors.indigo,
        body: SingleChildScrollView(
          child: Center(
            child: SafeArea(
              left: true,
              top: true,
              right: true,
              bottom: true,
              minimum: const EdgeInsets.all(5.0),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            width: 90.0,
                            height: 90.0,
                            child: ElevatedButton(
                              child: Text(
                                t.creationScreen.creditButton,
                                style: TextStyle(
                                    color:
                                        state.currentCardType == CardType.credit
                                            ? Colors.indigo
                                            : Colors.white,
                                    fontSize: 16.0),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary:
                                    state.currentCardType == CardType.credit
                                        ? Colors.lightGreenAccent
                                        : Colors.indigo,
                                onPrimary: Colors.black,
                                shadowColor: Colors.black,
                                elevation: 8,
                                shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                print("Credit button tapped");
                                context.read<HomeCubit>().handleCardType();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 90.0,
                            height: 90.0,
                            child: ElevatedButton(
                              child: Text(
                                t.creationScreen.debitButton,
                                style: TextStyle(
                                    color:
                                        state.currentCardType == CardType.debit
                                            ? Colors.indigo
                                            : Colors.white,
                                    fontSize: 16.0),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: state.currentCardType == CardType.debit
                                    ? Colors.lightGreenAccent
                                    : Colors.indigo,
                                onPrimary: Colors.black,
                                shadowColor: Colors.black,
                                elevation: 8,
                                shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                print("Debit button tapped");
                                context.read<HomeCubit>().handleCardType();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 0),
                        child: TextFormField(
                          controller: _myNameController,
                          style: const TextStyle(color: Colors.white70),
                          maxLength: 30,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[A-Z a-z]")),
                          ],
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: t.creationScreen.nameForm,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 16),
                        child: TextFormField(
                          controller: _myNumberController,
                          style: const TextStyle(color: Colors.white70),
                          maxLength: 19,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9 ]")),
                          ],
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: t.creationScreen.numberForm,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 45.0,
                            width: 115.0,
                            child: ElevatedButton(
                              child: Text(
                                t.creationScreen.cancelButton,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                  onPrimary: Colors.indigo,
                                  shadowColor: Colors.black,
                                  elevation: 3,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(3),
                                  ))),
                              onPressed: () {
                                print("Cancel button tapped");
                                context.read<HomeCubit>().redirectToHome();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 45.0,
                            width: 115.0,
                            child: ElevatedButton(
                              child: Text(
                                t.creationScreen.createButton,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigoAccent,
                                  onPrimary: Colors.indigo,
                                  shadowColor: Colors.black,
                                  elevation: 3,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(3),
                                  ))),
                              onPressed: () async {
                                print("Create button tapped");
                                context.read<HomeCubit>().createCard(
                                    ownerName: _myNameController.text,
                                    cardNumber: _myNumberController.text);
                                context.read<HomeCubit>().redirectToHome();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
