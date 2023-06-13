import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_x_project/Repositories/SpaceLisTRepositort.dart';
import 'package:space_x_project/Screens/RocketDetailsScreen.dart';
import 'package:space_x_project/provider/data_provider.dart';
import 'dart:convert';

import '../Models/spaceRocketModel.dart';
import '../Widgets/SpaceListTileWidget.dart';

class RocketsScreen extends StatefulWidget {
  @override
  _RocketsScreenState createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  // late Future<List<Rocket>> _rocketsFuture;
  // final SpaceListRepository _rocketsService = SpaceListRepository();

  @override
  void initState() {
    super.initState();
    // _rocketsService.fetchRockets();
  }

  @override
  Widget build(BuildContext context, ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(title: const Text("List Spacex")),
        body: userData.when(
            data: (userData) {
              List<Rocket> userList = userData.map((e) => e).toList();
              return ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  final rocket = userList[index];
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
            },
            error: (error, s) => Text(error.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
