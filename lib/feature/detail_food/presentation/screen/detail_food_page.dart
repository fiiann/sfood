import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfood/core/database_local/local_db.dart';
import 'package:sfood/feature/all_food/domain/models/meals_response.dart';
import 'package:sfood/feature/detail_food/presentation/bloc/detail_food_cubit.dart';
import 'package:sfood/feature/detail_food/presentation/bloc/detail_food_state.dart';
import 'package:sfood/feature/favourite_food/presentation/bloc/favourite_cubit.dart';

class DetailFoodPage extends StatelessWidget {
  final Object? id;
  const DetailFoodPage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DetailFoodCubit>(context);
    final favCubit = BlocProvider.of<FavouriteCubit>(context);
    cubit.load(id.toString());

    return Scaffold(
      // appBar: appBar,
      body: SingleChildScrollView(
        child: BlocBuilder<DetailFoodCubit, DetailFoodState>(
          builder: (context, state){
            if(state is DetailFoodInitial){
              return  SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                    )),
              );
            }else if(state is DetailFoodLoaded){
              Meals meal = state.mealsResponse.meals![0];
              var fav = favCubit.getFoodById(int.parse(meal.idMeal!));
              print("fav $fav");
              return Stack(
                children: [
                  Column(
                    children:  [
                        SizedBox(
                          height: MediaQuery.of(context).size.height/2,
                          child: Image.network(meal.strMealThumb??''),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(meal.strMeal??"", style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40
                              ),),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FoodChip(label: meal.strCategory??"",),
                                  FoodChip(label: meal.strArea??"",),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Text(meal.strInstructions??"")
                            ],
                          ),
                        )
                    ],
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TombolIcon(
                              onClick: ()=>Navigator.of(context).pop(),
                            ),
                            // StreamBuilder<FoodsTableData>(
                            //     stream: favCubit.getFoodById(int.parse(meal.idMeal!)),
                            //     builder: (BuildContext c, data)){
                            //
                            // },
                            TombolIcon(
                              icon: CupertinoIcons.heart_solid,
                              onClick: () {
                                FoodsTableData data = FoodsTableData(
                                    idFood: int.parse(meal.idMeal!),
                                    category: meal.strCategory!,
                                    image: meal.strMealThumb!,
                                    area: meal.strArea!,
                                    nameFood: meal.strMeal!

                                );
                                return favCubit.addToFav(data);
                                // return favCubit.deleteFav(int.parse(meal.idMeal!));
                              },
                            ),
                          ],
                        ),
                      )),
                ],
              );
            }else{
              return const Center(child: Text("ERROR"),);
            }
          }
        ),
      ),
    );
  }
}

class FoodChip extends StatelessWidget {
  final String label;
  const FoodChip({
    Key? key, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 20),),
        backgroundColor: Colors.amber,
    );
  }
}

class TombolIcon extends StatelessWidget {
  IconData icon;
  Color bgnColor;
  Color iconColor;
  double size;
  var gradient;
  var onClick;
  TombolIcon({super.key, this.icon = Icons.keyboard_arrow_left, this.onClick, this.bgnColor = Colors.white, this.size=20, this.iconColor = Colors.grey, this.gradient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              gradient: gradient,
              color: bgnColor,
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: iconColor,
              size:  size,
            ),
          )),
    );
  }
}
