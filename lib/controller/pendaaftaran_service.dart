import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PendaftaranService {
  final _supabase = Supabase.instance.client;

  Future<List<Pendaftaran>> getAllPendaftaran() async {
    final response = await _supabase
        .from('Pendaftaran')
        .select('ID_Pendaftaran, ID_admin, ID_Pasien, ID_Dokter, Tanggal, Keluhan');
    return response.map((e) => Pendaftaran.fromJson(e)).toList();
  }

  Future<Pendaftaran> getPendaftaranById(int id) async {
    final response = await _supabase
        .from('Pendaftaran')
        .select('ID_Pendaftaran, ID_admin, ID_Pasien, ID_Dokter, Tanggal, Keluhan')
        .eq('ID_Pendaftaran', id);
    return Pendaftaran.fromJson(response.single);
  }

  Future<void> createPendaftaran(Pendaftaran pendaftaran) async {
    await _supabase.from('Pendaftaran').insert([
      {
        'ID_admin': pendaftaran.idAdmin,
        'ID_Pasien': pendaftaran.idPasien,
        'ID_Dokter': pendaftaran.idDokter,
        'Tanggal': pendaftaran.tanggal,
        'Keluhan': pendaftaran.keluhan,
      }
    ]);
  }

  Future<void> updatePendaftaran(Pendaftaran pendaftaran) async {
    await _supabase
        .from('Pendaftaran')
        .update({
          'ID_admin': pendaftaran.idAdmin,
          'ID_Pasien': pendaftaran.idPasien,
          'ID_Dokter': pendaftaran.idDokter,
          'Tanggal': pendaftaran.tanggal,
          'Keluhan': pendaftaran.keluhan,
        })
        .eq('ID_Pendaftaran', pendaftaran.idPendaftaran);
  }

  Future<void> deletePendaftaran(int id) async {
    await _supabase.from('Pendaftaran').delete().eq('ID_Pendaftaran', id);
  }
}

