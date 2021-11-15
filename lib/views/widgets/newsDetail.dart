import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class NewsDetail extends StatelessWidget {
  final String imageUrl, content, author,des,title;

  NewsDetail(this.imageUrl, this.content, this.author,this.des,this.title);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: Colors.white,

          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          width: width,
                          height: 500,
                          fit: BoxFit.cover),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(

                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(bottom: 10, left: 10),
                          child: Text(author,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.blue
                              )),
                        ),
                        Spacer(),
                        Icon(Icons.bookmark_border,size: 30, color: Colors.black,),
                        Icon(Icons.add_alert_sharp,size: 30, color: Colors.black),
                        SizedBox(width: 10,)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(des,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.black)),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Text(content,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color:Colors.black)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}
