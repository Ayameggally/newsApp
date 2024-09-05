import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key,
  required this.onItemSelected,
  });
  final void Function (DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    final titleLargeStyle =
      Theme.of(context).textTheme.titleLarge ?.copyWith(fontSize: 24);
     final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width*0.7,
      child: Column(
        children: [
          Container(
            height: screenSize.height*0.2,
            width: double.infinity,
            color: AppTTheme.primary,
            alignment: Alignment.center,
            child: Text('News App',
            style:titleLargeStyle ,
            ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.only( top: 12, start: 12),
                color: AppTTheme.white,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => onItemSelected(DrawerItem.Categories) ,
                      child: Row(
                        children: [
                          const Icon(Icons.menu),
                          const SizedBox(width: 8,),
                           Text('Categories',
                          style: titleLargeStyle?.copyWith(color: AppTTheme.black),
                          ),
                          ],
                          ),
                    ),
                    const SizedBox(height: 12,),
                     GestureDetector(
                      onTap: () => onItemSelected(DrawerItem.Settings) ,
                      child: Row(
                        children: [
                          const Icon(Icons.settings_rounded),
                          const SizedBox(width: 8,),
                           Text('Settings',
                          style: titleLargeStyle?.copyWith(color: AppTTheme.black),
                          ),
                          ],
                          ),
                    ),
                        ],
                        ),
              ),
            ),
            ],
            ),
    );
  }
}
enum DrawerItem{
  Categories,
  Settings;
}