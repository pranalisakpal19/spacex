import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:space_x_project/BaseUrl/API_Config.dart';
import 'package:space_x_project/Models/spaceRocketModel.dart';

class SpaceListRepository {
  // ignore: missing_return
  Future<List<Rocket>> fetchRockets() async {
    List<Rocket> rockets = [];

    final response =
        await http.get(Uri.parse('${ApiConfiguration.base_url}rockets'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return rockets = jsonData.map((json) => Rocket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch rockets');
    }
  }

  Future<Rocket> fetchRocketDetails(String id) async {
    final response =
        await http.get(Uri.parse('https://api.spacexdata.com/v4/rockets/$id'));
    if (response.statusCode == 200) {
      final jsonRocket = json.decode(response.body);
      return Rocket(
          // id: jsonRocket['id'],
          name: jsonRocket['name'],
          active: jsonRocket['active'],
          description: jsonRocket["description"]
          // engines: jsonRocket['engines']['number'],
          // flickrImages: jsonRocket['flickr_images'][0],
          );
    } else {
      throw Exception('Failed to fetch rocket details');
    }
  }
}
