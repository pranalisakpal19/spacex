import 'package:flutter/material.dart';
import 'package:space_x_project/Models/spaceRocketModel.dart';

class SpaceTileWidget extends StatelessWidget {
  final Rocket spaceTile;

  const SpaceTileWidget({required this.spaceTile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() {
        //  Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => RocketDetailScreen(rocket: rocket),
        //         ),
        //       );
      }),
      // leading: Image.network(spaceTile.flickrImages.toString()),
      title: Text(spaceTile.name.toString()),
      subtitle: Text(spaceTile.country.toString()),
    );
  }
}
