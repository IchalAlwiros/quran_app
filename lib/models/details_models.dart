class QuranDetails {
  bool? status;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  List<Ayat>? ayat;

  QuranDetails(
      {this.status,
      this.nomor,
      this.nama,
      this.namaLatin,
      this.jumlahAyat,
      this.tempatTurun,
      this.arti,
      this.deskripsi,
      this.audio,
      this.ayat});

  factory QuranDetails.fromJson(Map<String, dynamic> json) => QuranDetails(
        status: json['status'],
        nomor: json['nomor'],
        nama: json['nama'],
        namaLatin: json['nama_latin'],
        jumlahAyat: json['jumlah_ayat'],
        tempatTurun: json['tempat_turun'],
        arti: json['arti'],
        deskripsi: json['deskripsi'],
        audio: json['audio'],
        ayat: List<Ayat>.from(
            (json['ayat'] as List).map((x) => Ayat.fromJson(x)).where(
                  (ayat) =>
                      ayat.ar != null &&
                      ayat.idn != null &&
                      ayat.nomor != null &&
                      ayat.tr != null,
                )),
      );
}

class Ayat {
  String? nomor;
  String? ar;
  String? tr;
  String? idn;

  Ayat({
    required this.ar,
    required this.idn,
    required this.nomor,
    required this.tr,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomor: json['nomor'].toString(),
        ar: json['ar'],
        tr: json['tr'],
        idn: json['idn'],
      );
}
