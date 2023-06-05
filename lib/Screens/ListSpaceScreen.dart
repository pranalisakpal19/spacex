import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_x_project/Repositories/SpaceLisTRepositort.dart';
import 'package:space_x_project/Screens/RocketDetailsScreen.dart';
import 'dart:convert';

import '../Models/spaceRocketModel.dart';
import '../Widgets/SpaceListTileWidget.dart';

class RocketsScreen extends StatefulWidget {
  @override
  _RocketsScreenState createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  late Future<List<Rocket>> _rocketsFuture;
  final SpaceListRepository _rocketsService = SpaceListRepository();

  @override
  void initState() {
    super.initState();
    _rocketsService.fetchRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SpaceX Rockets')),
      body: FutureBuilder<List<Rocket>>(
        future: _rocketsService.fetchRockets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to fetch rockets'));
          } else if (snapshot.hasData) {
            final rockets = snapshot.data!;
            return ListView.builder(
              itemCount: rockets.length,
              itemBuilder: (context, index) {
                final rocket = rockets[index];
                return ListTile(
                  title: Text(rocket.name.toString()),
                  subtitle: Text(rocket.country.toString()),
                  leading: Image.network(rocket.flickrImages.toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RocketDetailScreen(rocketId: rocket.id!),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Container(); // Handle the case when snapshot has no data
          }
        },
      ),
    );
  }
}
