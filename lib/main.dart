import 'package:expense_app/data/repository/local/database_helper.dart';
import 'package:expense_app/domain/routes/app_routes.dart';
import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/presentation/pages/bloc/expense_bloc.dart';
import 'package:expense_app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (create) => ExpenseBloc(db: AppDatabase.instance),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorsConstant.primary_Color),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.SPLASH_PAGE,
      routes: AppRoutes.routesMap(),
      /*  home: HomePage(),*/
    );
  }
}






/*import 'package:expense_app_wscube/data/models/datewise_expense_model.dart';
import 'package:expense_app_wscube/data/models/expense_model.dart';
import 'package:expense_app_wscube/data/models/filter_expense_model.dart';
import 'package:expense_app_wscube/data/models/monthwise_model.dart';
import 'package:expense_app_wscube/data/repository/local/database_helper.dart';
import 'package:expense_app_wscube/domain/routes/app_routes.dart';
import 'package:expense_app_wscube/domain/ui_helper/ui_helper.dart';
import 'package:expense_app_wscube/domain/utils/app_colors.dart';
import 'package:expense_app_wscube/domain/utils/app_constant.dart';
import 'package:expense_app_wscube/domain/utils/app_images.dart';
import 'package:expense_app_wscube/presentation/pages/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedTransactionType = 'This Month';
  List<FilterExpenseModel> listFilterExpenseModel = [];
  List<ExpenseModel> listExpenses = [];
/*
  List<MonthWiseExpenseModel> listMonthWiseExpenseModel = [];
*/

  var dateFormat = DateFormat.yMMMMd();
  var monthFormat = DateFormat.LLLL();
  var yearFormat = DateFormat.y();

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchInitialExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EXPENIO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsConstant.black_Color,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      fontSize: 28,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        color: ColorsConstant.secondaryblack_Color,
                        Icons.search_outlined,
                        size: 28,
                      ))
                ],
              ),
              const SizedBox(height: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/images/profile_img.png'),
                      ),
                      SizedBox(width: 11),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Morning',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            'atul patel',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: ColorsConstant.primary_Color,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton(
                        dropdownColor: ColorsConstant.form_Color,
                        focusColor: ColorsConstant.white_Color,
                        value: selectedTransactionType,
                        onChanged: (newValue) {
                          if (newValue == 'This Month') {
                            filterExpenseMonthWise(allExpenses: listExpenses);
                          } else if (newValue == 'This Year') {
                            filterExpenseYearWise(allExpenses: listExpenses);
                          } else if (newValue == 'Date Wise') {
                            filterExpenseDateWise(allExpenses: listExpenses);
                          }
                          setState(() {
                            selectedTransactionType = newValue!;
                          });
                        },
                        items: [
                          'This Month',
                          'This Year',
                          'This Week',
                          'Date Wise'
                        ].map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(
                              type,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: ColorsConstant.black_Color),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 31),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color:ColorsConstant.primary_Color),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(11),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Expense total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontSize: 17,
                                  ),
                                ),
                                const Text(
                                  '\$2,333',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45,
                                    color: Colors.white,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red.shade400),
                                      child: const Align(
                                        child: Text(
                                          '+\$240',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    const Text(
                                      'than last month',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                        letterSpacing: 0.7,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: Image.asset(
                            'assets/images/home_logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 21),
              Align(
                alignment: Alignment.centerLeft,
                child: CTextWidget(
                  cText: 'Expense List',
                  cTextStyle: TextStyle(
                    color: ColorsConstant.secondaryblack_Color,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 11),
              Expanded(
                child: BlocBuilder<ExpenseBloc, ExpenseState>(
                  builder: (_, state) {
                    if (state is ExpenseLoadingState) {
                      return CircularProgressIndicator(
                          color: ColorsConstant.primary_Color);
                    }
                    if (state is ExpenseErrorState) {
                      return Center(
                        child: Text('Error: ${state.errorMsg}'),
                      );
                    }
                    if (state is ExpenseLoadedState) {
                      // filterExpenseDateWise(allExpenses: state.allExpense);
                      listExpenses = state.allExpense;
                      return ListView.builder(
                          itemCount: listFilterExpenseModel.length,
                          itemBuilder: (_, parentIndex) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: 2,
                                        color: ColorsConstant.mainText_Color),
                                    borderRadius: BorderRadius.circular(11)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 21),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CTextWidget(
                                              cText: listFilterExpenseModel[
                                                      parentIndex]
                                                  .title,
                                              cTextStyle: TextStyle(
                                                color:
                                                    ColorsConstant.black_Color,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                              ),
                                            ),
                                            CTextWidget(
                                              cText:
                                                  '\u{20B9}${listFilterExpenseModel[parentIndex].totalAmt}',
                                              cTextStyle: TextStyle(
                                                color:
                                                    ColorsConstant.black_Color,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                        color: ColorsConstant.mainText_Color,
                                        thickness: 2,
                                        height: 10,
                                        endIndent: 15,
                                        indent: 15),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          listFilterExpenseModel[parentIndex]
                                              .allExpenses
                                              .length,
                                      itemBuilder: (_, index) {
                                        var filteredList = AppConstants
                                            .mCategories
                                            .where((element) =>
                                                element.catId ==
                                                listFilterExpenseModel[
                                                        parentIndex]
                                                    .allExpenses[index]
                                                    .eCatId)
                                            .toList();
                                        String imgPath = filteredList[0].catImg;
                                        print(filteredList);
                                        return ListTile(
                                          leading: Container(
                                            height: 80,
                                            width: 70,
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.blue.shade200),
                                            child: Center(
                                              child: Image.asset(imgPath),
                                            ),
                                          ),
                                          title: Text(
                                            listFilterExpenseModel[parentIndex]
                                                .allExpenses[index]
                                                .eTitle,
                                            style: TextStyle(
                                              color: ColorsConstant.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                            ),
                                          ),
                                          subtitle: Text(
                                            listFilterExpenseModel[parentIndex]
                                                .allExpenses[index]
                                                .eDesc,
                                            style: TextStyle(
                                              color:
                                                  ColorsConstant.mainText_Color,
                                              fontSize: 15,
                                            ),
                                          ),
                                          trailing: Text(
                                            '\u{20B9}${listFilterExpenseModel[parentIndex].allExpenses[index].eAmount}',
                                            style: TextStyle(
                                              color:
                                                  ColorsConstant.primary_Color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void filterExpenseDateWise({required List<ExpenseModel> allExpenses}) {
    /// find the unique dates
    listFilterExpenseModel.clear();
    List<String> uniqueDates = [];

    for (ExpenseModel eachExpense in allExpenses) {
      var createdAt = eachExpense.eTimeSpand;
      var mDateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));
      var eachExpenseDate = dateFormat.format(mDateTime);
      print(eachExpenseDate);

      if (!uniqueDates.contains(eachExpenseDate)) {
        uniqueDates.add(eachExpenseDate);
      }
      print(uniqueDates);
    }

    for (String eachDate in uniqueDates) {
      num totalExpAmt = 0;
      List<ExpenseModel> eachDateExpenses = [];

      for (ExpenseModel eachExpense in allExpenses) {
        var createdAt = eachExpense.eTimeSpand;
        var mDateTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));
        var eachExpenseDate = dateFormat.format(mDateTime);

        if (eachExpenseDate == eachDate) {
          eachDateExpenses.add(eachExpense);

          if (eachExpense.eType == 'Debit') {
            totalExpAmt -= int.parse(eachExpense.eAmount);
          } else {
            totalExpAmt += int.parse(eachExpense.eAmount);
          }
        }
      }
      listFilterExpenseModel.add(FilterExpenseModel(
        title: eachDate,
        totalAmt: totalExpAmt.toString(),
        allExpenses: eachDateExpenses,
      ));
    }
    print(listFilterExpenseModel.length);
  }

  void filterExpenseMonthWise({required List<ExpenseModel> allExpenses}) {
    /// find the unique dates
    listFilterExpenseModel.clear();
    List<String> uniqueMonths = [];

    for (int i = 0; i < allExpenses.length; i++) {
      var createdAt = allExpenses[i].eTimeSpand;
      var mDateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));

      var eachExpenseMonth = dateFormat.format(mDateTime);
      var eachExpenseYear = dateFormat.format(mDateTime);

      print('$eachExpenseMonth - $eachExpenseYear');
      var eachExpenseMonthYear = '$eachExpenseMonth - $eachExpenseYear';

      if (!uniqueMonths.contains(eachExpenseMonthYear)) {
        uniqueMonths.add(eachExpenseMonthYear);
      }
      print(uniqueMonths);
    }

    for (String eachDate in uniqueMonths) {
      num totalExpAmt = 0;
      List<ExpenseModel> eachMonthExpenses = [];

      for (int i = 0; i < allExpenses.length; i++) {
        var createdAt = allExpenses[i].eTimeSpand;
        var mDateTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));
        var eachExpenseMonth = dateFormat.format(mDateTime);
        var eachExpenseYear = dateFormat.format(mDateTime);

        print('$eachExpenseMonth - $eachExpenseYear');
        var eachExpenseMonthYear = '$eachExpenseMonth - $eachExpenseYear';

        if (eachExpenseMonthYear == eachDate) {
          eachMonthExpenses.add(allExpenses[i]);

          if (allExpenses[i].eType == 'Debit') {
            totalExpAmt -= int.parse(allExpenses[i].eAmount);
          } else {
            totalExpAmt += int.parse(allExpenses[i].eAmount);
          }
        }
      }
      listFilterExpenseModel.add(FilterExpenseModel(
        title: eachDate,
        totalAmt: totalExpAmt.toString(),
        allExpenses: eachMonthExpenses,
      ));
    }
    print(listFilterExpenseModel.length);
  }

  void filterExpenseYearWise({required List<ExpenseModel> allExpenses}) {
    /// find the unique dates
    listFilterExpenseModel.clear();
    List<String> uniqueMonths = [];

    for (int i = 0; i < allExpenses.length; i++) {
      var createdAt = allExpenses[i].eTimeSpand;
      var mDateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));

/*
      var eachExpenseMonth = dateFormat.format(mDateTime);
*/
      var eachExpenseYear = dateFormat.format(mDateTime);

      /*    print('$eachExpenseMonth - $eachExpenseYear');
      var eachExpenseMonthYear = '$eachExpenseMonth - $eachExpenseYear';*/

      if (!uniqueMonths.contains(eachExpenseYear)) {
        uniqueMonths.add(eachExpenseYear);
      }
      print(uniqueMonths);
    }

    for (String eachDate in uniqueMonths) {
      num totalExpAmt = 0;
      List<ExpenseModel> eachMonthExpenses = [];

      for (int i = 0; i < allExpenses.length; i++) {
        var createdAt = allExpenses[i].eTimeSpand;
        var mDateTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));
        var eachExpenseYear = dateFormat.format(mDateTime);

        if (eachExpenseYear == eachDate) {
          eachMonthExpenses.add(allExpenses[i]);

          if (allExpenses[i].eType == 'Debit') {
            totalExpAmt -= int.parse(allExpenses[i].eAmount);
          } else {
            totalExpAmt += int.parse(allExpenses[i].eAmount);
          }
        }
      }
      listFilterExpenseModel.add(FilterExpenseModel(
        title: eachDate,
        totalAmt: totalExpAmt.toString(),
        allExpenses: eachMonthExpenses,
      ));
    }
    print(listFilterExpenseModel.length);
  }
}
; */







