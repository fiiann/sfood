import 'package:equatable/equatable.dart';
import 'package:sfood/feature/all_food/domain/models/meals_response.dart';

abstract class DetailFoodState extends Equatable{}

class DetailFoodInitial extends DetailFoodState {
  @override
  List<Object?> get props => [];
}

class DetailFoodLoaded extends DetailFoodState{
  final MealsResponse mealsResponse;

  DetailFoodLoaded(this.mealsResponse);

  @override
  List<Object?> get props => [mealsResponse];
}

class DetailFoodError extends DetailFoodState {
  final String message;

  DetailFoodError(this.message);

  @override
  List<Object?> get props => [message];
}