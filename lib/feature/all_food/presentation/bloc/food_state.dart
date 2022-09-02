import 'package:equatable/equatable.dart';
import 'package:sfood/feature/all_food/domain/models/meals_response.dart';

abstract class FoodState extends Equatable{}

class FoodInitial extends FoodState {
  @override
  List<Object?> get props => [];
}

class FoodLoaded extends FoodState{
  final MealsResponse mealsResponse;

  FoodLoaded(this.mealsResponse);

  @override
  List<Object?> get props => [mealsResponse];
}

class FoodError extends FoodState {
  final String message;

  FoodError(this.message);

  @override
  List<Object?> get props => [message];
}