import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/details_models.dart';
import 'package:quran_app/services/api_services.dart';
import 'package:quran_app/ui/widgets/shimmer_loading.dart';

import '../../shared/theme.dart';

class DetailSurah extends StatelessWidget {
  const DetailSurah({Key? key, required this.nomor, required this.nama})
      : super(key: key);
  final int nomor;
  final String nama;

  @override
  Widget build(BuildContext context) {
    var listDetails = Provider.of<ApiServices>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff146356),
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
            ),
          ),
          title: Text(
            nama,
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                child: FutureBuilder<QuranDetails>(
                    future: listDetails.getDetail(nomor),
                    builder: (context, AsyncSnapshot<QuranDetails> snapshot) {
                      // print('ini dari list tile ${snapshot.data!.length}');

                      var state = snapshot.connectionState;
                      if (state != ConnectionState.done) {
                        return ListView.separated(
                            itemBuilder: (context, index) => ShimmerSkelton(),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: 8);
                      } else {
                        if (snapshot.hasData) {
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
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
                                              child: SvgPicture.asset(
                                                  'assets/icons/banner_ayat.svg')),
                                          Text(
                                            snapshot.data!.ayat![index].nomor!,
                                            style: whiteTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: semiBold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    title: Text(
                                      "${snapshot.data!.ayat![index].ar}",
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${snapshot.data!.ayat![index].idn}',
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: light,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: kGreyColor,
                                );
                              },
                              itemCount: snapshot.data!.ayat!.length);
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              snapshot.error.toString(),
                            ),
                          );
                        } else {
                          return Text('');
                        }
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
