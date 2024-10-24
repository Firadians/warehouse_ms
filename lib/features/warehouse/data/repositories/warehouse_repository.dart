import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';

class WarehouseRepository {
  static final WarehouseRepository _instance = WarehouseRepository._();
  static Database? _database;

  WarehouseRepository._();

  factory WarehouseRepository() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'warehouse.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            quantity INTEGER,
            dateAdded TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertItem(WarehouseItem item) async {
    final db = await database;
    await db.insert('items', item.toMap());
  }

  Future<List<WarehouseItem>> getItems() async {
    final db = await database;
    final result = await db.query('items');
    return result.map((item) => WarehouseItem.fromMap(item)).toList();
  }

  Future<void> updateItem(WarehouseItem item) async {
    final db = await database;
    await db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteItem(int id) async {
    final db = await database;
    await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
