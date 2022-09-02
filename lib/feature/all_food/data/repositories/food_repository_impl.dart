import 'package:sfood/feature/all_food/domain/models/meals_response.dart';

abstract class IFoodRepository {
  Future<MealsResponse> getAllData();
}