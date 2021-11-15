import 'package:flutter/material.dart';

import 'newsCategory.dart';

class CategoryTile extends StatelessWidget {
  final imageurl, name;

  CategoryTile({this.imageurl, this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsCategory(
               name,
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageurl,
                  height: 50,
                  width: 140,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
