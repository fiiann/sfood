import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfood/core/database_local/local_db.dart';
import 'package:sfood/feature/all_food/data/repositories/food_repository.dart';
import 'package:sfood/feature/all_food/presentation/bloc/food_cubit.dart';
import 'package:sfood/feature/all_food/presentation/screen/list_food_page.dart';
import 'package:sfood/feature/all_food/presentation/screen/no_screen.dart';
import 'package:sfood/feature/detail_food/data/detail_repository.dart';
import 'package:sfood/feature/detail_food/presentation/screen/detail_food_page.dart';
import 'package:sfood/feature/favourite_food/data/favourite_repository.dart';
import 'package:sfood/feature/favourite_food/presentation/bloc/favourite_cubit.dart';
import 'package:sfood/feature/favourite_food/presentation/screen/list_favourite_page.dart';

import '../feature/detail_food/presentation/bloc/detail_food_cubit.dart';

class AppRouter {
  final MyDatabase _database;


  AppRouter(this._database);

  Route generateRoute(RouteSettings settings){
    switch (settings.name){
      case "list_food":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FoodCubit(
              FoodRepository()
            ),
            child: const ListFoodPage(),
          ),
        );
      case "detail_food":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider<DetailFoodCubit>(
              create: (context) {
                return DetailFoodCubit(
                    detailRepository: DetailRepository(_database),
                  database: _database
                );
              },
            ),
            BlocProvider<FavouriteCubit>(
              create: (context) {
                return FavouriteCubit(
                    repository: FavouriteRepository(),
                  database: _database
                );
              },
            ),
          ], child: DetailFoodPage(settings.arguments)),
        );
      case "favourite_food":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FavouriteCubit(
                repository: FavouriteRepository(),
              database: _database
            ),
            child: const ListFavouriteFoodPage(),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => const NoScreen()
        );
    }
  }
}