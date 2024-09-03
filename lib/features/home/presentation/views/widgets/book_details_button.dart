import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksDetailsButtonsAction extends StatelessWidget {
  const BooksDetailsButtonsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              style: Styles.textSyle18
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
              text: '18.8\$',
              bgcolor: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              style: Styles.textSyle16.copyWith(color: Colors.white),
              text: 'Free Preview',
              bgcolor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
