import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsify/views/widgets/newsDetail.dart';


class ArticleCard extends StatelessWidget {
  final String imageUrl,description,title,url,content,author;
  ArticleCard(
      {required this.imageUrl,
        required this.title,
        required this.description,
        required this.url,
        required this.content,
        required this.author,

      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetail(imageUrl, content, author,description,title)));
    },
      child: Container(

        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: ClipRRect(

          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: Column(

            children: [
              CachedNetworkImage(imageUrl: imageUrl,height: 200,width: 500,fit: BoxFit.cover,),
              SizedBox(height: 8,),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
