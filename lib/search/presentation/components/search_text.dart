import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/app_strings.dart';
import 'package:movie_app/core/resources/app_values.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.search,
            style: textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p10),
            child: Text(
              AppStrings.searchText,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
