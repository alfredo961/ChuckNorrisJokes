import 'package:live_coding/model/api.dart';
import 'package:live_coding/model/chiste_model.dart';
import 'package:live_coding/model/repository.dart';

class JokeRepositoryImplementation extends JokeRepository {
  final ApiService api;
  JokeRepositoryImplementation(this.api);
  @override
  Future<Chiste?> getRandomJoke() {
    final result = api.getRandomJoke();
    return result;
  }
}
