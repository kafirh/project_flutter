import 'package:path/path.dart';
import 'package:pokedex/database/isfavorite.dart';
import 'package:sqflite/sqflite.dart';

// Mendefinisikan nama tabel di luar kelas
const String table = 'Favorites';

class FavoriteDatabase {
  static final FavoriteDatabase instance = FavoriteDatabase._init();

  FavoriteDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('Favorite.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    const sql = '''
    CREATE TABLE $table(
    ${FavoriteFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${FavoriteFields.idPokemon} INTEGER NOT NULL
    )
    ''';
    await db.execute(sql);
  }

  Future<Favorite> create(Favorite Favorite) async {
    final db = await instance.database;
    final id = await db.insert(table, Favorite.toJson());
    return Favorite.copy(id: id);
  }

  Future<List<Favorite>> getAllFavorite() async {
    final db = await instance.database;
    final result = await db.query(table);
    return result.map((json) => Favorite.fromJson(json)).toList();
  }

  Future<Favorite> getFavoriteById(int id) async {
    final db = await instance.database;
    final result = await db
        .query(table, where: '${FavoriteFields.id} = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Favorite.fromJson(result.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> deleteFavoriteById(int id) async {
    final db = await instance.database;
    return await db
        .delete(table, where: '${FavoriteFields.id} = ?', whereArgs: [id]);
  }

  Future<int> updateFavorite(Favorite Favorite) async {
    final db = await instance.database;
    return db.update(table, Favorite.toJson(),
        where: '${FavoriteFields.id} = ?', whereArgs: [Favorite.id]);
  }
}
