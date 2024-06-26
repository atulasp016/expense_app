import 'package:expense_app/data/repository/local/database_helper.dart';

class ExpenseModel {
  int eId;
  int uId;
  String eTitle;
  String eDesc;
  String eTimeSpand;
  String eAmount;
  String eBalance;
  String eType;
  int eCatId;

  ExpenseModel({
    required this.eId,
    required this.uId,
    required this.eTitle,
    required this.eDesc,
    required this.eTimeSpand,
    required this.eAmount,
    required this.eBalance,
    required this.eType,
    required this.eCatId,
  });

  ///
  ///map to model

  factory ExpenseModel.fromMap(Map<String, dynamic> expenseMap) => ExpenseModel(
    eId: expenseMap[AppDatabase.EXPENIO_ID],
    uId: expenseMap[AppDatabase.USER_ID],
        eTitle: expenseMap[AppDatabase.EXPENIO_TITLE],
        eDesc: expenseMap[AppDatabase.EXPENIO_DESC],
        eTimeSpand: expenseMap[AppDatabase.EXPENIO_TIMESPAND],
        eAmount: expenseMap[AppDatabase.EXPENIO_AMOUNT],
        eBalance: expenseMap[AppDatabase.EXPENIO_BALANCE],
        eType: expenseMap[AppDatabase.EXPENIO_TYPE],
        eCatId: expenseMap[AppDatabase.EXPENIO_CATID],
      );

  ///
  ///model to map
  Map<String, dynamic> toMap() {
    return {
      AppDatabase.USER_ID: uId,
      AppDatabase.EXPENIO_TITLE: eTitle,
      AppDatabase.EXPENIO_DESC: eDesc,
      AppDatabase.EXPENIO_TIMESPAND: eTimeSpand,
      AppDatabase.EXPENIO_AMOUNT: eAmount,
      AppDatabase.EXPENIO_BALANCE: eBalance,
      AppDatabase.EXPENIO_TYPE: eType,
      AppDatabase.EXPENIO_CATID: eCatId,
    };
  }
}
