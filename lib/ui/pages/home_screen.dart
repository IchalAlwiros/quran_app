import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/shared/theme.dart';
import 'package:quran_app/ui/widgets/shimmer_loading.dart';

import '../../models/quran_models.dart';
import '../../services/api_services.dart';
import '../widgets/surah_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headers() {
      var listSurah = Provider.of<ApiServices>(context);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Asslamualaikum',
              style: greenAccentTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              )),
          Text('Alwiros Alhassan',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 130,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kInactiveColor,
                  kPrimaryColor,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.menu_book, color: Colors.white),
                          Text(
                            ' Last Read',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Al-Fatiah',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        'Ayah No: 1',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 80,
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    'assets/icons/Quran.svg',
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // TODO: Surah List
    Widget surahList() {
      var listSurah = Provider.of<ApiServices>(context);

      return Container(
        padding: EdgeInsets.only(top: 15),
        child: DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 5.0, color: kInactiveColor)),
                  labelColor: Colors.white,
                  unselectedLabelColor: kInactiveColor,
                  labelStyle: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                  tabs: [
                    Tab(text: 'Surah'),
                    Tab(text: 'Juz'),
                  ],
                ),
              ),
              Container(
                height: 400, //height of TabBarView
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: kInactiveColor, width: 0.5))),
                child: TabBarView(
                  children: <Widget>[
                    FutureBuilder<List<SurahModel>>(
                        future: listSurah.getData(),
                        builder: (context,
                            AsyncSnapshot<List<SurahModel>> snapshot) {
                          print(snapshot.data);

                          var state = snapshot.connectionState;
                          if (state != ConnectionState.done) {
                            return ListView.separated(
                                itemBuilder: (context, index) =>
                                    ShimmerSkelton(),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                itemCount: 8);
                          } else {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    return SurahItem(
                                      snapshot.data![index].nomor,
                                      snapshot.data![index].nama,
                                      snapshot.data![index].nama_latin,
                                      snapshot.data![index].jumlah_ayat,
                                      snapshot.data![index].tempat_turun,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      color: kGreyColor,
                                    );
                                  },
                                  itemCount: snapshot.data!.length);
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
                    FutureBuilder<List<SurahModel>>(
                        future: listSurah.getData(),
                        builder: (context,
                            AsyncSnapshot<List<SurahModel>> snapshot) {
                          print(snapshot.data);

                          var state = snapshot.connectionState;
                          if (state != ConnectionState.done) {
                            return ListView.separated(
                                itemBuilder: (context, index) =>
                                    ShimmerSkelton(),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                itemCount: 8);
                          } else {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    return SurahItem(
                                      snapshot.data![index].nomor,
                                      snapshot.data![index].nama,
                                      snapshot.data![index].nama_latin,
                                      snapshot.data![index].jumlah_ayat,
                                      snapshot.data![index].tempat_turun,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      color: kGreyColor,
                                    );
                                  },
                                  itemCount: snapshot.data!.length);
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
                    // Text('data 2'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff146356),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        ),
        title: Text(
          'Quran App',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headers(),
              surahList(),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff146356),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.green,
          items: [
            BottomNavigationBarItem(
              label: 'Icon',
              icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff00C897),
                ),
                child: SvgPicture.asset('assets/icons/icon_1.svg'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Icon',
              icon: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff00C897),
                ),
                child: SvgPicture.asset('assets/icons/icon_2.svg'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Icon',
              icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff00C897),
                ),
                child: SvgPicture.asset('assets/icons/icon_3.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
