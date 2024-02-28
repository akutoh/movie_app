import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/app_values.dart';
import 'package:movie_app/search/presentation/components/search_field.dart';
import 'package:movie_app/search/presentation/components/search_text.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p16,
            right: AppPadding.p16,
          ),
          child: Column(
            children: [
              SearchField(),
              SearchText(),
            ],
          ),
        ),
      ),
    );
  }
}
