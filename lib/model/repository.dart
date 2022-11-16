import 'package:live_coding/model/chiste_model.dart';

abstract class JokeRepository {
  Future<Chiste?> getRandomJoke();
}
