import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/app_colors.dart';
import 'package:movie_app/core/resources/app_strings.dart';
import 'package:movie_app/core/resources/app_values.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
        child: TextFormField(
      controller: _textController,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
            borderSide: const BorderSide(color: AppColors.primaryText),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
            borderSide: const BorderSide(color: AppColors.primaryText),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.primaryText,
          ),
          suffixIcon: const Icon(
            Icons.clear_rounded,
            color: AppColors.primaryText,
          ),
          hintText: AppStrings.searchHint,
          hintStyle: textTheme.bodyLarge),
    ));
  }
}
