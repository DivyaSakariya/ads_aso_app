import 'package:ads_aso_app/helpers/ads_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.appOpenAd.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                  child: AdWidget(
                    ad: AdsHelper.adsHelper.nativeAd,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Container(
                            color: Colors.primaries[index % 18],
                          ),
                          title: Text("Item: ${index + 1}"),
                          subtitle: Text("subtitle of Item: ${index + 1}"),
                          trailing: IconButton(
                            onPressed: () {
                              AdsHelper.adsHelper.interstitialAd.show().then(
                                (value) {
                                  AdsHelper.adsHelper.loadAds();
                                  Navigator.of(context)
                                      .pushNamed('/reward_page');
                                },
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AdsHelper.adsHelper.bannerAd.size.height.toDouble(),
            width: AdsHelper.adsHelper.bannerAd.size.width.toDouble(),
            child: AdWidget(
              ad: AdsHelper.adsHelper.bannerAd,
            ),
          ),
        ],
      ),
    );
  }
}
