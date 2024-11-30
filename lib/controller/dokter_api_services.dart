import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rawat_jalan/model/dokter_model_api.dart';

class DokterServicesApi {
  static Future<List<DokterModelApi>> getDokters() async {
    final response =
        await http.get(Uri.parse('http://202.10.36.253:3001/api/dokter'));

    final data = json.decode(response.body);

    if (data['status'] == 200) {
      final List<dynamic> dokterJsonList = data['payload'];
      return dokterJsonList
          .map((json) => DokterModelApi.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load dokters');
    }
  }
}
