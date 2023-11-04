import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const _database = "PartnersListDB.db";
  static const _databaseVersion = 3;

  static const partnersListTable = 'PartnersTable';

  static const colId = '_id';

  static const colPartnerName = '_partnerName';
  static const colPartnerPan = '_partnerPan';
  static const colPartnerAadhar = '_partnerAadhar';
  static const colPartnerDateofAppointment = '_DateofAppointment';
  static const colPartnerDateofResignation = '_DateofResignation';
  static const colPartnerNumber = '_partnerNumber';
  static const colPartnerEmailID = '_partnerEmailID';
  static const colpartnerProfitSharing = '_partnerProfitSharing';

  late Database _db;

  Future<void> initialization() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _database);

    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $partnersListTable(
      $colId INTEGER PRIMARY KEY,
      $colPartnerName TEXT,
      $colPartnerPan TEXT,
      $colPartnerAadhar TEXT,
      $colPartnerDateofAppointment TEXT,
      $colPartnerDateofResignation TEXT,
      $colPartnerNumber TEXT,
      $colPartnerEmailID TEXT,
      $colpartnerProfitSharing TEXT
      )''');
  }


  _onUpgrade(Database database, int oldversion, int newversion) async {
    await database.execute('drop table $partnersListTable');
    _onCreate(database, newversion);
  }

  Future<int> insertpartnersListTable(
      Map<String, dynamic> row, String tableName) async {
    return await _db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    return await _db.query(tableName);
  }

  Future<int> updatePartnersDetails(
      Map<String, dynamic> row, String tableName) async {
    int id = row[colId];
    return await _db.update(
      tableName,
      row,
      where: '$colId =?',
      whereArgs: [id],
    );
  }

  Future<int> deletePartnersDetail(int id, String tableName) async {
    return await _db.delete(
      tableName,
      where: '$colId =?',
      whereArgs: [id],
    );
  }
}
