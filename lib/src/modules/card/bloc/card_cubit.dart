import "dart:convert";

import "package:card_app/src/app_module.dart";
import "package:card_app/src/domain/card_model.dart";
import "package:card_app/src/i18n/strings.g.dart";
import "package:card_app/src/modules/card/bloc/card_state.dart";
import "package:card_app/src/shared/shared_preferences/shared_preferences_service.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  late List<CardModel> _listCardModel = [];
  late bool isLoaded = false;

  Future<List<CardModel>> loadCard() async {
    String? data = await SharedPreferencesService.get(key: "cardList");

    try {
      List<dynamic> _listMap = jsonDecode(data!);

      for (final element in _listMap) {
        _listCardModel.add(CardModel.fromJson(element));
      }
    } catch (e) {
      _listCardModel = [];
    }

    return _listCardModel;
  }

  void init() async {
    if (!isLoaded) {
      _listCardModel = await loadCard();
      emit(state.copyWith(
          status: HomeStatus.initial,
          languageSelected: AppLocale.en,
          listCardModel: _listCardModel,
          currentCardType: state.currentCardType));
      isLoaded = true;
    }
  }

  String cleanCardType(CardType cardType) {
    switch (cardType) {
      case CardType.credit:
        return t.homeScreen.creditCard;
      case CardType.debit:
        return t.homeScreen.debitCard;
      case CardType.notDefined:
        return "";
    }
  }

  void createCard(
      {required String ownerName, required String cardNumber}) async {
    CardModel newCard = CardModel(
      ownerName: ownerName,
      cardNumber: cardNumber,
      type: state.currentCardType,
    );

    _listCardModel.add(newCard);
    List<Map<String, dynamic>> _listMap = [];

    for (final element in _listCardModel) {
      _listMap.add(element.toMap());
    }

    SharedPreferencesService.saveList(data: _listMap, key: "cardList");
  }

  void handleCardType() {
    CardType? _currentCardType;
    if (state.currentCardType == CardType.credit) {
      _currentCardType = CardType.debit;
    } else if (state.currentCardType == CardType.debit) {
      _currentCardType = CardType.credit;
    }
    emit(state.copyWith(currentCardType: _currentCardType));
  }

  void handleDataView() {
    bool _isDataVisible = !state.isDataVisible;
    emit(state.copyWith(isDataVisible: _isDataVisible));
  }

  void handleSelectedLanguage(AppLocale appLocale) {
    LocaleSettings.setLocale(appLocale);
    emit(state.copyWith(languageSelected: appLocale));
  }

  void redirectToCreation() {
    Modular.to.navigate(creationRoute);
  }

  void redirectToHome() {
    Modular.to.navigate(homeRoute);
  }
}
