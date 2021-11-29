import 'dart:developer';

import '../models/characters.dart';
import '../web_services/web_api.dart';

class CharactersRepository {
  final WebApi webApi;

  CharactersRepository(this.webApi);

  Future<List<Character>> getAllCharacters() async {
    final characters = await webApi.getAllCharacters();
     log('Characters Repository');
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
