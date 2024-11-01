import 'dart:developer';

import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksDetailsButtonsAction extends StatelessWidget {
  const BooksDetailsButtonsAction(
      {super.key, required this.books, required this.index});
  final List<dynamic> books;
  final int index;
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
              text: books[index].price != null
                  ? '${books[index].price} \$'
                  : 'Free',
              bgcolor: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                log('On Pressed URL');
                Uri uri = Uri.parse(books[index].link);
                if (!await launchUrl(uri)) {
                  throw Exception('Could not launch $uri');
                } else {
                  await launchUrl(uri);
                }
              },
              style: Styles.textSyle16.copyWith(color: Colors.white),
              text: 'Preview',
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
