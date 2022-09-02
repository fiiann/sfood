import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white24,
      highlightColor: Colors.white,
      direction: ShimmerDirection.ltr,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext contextShimmer, index){
            return SizedBox(
              height: 150.0,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Colors.white,
              ),
            );
          }),
    );
  }
}