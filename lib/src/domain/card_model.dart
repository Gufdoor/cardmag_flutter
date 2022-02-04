enum CardType { debit, credit, notDefined }

class CardModel {
  final String? ownerName;
  final String? cardNumber;
  final CardType? type;

  CardModel({
    this.ownerName,
    this.cardNumber,
    this.type = CardType.notDefined,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      ownerName: json["ownerName"],
      cardNumber: json["cardNumber"],
      type: CardType.values
          .firstWhere((element) => element.toString() == json["type"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "ownerName": ownerName,
      "cardNumber": cardNumber,
      "type": type.toString(),
    };
  }
}
