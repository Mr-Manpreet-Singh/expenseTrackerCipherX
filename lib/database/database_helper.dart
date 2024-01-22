import 'package:expense_tracker_app/models/transaction_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'transactions';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'transactions.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName(
            id TEXT PRIMARY KEY ,
            isExpense INTEGER,
            category TEXT,
            description TEXT,
            amount REAL,
            dateTime TEXT,
            paymentMode TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertTransaction(TransactionModel transaction) async {
    final db = await database;
    await db.insert(tableName, transaction.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TransactionModel>> getTransactions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    final fetchedTransactions = List.generate(maps.length, (i) {
      return TransactionModel.fromMap(maps[i]);
    });
    return fetchedTransactions;
  }

  Future<void> deleteTransaction(String id) async {
    final db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
