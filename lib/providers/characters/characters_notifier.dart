import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/characters.dart';
import '../../data/repositorys/characters_repository.dart';
import '../../data/web_services/web_api.dart';
import 'characters_state.dart';

final characterProvider =
    StateNotifierProvider<CharactersNotifier, CharactersState>((ref) {
  final charactersRepository = ref.watch(_charactersProvider);
  return CharactersNotifier(charactersRepository);
});

final _charactersProvider = Provider<CharactersRepository>((ref) {
  final webApi = ref.watch(_webApiProvider);
  return CharactersRepository(webApi);
});

final _webApiProvider = Provider<WebApi>((ref) {
  return WebApi();
});

class CharactersNotifier extends StateNotifier<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> allCharacters = [];
  CharactersNotifier(this.charactersRepository) : super(CharactersInitial()) {
    getAllCharacters();
  }

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      allCharacters = characters;
      CharactersLoaded(allCharacters);
      log('Characters Notifier');
      log(characters.toString());
    });
    return allCharacters;
  }
}
