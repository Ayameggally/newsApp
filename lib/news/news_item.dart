import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/models/news_response/News.dart';
import 'package:newsapp/news/news_details.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.articals, {super.key});
  final Articals articals;

  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, NewsDetails.routeName,arguments:articals );
        },
        child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
