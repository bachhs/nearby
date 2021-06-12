import 'package:flutter/material.dart';
import 'package:nearby/constants.dart';
import 'package:nearby/models/movie.dart';
import 'package:nearby/screens/details/details_screen.dart';
import 'package:nearby/screens/home/components/movie_carousel.dart';
import 'package:nearby/screens/home/components/product_card.dart';

import 'categories.dart';
import 'genres.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _currentTab = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Categorylist(
            onTap: () {
              setState(() {
                _currentTab = !_currentTab;
              });
            },
          ),
          Genres(),
          SizedBox(height: kDefaultPadding),
          _currentTab ? ListProduct() : MovieCarousel(),
        ],
      ),
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          // Our background
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          ListView.builder(
            // here we use our demo procuts list
            itemCount: movies.length,
            itemBuilder: (context, index) => ProductCard(
              itemIndex: index,
              product: movies[index],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(movie: movies[index])),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
