// import 'package:flutter/material.dart';
// import 'package:newsapp/api/api_service.dart';
// import 'package:newsapp/news/news_item.dart';
// import 'package:newsapp/widgets/error_indicator.dart';
// import 'package:newsapp/widgets/loading_indicator.dart';

// class NewsList extends StatelessWidget {
//   const NewsList(this. sourceId,{super.key});

//    final String sourceId;
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ApiService.getNews(),
//       builder:(context, snapshot) {
//         if(snapshot.connectionState == ConnectionState.waiting){
//              return LoadingIndicitor();
//         }else if(snapshot.hasError || snapshot.data ?.status!='ok'){
//           return const ErrorIndictor();
//         }else{
//           final newsList = snapshot.data?.news ??[];
//          return ListView.builder(
//             itemBuilder: (_, index) => NewsItem(newsList[index]),
//             itemCount: newsList.length,
//             );
//         }
//       },);
//   }
// }
import 'package:flutter/material.dart';
import 'package:newsapp/api/api_service.dart';
import 'package:newsapp/news/news_item.dart';
import 'package:newsapp/widgets/error_indicator.dart';
import 'package:newsapp/widgets/loading_indicator.dart';



class NewsList extends StatefulWidget {
  const NewsList(this.sourceId,{super.key});

  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int page=1;
  int pageSize=20;
  ScrollController scrollController= ScrollController();
  @override
  void initState() {
    
    super.initState();
    scrollController.addListener(
      () { 
        if(scrollController.position.atEdge){
          print('-------------AtEdge');
          if(scrollController.offset!=0){
            setState(() { });
            page++;
            scrollController.animateTo(
              0, 
             curve: Curves.bounceOut,
             duration: Duration(seconds: 1),
             );
          }
        }
      });
  }
  Widget build(BuildContext context) {
    return FutureBuilder(
     future: ApiService.getNews(sourceId:widget.sourceId,
     page:page,
     pageSize: pageSize,
     ),
     builder: (context, snapshot) {
       if(snapshot.connectionState==ConnectionState.waiting){
        return const LoadingIndicator();
       } else if(snapshot.hasError||snapshot.data?.status!='ok'){
         return const ErrorIndicator();
       }else{
        final newsList = snapshot.data?.news ??[];
        return RefreshIndicator(
          onRefresh: ()async{
            setState(() {
              page=1;
            });
          },
          child: ListView.builder(
            controller: scrollController,
              itemBuilder: (_, index) =>  NewsItem(newsList[index]),
              itemCount: newsList.length,
              ),
        );
       }
     },
     );
  }
}