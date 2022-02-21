import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/model/article_model.dart';
import 'package:news_project/model/news_sources.dart';
import 'package:news_project/pages/articles_details_page.dart';

Widget SourcePage(Sources sources,BuildContext context){

  return InkWell(

    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowSoursePage(sources: sources)));
    },

    child: Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(color: Colors.black12,blurRadius: 3.0),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              sources.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            sources.description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    ),
  );
}