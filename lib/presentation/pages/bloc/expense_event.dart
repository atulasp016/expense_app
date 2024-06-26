part of 'expense_bloc.dart';

@immutable
sealed class ExpenseEvent {}

class FetchInitialExpense extends ExpenseEvent{}
class AddExpense extends ExpenseEvent{
  ExpenseModel newExpense;
  AddExpense({required this.newExpense});
}
