import 'package:bookly/core/widgets/shimmer_loading.dart';

import 'package:flutter/material.dart';

class SearchListLoading extends StatelessWidget {
  const SearchListLoading({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: 120,
              child: Row(
                children: [
                  // Shimmer for the image
                  AspectRatio(
                    aspectRatio: 2.6 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ShimmerLoading(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Shimmer for the title
                        ShimmerLoading(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .5,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(height: 3),
                        // Shimmer for the author name
                        ShimmerLoading(
                          child: Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Shimmer for the price
                            ShimmerLoading(
                              child: Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                            // Shimmer for the rating area
                            ShimmerLoading(
                              child: Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
