import 'package:bloc/bloc.dart';
import 'package:expense_app/data/models/expense_model.dart';
import 'package:expense_app/data/repository/local/database_helper.dart';
import 'package:meta/meta.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  AppDatabase db;
  ExpenseBloc({required this.db}) : super(ExpenseInitialState()) {
    on<FetchInitialExpense>((event, emit) async {
      emit(ExpenseLoadingState());

      var mData = await db.fetchAllExpenses();
      emit(ExpenseLoadedState(allExpense: mData));
    });

    on<AddExpense>((event, emit) async {
      emit(ExpenseLoadingState());
      var check = await db.addExpense(expenseModel: event.newExpense);
      if (check) {
        var mData = await db.fetchAllExpenses();
        emit(ExpenseLoadedState(allExpense: mData));
      } else {
        emit(ExpenseErrorState(errorMsg: 'Expense not added!'));
      }
    });
  }
}
