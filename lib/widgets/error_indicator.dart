import 'package:flutter/cupertino.dart';
import 'package:newsapp/app_theme.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Something went Wrong !",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: AppTheme.primary),
      ),
    );
  }
}
