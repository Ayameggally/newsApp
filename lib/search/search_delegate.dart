// import 'package:flutter/material.dart';
// import 'package:newsapp/api/api_service.dart';
// import 'package:newsapp/widgets/error_indicator.dart';
// import 'package:newsapp/widgets/loading_indicator.dart';


// class SearchTab extends SearchDelegate{
//   @override
//   List<Widget>? buildActions(BuildContext context) {

//    return [


//         IconButton(onPressed: (){
//          showResults(context);
//        }, icon: Icon(Icons.search)),

//    ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {

// return   Container(
//   width: double.infinity,
//   height: double.infinity,
//   decoration: BoxDecoration(
//       color: Colors.white,
//       image: DecorationImage(image: AssetImage('assets/pattern.png'))
//   ),
//   child: Scaffold(
//     body: IconButton(onPressed: (){
//       Navigator.pop(context);
//     }, icon:
//     Icon(Icons.arrow_back_ios)),
//   ),
// );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return FutureBuilder(
//       future: ApiService.getNews(quary: q),
//       builder: (context,snapShot){
//         if(snapShot.connectionState==ConnectionState.waiting){
//           return LoadingIndicator();
//         }else if(snapShot.hasError||snapShot.data!.status!='ok'){
//           return ErrorIndicator();
//         }else{
//           final newsList=snapShot.data?.articles??[];
//           return
//             Container(
//               width: double.infinity,
//               height: double.infinity,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   image: DecorationImage(image: AssetImage('assets/pattern.png'))
//               ),
//               child: Scaffold(
//                 body: ListView.builder(itemBuilder: (_,index){
//                 return newsItem(newsList[index]);
//                           },itemCount: newsList.length,),
//               ),
//             );
//         }
//       },


//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container();
//   }

// }
import 'package:flutter/material.dart';
import 'package:newsapp/api/api_service.dart';
import 'package:newsapp/news/news_item.dart';
import 'package:newsapp/widgets/error_indicator.dart';
import 'package:newsapp/widgets/loading_indicator.dart';

class SearchTab extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        query='';
        showSuggestions(context);
      },
       icon:Icon(Icons.clear),
       ),

      IconButton(onPressed: (){
        showResults(context);
      },
       icon:Icon(Icons.search),
       ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
     icon: Icon(Icons.arrow_back),
     );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNews(quary: query),
      builder: (context,snapShot){
        if(snapShot.connectionState==ConnectionState.waiting){
          return LoadingIndicator();
        }else if(snapShot.hasError||snapShot.data!.status!='ok'){
          return ErrorIndicator();
        }else{
          final newsList=snapShot.data?.news??[];
          return
            Container(
              width: double.infinity,
               height: double.infinity,
               decoration: BoxDecoration(
                   color: Colors.white,
                   image: DecorationImage(image: AssetImage('assets/pattern.png'),
                   ),
                   ),

              child: ListView.builder(
              itemBuilder: (_, index) =>  NewsItem(newsList[index]),
              itemCount: newsList.length,
              ),
            );
        }
      },
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
  if(query.isEmpty){
    return Center(
      child: Text(
        'Please enter text to search'
      ),
    );
  }
    return 
    FutureBuilder(
      future: ApiService.getNews(quary: query),
      builder: (context,snapShot){
        if(snapShot.connectionState==ConnectionState.waiting){
          return LoadingIndicator();
        }else if(snapShot.hasError||snapShot.data!.status!='ok'){
          return ErrorIndicator();
        }else{
          final newsList=snapShot.data?.news??[];
          return
            Container(
              width: double.infinity,
               height: double.infinity,
               decoration: BoxDecoration(
                   color: Colors.white,
                   image: DecorationImage(image: AssetImage('assets/images/pattern.png'),
                   ),
                   ),

              child: ListView.builder(
              itemBuilder: (_, index) =>  NewsItem(newsList[index]),
              itemCount: newsList.length,
              ),
            );
        }
      },
    );
  }
}