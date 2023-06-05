import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x_project/Models/spaceRocketModel.dart';
import 'package:space_x_project/Repositories/SpaceLisTRepositort.dart';

class RocketDetailScreen extends StatefulWidget {
  final String rocketId;

  const RocketDetailScreen({required this.rocketId});

  @override
  _RocketDetailScreenState createState() => _RocketDetailScreenState();
}

class _RocketDetailScreenState extends State<RocketDetailScreen> {
  late Future<Rocket> _rocketFuture;
  final SpaceListRepository _rocketsService = SpaceListRepository();

  @override
  void initState() {
    super.initState();
    _rocketFuture = _rocketsService.fetchRocketDetails(widget.rocketId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rocket Details')),
      body: FutureBuilder<Rocket>(
        future: _rocketFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to fetch rocket details'));
          } else if (snapshot.hasData) {
            final rocket = snapshot.data!;
            return Card(
                color: Colors.lightGreenAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rocket.name!, style: TextStyle(fontSize: 24)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Status: - ${rocket.active.toString()}",
                        style: TextStyle(fontSize: 24)),
                    SizedBox(
                      height: 5,
                    ),

                    Text("Description: - ${rocket.description.toString()}",
                        style: TextStyle(fontSize: 24)),

                    // Display other rocket details here
                  ],
                ));
          } else {
            return Container(); // Handle the case when snapshot has no data
          }
        },
      ),
    );
  }
}
