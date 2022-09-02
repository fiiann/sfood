import 'package:equatable/equatable.dart';
import 'package:sfood/core/database_local/local_db.dart';

abstract class FavouriteState extends Equatable{}

class FavouriteInitial extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class FavouriteLoaded extends FavouriteState{
  final List<FoodsTableData> listFavourite;

  FavouriteLoaded(this.listFavourite);

  @override
  List<Object?> get props => [listFavourite];
}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError(this.message);

  @override
  List<Object?> get props => [message];
}