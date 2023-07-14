import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/helpers/random_generator.dart';

final usersInChatProvider = StreamProvider<List<String>>((ref) async* {
  final names = <String>[];
  // yield [];

  await for (final name in RandomGenerator.randomNameStream()) {
    names.add(name);
    yield names;
  }
});
