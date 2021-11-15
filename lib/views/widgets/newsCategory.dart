import 'package:flutter/material.dart';
import 'package:newsify/helper/newsapi.dart';
import 'package:newsify/models/article.dart';

import '../home.dart';
import 'articalcard.dart';

class NewsCategory extends StatefulWidget {
  final String categoryname;

  NewsCategory(this.categoryname);

  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}


class _NewsCategoryState extends State<NewsCategory> {
  bool loading = true;
  List<ArticleModel> articles = [];

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    CategoryNews updatedNews = CategoryNews();
    var newsTopic=widget.categoryname;
    if(newsTopic=='COVID-19'){
      newsTopic='health';
    }
    await updatedNews.getCategoryNews(newsTopic);
    articles = updatedNews.articles;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: lighttheme ? Colors.white : Colors.black,
          ),

        ), centerTitle: false,
        elevation: 0,
        title:   Text(
          widget.categoryname,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),

      ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: <Widget>[
                loading
                    ? Container(
                  height: MediaQuery.of(context).size.height - 80,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      lighttheme ? Colors.white : Colors.black,
                    ),
                  ),
                )
                    : Container(
                  height: MediaQuery.of(context).size.height -110,
                  child: RefreshIndicator(
                    backgroundColor:
                    lighttheme ? Colors.black : Colors.white,
                    color: lighttheme ? Colors.white : Colors.black,
                    onRefresh: () => getNews(),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: articles.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ArticleCard(
                            url: articles[index].url,
                            description: articles[index].description,
                            title: articles[index].title,
                            imageUrl: articles[index].imageUrl,content: articles[index].content,author: articles[index].author,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
