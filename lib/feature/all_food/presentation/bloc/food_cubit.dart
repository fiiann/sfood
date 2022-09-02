import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sfood/feature/all_food/data/repositories/food_repository.dart';

import 'food_state.dart';
class FoodCubit extends Cubit<FoodState>{
  // final Dio _dio;
  final FoodRepository foodRepository;
  FoodCubit(this.foodRepository):super(FoodInitial());

  Future<void> load() async {
    try{
      final foods = await foodRepository.getAllData();
      emit(FoodLoaded(foods));
    }catch(e){
      if(kDebugMode){
        print("error load cubit : ${e.toString()}");
      }
      emit(FoodError(e.toString()));
    }
  }
}