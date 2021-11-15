import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsify/helper/data.dart';
import 'package:newsify/helper/newsapi.dart';
import 'package:newsify/models/article.dart';
import 'package:newsify/models/categoryModel.dart';
import 'package:newsify/theme/themedata.dart';
import 'package:newsify/views/widgets/articalcard.dart';
import 'package:newsify/views/widgets/categoryTile.dart';
import 'package:provider/provider.dart';
bool lighttheme = false;
bool initial = true;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News updatedNews = News();
    await updatedNews.getNews();
    articles = updatedNews.articles;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AppBar(
              leading: Icon(
                Icons.receipt,
                size: 30,
                color: lighttheme ? Colors.white : Colors.black,
              ),
              actions: appbarActions(_themechanger),
              centerTitle: false,
              elevation: 0,
              title:   Text(
                'Newsify',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: <Widget>[
              // //CATEGORIES
              Container(
                height: 55,
                margin: EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      imageurl: categories[index].imageURL,
                      name: categories[index].categoryName,
                    );
                  },
                ),
              ),
              loading
                  ? Container(
                height: MediaQuery.of(context).size.height - 200,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    lighttheme ? Colors.white : Colors.black,
                  ),
                ),
              )
              // : Container(height:MediaQuery.of(context).size.height*2,color:Colors.blue),
                  : Container(
                    height: MediaQuery.of(context).size.height - 170,
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
              )
            ],
          ),
        ));
  }

  List<Widget> appbarActions(ThemeChanger _themechanger) {
    return <Widget>[
      IconButton(
        icon: Icon(
          Icons.brightness_6,
          color: lighttheme ? Colors.white : Colors.black,
        ),
        onPressed: () {
          lighttheme ? _themechanger.lightTheme() : _themechanger.darkTheme();
          if (lighttheme == true) {
            lighttheme = false;
          } else {
            lighttheme = true;
          }
        },
      ),
      IconButton(
        icon: Icon(
          Icons.info,
          color: lighttheme ? Colors.white : Colors.black,
        ),
        onPressed: () {

        },
      )
    ];
  }
}
