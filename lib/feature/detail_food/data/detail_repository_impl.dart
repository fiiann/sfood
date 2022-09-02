import 'package:sfood/feature/all_food/domain/models/meals_response.dart';

abstract class IDetailResository {
  Future<MealsResponse> getDetail(String id);
}