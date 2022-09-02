import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfood/common_widget/card_food.dart';
import 'package:sfood/common_widget/shimmer_loading_list.dart';
import 'package:sfood/feature/all_food/domain/models/meals_response.dart';
import 'package:sfood/feature/all_food/presentation/bloc/food_state.dart';
import '../bloc/food_cubit.dart';

class ListFoodPage extends StatelessWidget {
  const ListFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FoodCubit>(context);
    cubit.load();
    var appBar = AppBar(
      elevation: 0.1,
      // backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      title: const Text("Home"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(CupertinoIcons.heart_solid, color: Colors.pink,),
          onPressed: () {
              Navigator.of(context).pushNamed("favourite_food");
          },
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        color: const Color.fromRGBO(240, 240, 240, 1.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ChoiceChipFood(label: "Fish", selected: false),
                  ChoiceChipFood(label: "Pizza", selected: false),
                  ChoiceChipFood(label: "Chicken", selected: true),
                  ChoiceChipFood(label: "Escovitch Fish", selected: false),
                  ChoiceChipFood(label: "Fish", selected: false),
                ],
              ),
            ),
            BlocBuilder<FoodCubit, FoodState>(builder: (context, foodState) {
              if (foodState is FoodInitial) {
                return const ShimmerLoadingList();
              } else if (foodState is FoodLoaded) {
                List<Meals>? list = foodState.mealsResponse.meals;
                return Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: list!.length,
                              itemBuilder: (BuildContext contextList, index) {
                                var meal = list[index];
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
