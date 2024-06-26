part of 'expense_bloc.dart';

@immutable
sealed class ExpenseState {}

final class ExpenseInitialState extends ExpenseState {}
final class ExpenseLoadingState extends ExpenseState {}
final class ExpenseLoadedState extends ExpenseState {
  List<ExpenseModel> allExpense;
  ExpenseLoadedState({required this.allExpense});
}
final class ExpenseErrorState extends ExpenseState {
  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}
