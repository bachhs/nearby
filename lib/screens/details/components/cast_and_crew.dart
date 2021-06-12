import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {
  final List casts;

  const CastAndCrew({Key? key, required this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Text(
            "Với sự tham gia",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts.length,
              itemBuilder: (context, index) => CastCard(cast: casts[index]),
            ),
          )
        ],
      ),
    );
  }
}
