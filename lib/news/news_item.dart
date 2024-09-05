import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;


class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final titleSmallStyle= Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Image.asset('assets/images/_118109970_livreal.png',
            height: MediaQuery.of(context).size.height*0.25 ,
            width: double.infinity,
            fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height:4),
          Text('BBC News',
          style: titleSmallStyle?.copyWith(
            color: AppTTheme.grey,
            fontSize: 14,
            ),

          ),
          const SizedBox(height:4),
          Text("Why are football's biggest clubs starting a new tournament?",
          style: titleSmallStyle?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Text(
              timeago.format(DateTime.now()),
              style: titleSmallStyle?.copyWith(
              color: AppTTheme.grey,
              fontSize: 13,
              ),
              ),
          ),
        ],
      ),
    );
  }
}