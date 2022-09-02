import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sfood/core/serviceInfo.dart';
import 'package:sfood/feature/all_food/data/repositories/food_repository_impl.dart';
import 'package:sfood/feature/all_food/domain/models/meals_response.dart';
class FoodRepository implements IFoodRepository{
  // final Dio _dio;

  FoodRepository();
  final Dio _dio = ServerInfo().getConnection();
  @override
  Future<MealsResponse> getAllData() async{
    try{
      var response = await _dio.get("${ServerInfo.baseUrl}search.php?s=Fish");
      if(kDebugMode){
        // print(response.data);
      }
      return mealsResponseFromJson(response.data);
    }catch(e){
      if(kDebugMode){
        print("foods : ${e.toString()}");
      }
      return MealsResponse(meals: []);
    }
  }

}