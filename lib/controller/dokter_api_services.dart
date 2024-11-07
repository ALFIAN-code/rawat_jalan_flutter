import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rawat_jalan/model/dokter_model_api.dart';

class DokterServicesApi {
  static Future<List<DokterModelApi>> getDokters() async {
    final response = await http.get(
        Uri.https(
          'https://cors-anywhere.herokuapp.com/https://0sr024r8-3000.asse.devtunnels.ms/api/dokter/',
        ),
        headers: {'X-Requested-With': 'XMLHttpRequest'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> dokterJsonList = data['payload'];

      print("list dokter ${dokterJsonList[1]['Nama']}");
      return dokterJsonList
          .map((json) => DokterModelApi.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load dokters');
    }
  }
}
