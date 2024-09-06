import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/category/categories_grid.dart';
import 'package:newsapp/category/category_details.dart';
import 'package:newsapp/category/category_model.dart';
import 'package:newsapp/drawer/home_drawer.dart';
import 'package:newsapp/search/search_delegate.dart';
import 'package:newsapp/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: SearchTab());
            }, 
            icon: Icon(Icons.search,size: 30,))
          ],
        ),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.Categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingsTab(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.Categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedDrawerItem = drawerItem;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
