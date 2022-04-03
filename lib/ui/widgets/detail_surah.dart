import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/details_models.dart';
import 'package:quran_app/services/api_services.dart';

import '../../shared/theme.dart';

class DetailSurah extends StatelessWidget {
  const DetailSurah({Key? key, required this.nomor}) : super(key: key);
  final int nomor;

  @override
  Widget build(BuildContext context) {
    var listDetails = Provider.of<ApiServices>(context);
    return Scaffold(
        body: FutureBuilder<QuranDetails>(
            future: listDetails.getDetail(nomor),
            builder: (context, AsyncSnapshot<QuranDetails> snapshot) {
              print(snapshot.data);

              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return ListView.separated(
                    itemBuilder: (context, index) =>
                        CircularProgressIndicator(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 8);
              } else {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${snapshot.data!.ayat![index].ar}"),
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
            }));
  }
}