/*

import 'package:expense_app_wscube/data/models/expense_model.dart';
import 'package:expense_app_wscube/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  static const String PRIMARY_KEY = 'UID';
  static const String SIGNOUT_KEY = 'signOut';

  static const String USER_TABLE = 'user';
  static const String EXPENSE_TABLE = 'expense';
  static const String CATEGORY_TABLE = 'category';

  static const String USER_ID = 'uId';
  static const String USER_NAME = 'uName';
  static const String USER_EMAIL = 'uEmail';
  static const String USER_PASSWORD = 'uPass';
  static const String USER_NUMBER = 'uNumber';

  static const String EXPENIO_ID = 'eId';
  static const String EXPENIO_TITLE = 'eTitle';
  static const String EXPENIO_DESC = 'eDesc';
  static const String EXPENIO_TIMESPAND = 'eTime';
  static const String EXPENIO_AMOUNT = 'eAmount';
  static const String EXPENIO_BALANCE = 'eBalance';
  static const String EXPENIO_TYPE = 'eType';
  static const String EXPENIO_CATID = 'eCatId';

*/
/*  static const String TABLE_COLUMN_CATID = 'cId';
  static const String TABLE_COLUMN_CATNAME = 'cName';
  static const String TABLE_COLUMN_CATIMAGE = 'cImgPath';*//*


  Database? myDb;

  Future<Database> getDb() async {
    if (myDb != null) {
      return myDb!;
    } else {
      myDb = await initDb();
      return myDb!;
    }
  }

  Future<Database> initDb() async {
    var root = await getApplicationDocumentsDirectory();
    var mainPath = join(root.path, 'ExpenseDb');
    return await openDatabase(mainPath, version: 1, onCreate: (db, version) {
      db.execute(
          'create table $USER_TABLE ( $USER_ID integer primary key autoincrement , $USER_EMAIL text unique, $USER_PASSWORD text, $USER_NUMBER text,$USER_NAME text )');
      db.execute(
          'create table $EXPENSE_TABLE ( $EXPENIO_ID integer primary key autoincrement, $USER_ID integer, $EXPENIO_TITLE text, $EXPENIO_DESC text, $EXPENIO_TIMESPAND text, $EXPENIO_BALANCE text, $EXPENIO_AMOUNT text, $EXPENIO_TYPE text, $EXPENIO_CATID integer)');

      /// db.execute(' create table $TABLE_NAME_CAT ( $TABLE_COLUMN_CATID integer primary key autoincrement,$TABLE_COLUMN_CATNAME text, )');
    });
  }

  ///[Query for User],
  Future<bool> addNewUser({required UserModel userModel}) async {
    var db = await getDb();
    bool haveAccount = await checkEmailExist(email: userModel.uEmail);
    bool check = false;
    if (!haveAccount) {
      var rowEffect = await db.insert('$USER_TABLE', userModel.toMap());
      check = rowEffect > 0;
    }
    return check;
  }

  Future<bool> checkEmailExist({required String email}) async {
    var db = await getDb();
    var data = await db
        .query('$USER_TABLE', where: '$USER_EMAIL= ? ', whereArgs: [email]);
    return data.isNotEmpty;
  }

  Future<bool> loginUser({required String email, required String pass}) async {
    var db = await getDb();
    var data = await db.query('$USER_TABLE',
        where: '$USER_EMAIL = ? AND $USER_PASSWORD = ? ',
        whereArgs: [email, pass]);
    if (data.isNotEmpty) {
      await setUid(UserModel.fromMap(data[0]).uid);
    }
    return data.isNotEmpty;
  }

  Future<int> getUd() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getInt(PRIMARY_KEY)!;
  }

  Future<void> setUid(int Uid) async {
    var pref = await SharedPreferences.getInstance();
    pref.setInt(PRIMARY_KEY, Uid);
  }

  ///[Query for Expense],
  Future<bool> addExpense({required ExpenseModel expenseModel}) async {
    var db = await getDb();
    var uid = await getUd();
    expenseModel.uId = uid;
    var rowsEffect = await db.insert('$EXPENSE_TABLE', expenseModel.toMap());
    return rowsEffect > 0;
  }

  Future<List<ExpenseModel>> fetchAllExpenses() async {
    var db = await getDb();

    var uid = await getUd();

    var data = await db
        .query('$EXPENSE_TABLE', where: '$USER_ID = ?', whereArgs: ['$uid']);
    List<ExpenseModel> mData = [];
    for (Map<String, dynamic> eachUser in data) {
      var each = ExpenseModel.fromMap(eachUser);
      mData.add(each);
    }
    return mData;
  }

  void updateExpense(ExpenseModel upExpenseModel) async {
    var db = await getDb();
    db.update('$EXPENSE_TABLE', upExpenseModel.toMap(),
        where: '$EXPENIO_ID= ? ', whereArgs: ['${upExpenseModel.eId}']);
  }

  void deleteExpense(int id) async {
    var db = await getDb();
    db.delete('$EXPENSE_TABLE', where: '$EXPENIO_ID= ? ', whereArgs: [id]);
  }
}
*/
