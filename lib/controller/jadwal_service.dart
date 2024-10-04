import 'package:supabase_flutter/supabase_flutter.dart';

class JadwalService {
  final _supabase = Supabase.instance.client;

  Future<List<Jadwal>> getAllJadwal() async {
    final response = await _supabase
        .from('Jadwal')
        .select('ID_Jadwal, ID_Ruangan, ID_Pendaftaran, Tanggal, Waktu_mulai, Waktu_selesai');
    return response.map((e) => Jadwal.fromJson(e)).toList();
  }

  Future<Jadwal> getJadwalById(int id) async {
    final response = await _supabase
        .from('Jadwal')
        .select('ID_Jadwal, ID_Ruangan, ID_Pendaftaran, Tanggal, Waktu_mulai, Waktu_selesai')
        .eq('ID_Jadwal', id);
    return Jadwal.fromJson(response.single);
  }

  Future<void> createJadwal(Jadwal jadwal) async {
    await _supabase.from('Jadwal').insert([
      {
        'ID_Ruangan': jadwal.idRuangan,
        'ID_Pendaftaran': jadwal.idPendaftaran,
        'Tanggal': jadwal.tanggal,
        'Waktu_mulai': jadwal.waktuMulai,
        'Waktu_selesai': jadwal.waktuSelesai,
      }
    ]);
  }

  Future<void> updateJadwal(Jadwal jadwal) async {
    await _supabase
        .from('Jadwal')
        .update({
          'ID_Ruangan': jadwal.idRuangan,
          'ID_Pendaftaran': jadwal.idPendaftaran,
          'Tanggal': jadwal.tanggal,
          'Waktu_mulai': jadwal.waktuMulai,
          'Waktu_selesai': jadwal.waktuSelesai,
        })
        .eq('ID_Jadwal', jadwal.idJadwal);
  }

  Future<void> deleteJadwal(int id) async {
    await _supabase.from('Jadwal').delete().eq('ID_Jadwal', id);
  }
}

class Jadwal {
  int idJadwal;
  int idRuangan;
  int idPendaftaran;
  DateTime tanggal;
  Time waktuMulai;
  Time waktuSelesai;

  Jadwal({
    required this.idJadwal,
    required this.idRuangan,
    required this.idPendaftaran,
    required this.tanggal,
    required this.waktuMulai,
    required this.waktuSelesai,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      idJadwal: json['ID_Jadwal'],
      idRuangan: json['ID_Ruangan'],
      idPendaftaran: json['ID_Pendaftaran'],
      tanggal: DateTime.parse(json['Tanggal']),
      waktuMulai: Time(json['Waktu_mulai']),
      waktuSelesai: Time(json['Waktu_selesai']),
    );
  }
}

class Time {
   int hour = 0;
   int minute = 0;

  Time(String time) {
    final parts = time.split(':');
    hour = int.parse(parts[0]);
    minute = int.parse(parts[1]);
  }
}