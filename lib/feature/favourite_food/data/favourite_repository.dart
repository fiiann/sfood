import 'package:flutter/foundation.dart';
import 'package:sfood/core/database_local/local_db.dart';

import 'favourite_repository_impl.dart';

class FavouriteRepository implements IFavouriteRepository{
  FavouriteRepository();
  // final db = MyDatabase();
  @override
  Future<List<FoodsTableData>> getAllFavourite(MyDatabase databases) async{
    try{
      var response = await databases.allTodoEntries;
      if(kDebugMode){
        if(response.isNotEmpty) print(response.toString());
        // print(response.toString());
      }
      return response;
    }catch(e){
      if(kDebugMode){
        // print("foods : ${e.toString()}");
      }
      return [];
    }
  }
  Future<int> addFavorite(MyDatabase database, FoodsTableData data) async{
    try {
      return await database.addFavourite(data);
    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      return 0;
    }
  }

  Future deleteFav(MyDatabase database, int id) async{
    try {
      return await database.deleteFav(id);
    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      return 0;
    }
  }

  Stream<FoodsTableData> getFoodById(MyDatabase database, int id) {
        return database.foodById(id);
  }
}