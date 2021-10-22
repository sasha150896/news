import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/helpers/const_helper.dart';
import 'package:news/models/news_model.dart';

class NewsWidget extends StatelessWidget {
  final NewsModel news;

  const NewsWidget({required this.news, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(ConstHelper.radius),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: ConstHelper.radius, topRight: ConstHelper.radius),
              child: Image.network(
                news.urlToImage,
                errorBuilder:
                    (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      ConstHelper.imageErrorMessage,
                      style: ConstHelper.drawerNormalStyle,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        news.publishedAt,
                        style: ConstHelper.normalTextStyle,
                      ),
                      Text(
                        news.source,
                        style: ConstHelper.normalTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    news.title,
                    style: ConstHelper.headerTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    news.description,
                    style: ConstHelper.normalTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
