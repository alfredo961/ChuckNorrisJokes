import 'package:flutter/material.dart';
import 'package:live_coding/model/api.dart';
import 'package:live_coding/model/chiste_model.dart';
import 'package:live_coding/model/repository.dart';
import 'package:live_coding/model/repository_implementation.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    initState();
  }

  void initState() async {
    getJoke();
  }

  final JokeRepository _repository = JokeRepositoryImplementation(ApiService());
  Chiste? randomJoke;
  bool isloading = false;

  Future getJoke() async {
    try {
      isloading = true;
      notifyListeners();
      final joke = await _repository.getRandomJoke();
      isloading = false;
      notifyListeners();
      if (joke != null) {
        randomJoke = joke;
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
