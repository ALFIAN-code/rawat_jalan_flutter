import 'dart:convert';

import 'package:rawat_jalan/model/jenis_layanan_model.dart';
import 'package:http/http.dart' as http;

class RadiologiService {
  //to do
  // make function to fetch data : jenis layanan, jenis pemeriksaan

  static Future<List<LayananModel>> getlayanan() async {
    final response = await http.get(
      Uri.parse('https://wabw.chasterise.fun/api/layanan'),
    );

    final data = json.decode(response.body);

    if (data['status'] == 200) {
      print('data layanan ${data['payload']}');
      final List<dynamic> dokterJsonList = data['payload'];
      return dokterJsonList.map((json) => LayananModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load layanan');
    }
  }
}
