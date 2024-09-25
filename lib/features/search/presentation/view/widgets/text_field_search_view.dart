import 'package:bookly/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldSearchView extends StatelessWidget {
  const TextFieldSearchView({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (v) {
        context.read<SearchCubit>().fetchbooks();
      },
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: Opacity(
          opacity: .7,
          child: IconButton(
              onPressed: () {
                context.read<SearchCubit>().fetchbooks();
              },
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
