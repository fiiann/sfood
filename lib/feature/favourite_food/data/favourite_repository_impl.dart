import 'package:sfood/core/database_local/local_db.dart';

abstract class IFavouriteRepository {
  Future<List<FoodsTableData>> getAllFavourite(MyDatabase database);
}