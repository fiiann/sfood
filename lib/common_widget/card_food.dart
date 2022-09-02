import 'package:flutter/material.dart';
import 'package:sfood/feature/all_food/domain/models/meals_response.dart';

class CardFood extends StatelessWidget {
  const CardFood({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meals meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).pushNamed('detail_food', arguments: meal.idMeal),
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  meal.strMealThumb!,
                  fit: BoxFit.fitHeight,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.strMeal ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(meal.strCategory ?? ""),
                      Text(
                        meal.strArea ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle
                    ),
                    padding: const EdgeInsets.all(1),
                    child: const Icon(Icons.navigate_next, color: Colors.white,)))
          ],
        ),
      ),
    );
  }
}