import 'package:expense_app/data/models/expense_model.dart';
import 'package:expense_app/data/models/user_model.dart';
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

/*  static const String TABLE_COLUMN_CATID = 'cId';
  static const String TABLE_COLUMN_CATNAME = 'cName';
  static const String TABLE_COLUMN_CATIMAGE = 'cImgPath';*/

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
      var rowEffect = await db.insert(USER_TABLE, userModel.toMap());
      check = rowEffect > 0;
    }
    return check;
  }

  Future<bool> checkEmailExist({required String email}) async {
    var db = await getDb();
    var data = await db
        .query(USER_TABLE, where: '$USER_EMAIL= ? ', whereArgs: [email]);
    return data.isNotEmpty;
  }

  Future<bool> loginUser({required String email, required String pass}) async {
    var db = await getDb();
    var data = await db.query(USER_TABLE,
        where: '$USER_EMAIL = ? AND $USER_PASSWORD = ? ',
        whereArgs: [email, pass]);
    if (data.isNotEmpty) {
      await setUid(UserModel.fromMap(data[0]).uid);
    }
    return data.isNotEmpty;
  }

  Future<int> getUid() async {
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
    var uid = await getUid();
    expenseModel.uId = uid;
    var rowsEffect = await db.insert(EXPENSE_TABLE, expenseModel.toMap());
    return rowsEffect > 0;
  }

  Future<List<ExpenseModel>> fetchAllExpenses() async {
    var db = await getDb();

    var uid = await getUid();

    var data = await db
        .query(EXPENSE_TABLE, where: '$USER_ID = ?', whereArgs: ['$uid']);
    List<ExpenseModel> mData = [];
    for (Map<String, dynamic> eachUser in data) {
      var each = ExpenseModel.fromMap(eachUser);
      mData.add(each);
    }
    return mData;
  }

  void updateExpense(ExpenseModel upExpenseModel) async {
    var db = await getDb();
    db.update(EXPENSE_TABLE, upExpenseModel.toMap(),
        where: '$EXPENIO_ID= ? ', whereArgs: ['${upExpenseModel.eId}']);
  }

  void deleteExpense(int id) async {
    var db = await getDb();
    db.delete(EXPENSE_TABLE, where: '$EXPENIO_ID= ? ', whereArgs: [id]);
  }
}
