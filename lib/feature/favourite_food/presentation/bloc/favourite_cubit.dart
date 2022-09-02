import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sfood/feature/favourite_food/data/favourite_repository.dart';

import '../../../../core/database_local/local_db.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState>{
  final FavouriteRepository repository;
  final MyDatabase database;
  FavouriteCubit({required this.repository, required this.database}):super(FavouriteInitial());

  Future<void> load() async {
    try{
      final foods = await repository.getAllFavourite(database);
      emit(FavouriteLoaded(foods));
    }catch(e){
      if(kDebugMode){
        print("error load cubit : ${e.toString()}");
      }
      emit(FavouriteError(e.toString()));
    }
  }
  Future<bool> addToFav(FoodsTableData data) async {
    int add = await repository.addFavorite(database, data);
    return true;
  }

  Future<bool> deleteFav(int id) async {
    await repository.deleteFav(database, id);
    return true;
  }
  Stream<FoodsTableData> getFoodById(int id) {
    return repository.getFoodById(database, id);
  }
}