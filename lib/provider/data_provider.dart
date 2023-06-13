import 'package:space_x_project/Models/spaceRocketModel.dart';
import 'package:space_x_project/Repositories/SpaceLisTRepositort.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<List<Rocket>>((ref) async {
  return ref.watch(userProvider).fetchRockets();
});

final detailsDataProvider = FutureProvider<List<Rocket>>((ref) async {
  return ref.watch(userProvider).fetchRockets();
});
