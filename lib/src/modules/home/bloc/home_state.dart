import "package:card_app/src/domain/card_model.dart";
import "package:card_app/src/i18n/strings.g.dart";
import "package:equatable/equatable.dart";

enum HomeStatus { initial, loading }

class HomeState extends Equatable {
  final HomeStatus status;
  final AppLocale languageSelected;
  final CardType currentCardType;
  final List<CardModel>? listCardModel;
  final bool refresh;
  final bool isDataVisible;

  const HomeState(
      {this.status = HomeStatus.loading,
      this.languageSelected = AppLocale.en,
      this.currentCardType = CardType.credit,
      this.listCardModel,
      this.refresh = false,
      this.isDataVisible = true});

  HomeState copyWith({
    HomeStatus? status,
    AppLocale? languageSelected,
    CardType? currentCardType,
    List<CardModel>? listCardModel,
    bool? refresh,
    bool? isDataVisible,
  }) {
    return HomeState(
        status: status ?? this.status,
        languageSelected: languageSelected ?? this.languageSelected,
        currentCardType: currentCardType ?? this.currentCardType,
        listCardModel: listCardModel ?? this.listCardModel,
        refresh: refresh ?? this.refresh,
        isDataVisible: isDataVisible ?? this.isDataVisible);
  }

  @override
  List<Object?> get props => [
        status,
        languageSelected,
        currentCardType,
        listCardModel,
        refresh,
        isDataVisible
      ];
}
