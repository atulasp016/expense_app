import 'package:expense_app/data/models/expense_model.dart';

class MonthWiseExpenseModel {
  String month;
  String totalAmt;
  List<ExpenseModel> eachMonthAllExpense;
  MonthWiseExpenseModel({
    required this.month,
    required this.totalAmt,
    required this.eachMonthAllExpense,
  });
}
