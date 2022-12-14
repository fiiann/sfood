import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'local_db.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class FoodsTable extends Table {
  IntColumn get idFood => integer()();
  TextColumn get category => text().withLength(min: 6, max: 32)();
  TextColumn get nameFood => text().withLength(min: 6, max: 32)();
  TextColumn get image => text().withLength(min: 6, max: 256)();
  TextColumn get area => text().withLength(min: 6, max: 50)();
}


// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [FoodsTable])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  Future<List<FoodsTableData>> get allTodoEntries => select(foodsTable).get();


  Future<int> addFavourite(FoodsTableData entry) {
    return into(foodsTable).insert(entry);
  }

  Future deleteFav(int id) {
    return (delete(foodsTable)..where((t) => t.idFood.equals(id))).go();
  }
  Stream<FoodsTableData> foodById(int id) {
     return (select(foodsTable)..where((t) => t.idFood.equals(id))).watchSingle();
  }


  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}