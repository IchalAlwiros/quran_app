import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/shared/theme.dart';
import 'package:quran_app/ui/widgets/detail_surah.dart';

class SurahItem extends StatelessWidget {
  final int nomorSurah;
  final String nama;
  final String nama_latin;
  final int jumlah_ayat;
  final String tempat_turun;

  SurahItem(this.nomorSurah, this.nama, this.nama_latin, this.jumlah_ayat,
      this.tempat_turun);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailSurah(nomor: nomorSurah)));
        }),
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset('assets/icons/banner_ayat.svg')),
                Text(
                  nomorSurah.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                )
              ],
            ),
          ),
          title: Text(
            nama_latin,
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(tempat_turun.toUpperCase(),
                  style: greenAccentTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: bold,
                  )),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.circle,
                color: kWhiteColor,
                size: 8,
              ),
              SizedBox(
                width: 5,
              ),
              Text(jumlah_ayat.toString() + ' ayat'.toUpperCase(),
                  style: greenAccentTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: bold,
                  )),
            ],
          ),
          trailing: Text(
            nama,
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 20,
              color: kInactiveColor,
            ),
          ),
        ),
      ),
    );
  }
}
