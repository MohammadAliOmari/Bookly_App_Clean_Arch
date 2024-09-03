import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldSearchView extends StatelessWidget {
  const TextFieldSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: Opacity(
          opacity: .7,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.white,
              )),
        ),
        enabledBorder: buildInputOutlinedBorder(),
        focusedBorder: buildInputOutlinedBorder(),
      ),
    );
  }

  OutlineInputBorder buildInputOutlinedBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white));
  }
}
