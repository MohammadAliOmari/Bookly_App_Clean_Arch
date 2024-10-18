import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/home_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureBookList extends StatefulWidget {
  const FeatureBookList({super.key, required this.books});
  final List<BookEnitie> books;

  @override
  State<FeatureBookList> createState() => _FeatureBookListState();
}

class _FeatureBookListState extends State<FeatureBookList> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool islodaing = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      if (!islodaing) {
        islodaing = true;
        await context.read<HomeCubit>().fetcheFeatureBooks(
              pageNamber: nextPage++,
            );
        islodaing = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () async {
                await GoRouter.of(context)
                    .push('/BookDetailsView/$index', extra: widget.books);
              },
              child: CustomBookImageItem(
                image: widget.books[index].image ??
                    'https://images.unsplash.com/photo-1532012197267-da84d127e765?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8fA%3D%3D',
              ),
            ),
          );
        },
        itemCount: widget.books.length,
      ),
    );
  }
}
