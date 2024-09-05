import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/category/category_item.dart';
import 'package:newsapp/category/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key,
  required this.onCategorySelected});
  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    const List<CategoryModel>categories =[
      CategoryModel(
        id: 'sports',
        name: 'Sports', 
      imageName: 'sports', 
      color: Color(0xFFc91c22),
      ),
      CategoryModel(
        id: 'politics',
        name: 'Politics', 
      imageName: 'Politics', 
      color: Color(0xFF003E90),
      ),
      CategoryModel(
        id: 'health',
        name: 'Health', 
      imageName: 'health', 
      color: Color(0xFFED1E79),
      ),
      CategoryModel(
        id: 'bussines',
        name: 'Bussines', 
      imageName: 'bussines', 
      color: Color(0xFFCF7E48),
      ),
      CategoryModel(
        id: 'environment',
        name: 'Environment', 
      imageName: 'environment', 
      color: Color(0xFF4882CF),
      ),
      CategoryModel(
        id: 'science',
        name: 'Science', 
      imageName: 'science', 
      color: Color(0xFFF2D352),
      ),
    ];
     
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category of interest',
            style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppTTheme.navy),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                ),
               itemBuilder: (_, index) {
                final Category = categories[index];
                 return GestureDetector(
                onTap: () => onCategorySelected(Category),
                 child: CategoryItem(
                  category: Category,
                  index: index,),
               );} ,
               itemCount: categories.length,
               ),
          )
          ],
          ),
    );
  }
}