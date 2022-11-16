import 'dart:convert';
import 'package:live_coding/model/chiste_model.dart';
import 'package:http/http.dart' as http;
import 'package:live_coding/view/utils/constants.dart';
import 'package:live_coding/view/utils/texts.dart';

class ApiService {
  Future<Chiste> getRandomJoke() async {
    final response = await http.get(Uri.parse(Constants.url));

    if (response.statusCode == 200) {
      final newJoke = Chiste.fromJson(jsonDecode(response.body));
      return newJoke;
    } else {
      throw Exception(Textos.error);
    }
  }
}
