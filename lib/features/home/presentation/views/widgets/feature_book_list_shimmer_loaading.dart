import 'package:bookly/core/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListShimmerLoading extends StatelessWidget {
  const FeaturedBooksListShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ShimmerLoading(
                    child: Container(
                      color: Colors.grey,
                    ),
                  )),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
