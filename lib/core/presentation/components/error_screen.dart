import 'package:flutter/material.dart';
import 'package:movie_app/core/presentation/components/error_text.dart';
import 'package:movie_app/core/resources/app_colors.dart';
import 'package:movie_app/core/resources/app_values.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.onTryAgainPressed});

  final Function() onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon.png',
            height: AppSize.s84,
            width: AppSize.s84,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: AppPadding.p14, top: AppPadding.p14),
            child: ErrorText(),
          ),
          ElevatedButton(
            onPressed: onTryAgainPressed,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text("try again", style: textTheme.bodyMedium,),
          )
        ],
      ),
    );
  }
}
