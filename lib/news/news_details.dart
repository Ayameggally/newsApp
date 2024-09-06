import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/models/news_response/News.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';


class NewsDetails extends StatelessWidget {
  static const String routeName = "/newsDetails";
  const NewsDetails({  super.key});

  @override
  Widget build(BuildContext context) {
    var articals = ModalRoute.of(context)!.settings!.arguments as Articals;
   final titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png'),
        fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('News App',style: TextStyle(color: Colors.white),),
          ),
        body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    articals.urlToImage ??
                        'https://www.au.edu.pk/Pages/Faculties/DASSS/Departments/AerospaceSciences/Assets/No_image.jpg',
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  articals.source?.name ?? '',
                  style: titleSmallStyle?.copyWith(
                    color: AppTheme.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  articals.title ?? '',
                  style: titleSmallStyle?.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    timeago.format(articals.publishedAt ?? DateTime.now()),
                    style: titleSmallStyle?.copyWith(
                      color: AppTheme.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(articals.content??"",
                  style: Theme.of(context).textTheme.titleSmall!.
                copyWith(
                    fontWeight: FontWeight.w300,
                    color: Color(0XFF42505C),
                ),),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    _launchUrl(articals.url??"");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("View article ",
    
                        style: Theme.of(context).textTheme.titleLarge!.
                        copyWith(
                            color: AppTheme.grey
                        ),),
                      Icon(Icons.arrow_forward_ios_rounded,color: AppTheme.grey,)
                    ],
                  ),
                )
              ],
            ),
          ),
              
            ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);

  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
}