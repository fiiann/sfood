import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfood/common_widget/card_food.dart';
import 'package:sfood/common_widget/shimmer_loading_list.dart';
import 'package:sfood/core/database_local/local_db.dart';
import 'package:sfood/feature/all_food/domain/models/meals_response.dart';
import 'package:sfood/feature/favourite_food/presentation/bloc/favourite_cubit.dart';
import 'package:sfood/feature/favourite_food/presentation/bloc/favourite_state.dart';

class ListFavouriteFoodPage extends StatelessWidget {
  const ListFavouriteFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteCubit>(context);
    cubit.load();
    var appBar = AppBar(
      elevation: 0.1,
      // backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      title: const Text("Favourite"),
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        color: const Color.fromRGBO(240, 240, 240, 1.0),
        child: Stack(
          children: [
            BlocBuilder<FavouriteCubit, FavouriteState>(builder: (context, foodState) {
              if (foodState is FavouriteInitial) {
                return const ShimmerLoadingList();
              } else if (foodState is FavouriteLoaded) {
                List<FoodsTableData>? list = foodState.listFavourite;
                return list.isEmpty? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(child: Text("NO DATA"),),
                ):Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: list!.length,
                              itemBuilder: (BuildContext contextList, index) {
                                Meals meal = Meals(
                                    idMeal: list[index].idFood.toString(),
                                    strCategory: list[index].category,
                                    strArea: list[index].area,
                                    strMealThumb: list[index].image,
                                  strMeal: list[index].nameFood

                                );
                                return CardFood(meal: meal);
                              }),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Text("STATE NOT FOUND");
              }
            }),
          ],
        ),
      ),
    );
  }
}

class ChoiceChipFood extends StatelessWidget {
  final String label;
  final bool selected;

  const ChoiceChipFood({
    Key? key,
    required this.label,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(

      label: Text(label),
      selected: selected,
      selectedColor: Colors.amber,
      disabledColor: Colors.white12,
      labelStyle: TextStyle(
          color: selected?Colors.white:Colors.black,
          fontWeight: selected?FontWeight.bold:FontWeight.normal
      ),

    );
  }
}
