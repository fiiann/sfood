import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sfood/core/database_local/local_db.dart';
import 'package:sfood/feature/detail_food/data/detail_repository.dart';

import 'detail_food_state.dart';

class DetailFoodCubit extends Cubit<DetailFoodState>{
  // final Dio _dio;
  final DetailRepository detailRepository;
  final MyDatabase database;
  DetailFoodCubit({required this.detailRepository,required this.database}):super(DetailFoodInitial());

  Future<void> load(String id) async {
    try{
      final foods = await detailRepository.getDetail(id);
      emit(DetailFoodLoaded(foods));
    }catch(e){
      if(kDebugMode){
        print("error load cubit : ${e.toString()}");
      }
      emit(DetailFoodError(e.toString()));
    }
  }
}