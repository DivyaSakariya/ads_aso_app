import 'package:ads_aso_app/helpers/ads_helper.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {
    int reward = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reward Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Reward: $reward"),
              ElevatedButton(
                onPressed: () {
                  AdsHelper.adsHelper.rewardedAd.show(
                    onUserEarnedReward: (adView, item) {
                      Logger().i("Reward: ${item.amount}");

                      setState(() {
                        reward += item.amount as int;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Reward ${item.amount} added..."),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  ).then(
                    (value) => AdsHelper.adsHelper.loadAds(),
                  );
                },
                child: const Text("Get Reward"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
