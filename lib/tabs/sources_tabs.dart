import 'package:flutter/material.dart';
import 'package:newsapp/models/sources_response/source.dart';
import 'package:newsapp/news/NEWS_List.dart';
import 'package:newsapp/tabs/tab_item.dart';

class sourcesTabs extends StatefulWidget {
  const sourcesTabs(
    this.sources, {
    super.key,
  });
  final List<Source> sources;
  @override
  State<sourcesTabs> createState() => _sourcesTabState();
}

class _sourcesTabState extends State<sourcesTabs> {
  int selectedIndex = 0;
  int page=1;
  int pageSize=20;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: widget.sources
                  .map((source) => TabItem(
                        source: source.name ?? '',
                        isSelected:
                            widget.sources.indexOf(source) == selectedIndex,
                      ))
                  .toList()),
        ),
        Expanded(
          child: NewsList(widget.sources[selectedIndex].id??''),
        ),
      ],
    );
  }
}
