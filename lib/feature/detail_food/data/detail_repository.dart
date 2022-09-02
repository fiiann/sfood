import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sfood/core/database_local/local_db.dart';
import 'package:sfood/feature/all_food/domain/models/meals_response.dart';
import 'package:sfood/feature/detail_food/data/detail_repository_impl.dart';

import '../../../core/serviceInfo.dart';

class DetailRepository implements IDetailResository{
  final MyDatabase database;
  DetailRepository(this.database);
  final Dio _dio = ServerInfo().getConnection();

  @override
  Future<MealsResponse> getDetail(String id) async{
    try{
      var response = await _dio.get("${ServerInfo.baseUrl}lookup.php?i=$id");

      if(kDebugMode){
        // print("URL : ${ServerInfo.baseUrl}lookup.php?i=$id ");
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