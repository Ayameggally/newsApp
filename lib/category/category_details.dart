import 'package:flutter/material.dart';
import 'package:newsapp/api/api_service.dart';
import 'package:newsapp/tabs/sources_tabs.dart';
import 'package:newsapp/widgets/error_indicator.dart';
import 'package:newsapp/widgets/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails(
    this.categoryId, {
    super.key,
  });
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return sourcesTabs(sources);
        }
      },
    );
  }
}
