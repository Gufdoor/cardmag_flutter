import "package:card_app/src/i18n/strings.g.dart";
import "package:card_app/src/modules/home/bloc/home_cubit.dart";
import "package:card_app/src/modules/home/bloc/home_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            t.homeScreen.title,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        backgroundColor: Colors.indigo,
        body: Center(
          child: SafeArea(
            left: true,
            top: true,
            right: true,
            bottom: true,
            minimum: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 92.5,
                          height: 48,
                          child: ElevatedButton(
                            child: Text(t.homeScreen.englishButton,
                                style: TextStyle(
                                    color:
                                        state.languageSelected == AppLocale.en
                                            ? Colors.indigo
                                            : Colors.white70,
                                    fontSize: 20.0)),
                            style: ElevatedButton.styleFrom(
                              primary: state.languageSelected == AppLocale.en
                                  ? Colors.lightBlueAccent
                                  : Colors.indigo,
                              onPrimary: Colors.black,
                              shadowColor: Colors.black,
                              elevation: 3,
                              shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3),
                                ),
                              ),
                            ),
                            onPressed: () {
                              print("English selected");
                              context
                                  .read<HomeCubit>()
                                  .handleSelectedLanguage(0);
                              setState(() {
                                LocaleSettings.setLocale(AppLocale.en);
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 92.5,
                          height: 48,
                          child: ElevatedButton(
                            child: Text(t.homeScreen.portugueseButton,
                                style: TextStyle(
                                    color:
                                        state.languageSelected == AppLocale.br
                                            ? Colors.indigo
                                            : Colors.white70,
                                    fontSize: 20.0)),
                            style: ElevatedButton.styleFrom(
                              primary: state.languageSelected == AppLocale.br
                                  ? Colors.yellowAccent
                                  : Colors.indigo,
                              onPrimary: Colors.black,
                              shadowColor: Colors.black,
                              elevation: 3,
                              shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3),
                                ),
                              ),
                            ),
                            onPressed: () {
                              print("Portuguese selected");
                              context
                                  .read<HomeCubit>()
                                  .handleSelectedLanguage(1);
                              setState(() {
                                LocaleSettings.setLocale(AppLocale.br);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  width: 250,
                  height: 48,
                  child: ElevatedButton(
                    child: Text(
                      t.homeScreen.createButton,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
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
                    onPressed: () {
                      print("Loading creation screen...");

                      context.read<HomeCubit>().redirectToCreation();
                    },
                  ),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 250,
                      height: 48,
                      child: ElevatedButton(
                        child: Text(
                            state.isDataVisible
                                ? t.homeScreen.dataRevealedButton
                                : t.homeScreen.dataHiddenButton,
                            style: TextStyle(
                                color: state.isDataVisible
                                    ? Colors.indigo
                                    : Colors.white,
                                fontSize: 20.0)),
                        style: ElevatedButton.styleFrom(
                          primary: state.isDataVisible
                              ? Colors.lightGreenAccent
                              : Colors.indigo,
                          onPrimary: Colors.black,
                          shadowColor: Colors.black,
                          elevation: 3,
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("View data button tapped");
                          // LocaleSettings.setLocale(AppLocale.en);
                          context.read<HomeCubit>().handleDataView();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 280.0,
                        width: 320.0,
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            if (state.status == HomeStatus.loading) {
                              return const CircularProgressIndicator();
                            } else if (state.listCardModel!.isEmpty &&
                                state.status == HomeStatus.initial) {
                              return Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          t.homeScreen.noCardFound,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return _buildCard();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.listCardModel!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Container(
            height: 140.0,
            decoration: const BoxDecoration(
              color: Colors.indigoAccent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 2.0,
                  offset: Offset(0.0, 2.0),
                ),
              ],
            ),
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 75.0,
                    ),
                    Text(
                      state.isDataVisible
                          ? state.listCardModel![index].ownerName!
                          : t.homeScreen.hiddenCard,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      child: Text(
                        state.listCardModel![index].cardNumber!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      visible: state.isDataVisible,
                    ),
                    Visibility(
                      child: Text(
                        context
                            .read<HomeCubit>()
                            .cleanCardType(state.listCardModel![index].type!),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      visible: state.isDataVisible,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
