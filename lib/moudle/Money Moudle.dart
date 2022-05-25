import 'package:cloud_firestore/cloud_firestore.dart';

class MoneyMoudel {
  double? moneyPaid;
  double? allMoneyGeted;
  double? moneyInBox;
  Timestamp? dateTime;


  MoneyMoudel(
      {this.moneyPaid,
        this.allMoneyGeted,
        this.moneyInBox,
        this.dateTime,
     });
  MoneyMoudel.fromJson(Map<String, dynamic> json)
  {
    moneyPaid = json['payedMoney'];
    allMoneyGeted = json['AllMoneyGet'];
    moneyInBox = json['totalMoney'];
    dateTime = json['Date'];

  }
  Map<String, dynamic> toJson()
  {
    return {
      'moneyPaid': moneyPaid,
      'allMoneyGeted': allMoneyGeted,
      'moneyInBox': moneyInBox,
      'dateTime': dateTime,

    };
  }
}
