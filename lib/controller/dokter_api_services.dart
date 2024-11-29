import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rawat_jalan/model/dokter_model_api.dart';

class DokterServicesApi {
  static Future<List<DokterModelApi>> getDokters() async {
    final response = await http.get(
        // Uri.parse('https://ct9f9ll8-3000.asse.devtunnels.ms/api/dokter'));
        Uri.http('ct9f9ll8-3000.asse.devtunnels.ms', '/api/dokter'));

    final data = json.decode(response.body);

    if (data['status'] == 200) {
      // print('data dokter didapatkan ${data['payload']}');
      final List<dynamic> dokterJsonList = data['payload'];

      // print("list dokter ${dokterJsonList[1]['Nama']}");
      return dokterJsonList
          .map((json) => DokterModelApi.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load dokters');
    }
  }
}
