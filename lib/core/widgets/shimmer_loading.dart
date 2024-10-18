import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade300,
        enabled: true,
        child: child,
      ),
    );
  }
}
