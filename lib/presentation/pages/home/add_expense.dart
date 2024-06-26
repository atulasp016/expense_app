import 'package:expense_app/data/models/expense_model.dart';
import 'package:expense_app/data/repository/local/database_helper.dart';
import 'package:expense_app/domain/routes/app_routes.dart';
import 'package:expense_app/domain/ui_helper/ui_helper.dart';
import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/domain/utils/app_constant.dart';
import 'package:expense_app/domain/utils/app_images.dart';
import 'package:expense_app/domain/widgets/button_widgets.dart';
import 'package:expense_app/presentation/pages/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  num balance;
  AddExpenseScreen({required this.balance});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpenseScreen> {
  String selectedTransactionType = "Debit";
  DateTime expenseDate = DateTime.now();

  ///for default date
  String elevatedBtnName = "Choose Date";
  var selectedCatIndex = -1;

  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amountController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 2, 15),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        expenseDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 31.0),
                  child: CTextWidget(
                    cText: 'Add Expense',
                    cTextStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        color: ColorsConstant.secondaryblack_Color),
                  ),
                ),
                CustomTextField(
                  hintStyle: TextStyle(
                    color: ColorsConstant.mainText_Color,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  fillColor: ColorsConstant.white_Color,
                  keyType: TextInputType.text,
                  controller: titleController,
                  hintText: 'Enter your expense',
                  headTitle: 'Your Expense',
                ),
                CustomTextField(
                  hintStyle: TextStyle(
                    color: ColorsConstant.mainText_Color,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  fillColor: ColorsConstant.white_Color,
                  keyType: TextInputType.text,
                  controller: descController,
                  hintText: 'Enter your description',
                  headTitle: 'Add Description',
                ),
                CustomTextField(
                  hintStyle: TextStyle(
                    color: ColorsConstant.mainText_Color,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  fillColor: ColorsConstant.white_Color,
                  keyType: TextInputType.number,
                  controller: amountController,
                  hintText: 'Enter your amount',
                  headTitle: 'Your Amount',
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: ColorsConstant.primary_Color,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: DropdownButton(
                    dropdownColor: ColorsConstant.primary_Color,
                    focusColor: Colors.white,
                    value: selectedTransactionType,
                    onChanged: (newValue) {
                      setState(() {
                        selectedTransactionType = newValue!;
                      });
                    },
                    items: ["Debit", "Credit"].map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(
                          type,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 21),
                OutlineBTN(
                  text: 'Choose Expense',
                  mWidget: selectedCatIndex != -1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppConstants.mCategories[selectedCatIndex].catImg,
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              "  -  ${AppConstants.mCategories[selectedCatIndex].catName}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      : null,
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15))),
                        context: context,
                        builder: (context) {
                          return GridView.builder(
                              itemCount: AppConstants.mCategories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (context, index) {
                                var eachCat = AppConstants.mCategories[index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedCatIndex = index;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.cyan.shade100,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset(eachCat.catImg),
                                    ),
                                  ),
                                );
                              });
                        });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 21.0),
                  child: OutlineBTN(
                      text: DateFormat.yMMMMd().format(expenseDate),
                      onTap: () {
                        _selectDate(context);
                      }),
                ),
                ElevatedBTN(
                    cText: 'Add Expense',
                    onTap: () {
                      var newExpense = ExpenseModel(
                        eTitle: titleController.text,
                        eDesc: descController.text,
                        eAmount: amountController.text.toString(),
                        eType: selectedTransactionType,
                        eCatId:
                            AppConstants.mCategories[selectedCatIndex].catId,
                        eTimeSpand:
                            expenseDate.millisecondsSinceEpoch.toString(),
                        eBalance: widget.balance.toString(),
                        eId: 0,
                        uId: 0,
                      );
                      context
                          .read<ExpenseBloc>()
                          .add(AddExpense(newExpense: newExpense));

                      Navigator.pushReplacementNamed(
                          context, AppRoutes.HOME_BNB_PAGE);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
