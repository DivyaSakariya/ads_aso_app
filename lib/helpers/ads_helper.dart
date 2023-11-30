import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';

class AdsHelper {
  AdsHelper._();

  static final AdsHelper adsHelper = AdsHelper._();

  Logger logger = Logger();

  late BannerAd bannerAd;
  late InterstitialAd interstitialAd;
  late RewardedAd rewardedAd;
  late NativeAd nativeAd;
  late AppOpenAd appOpenAd;

  late String bannerAdId;
  late String interstitialAdId;
  late String rewardedAdId;
  late String nativeAdId;
  late String appOpenAdId;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  String adsCollection = "Ads-Id";

  Future<void> loadAds() async {
    await loadBannerAd();
    await loadInterstitialAd();
    await loadRewardedAd();
    await loadNativeAd();
    await loadAppOpenAd();
  }

  Future<String> getAdId({required String docAdId}) async {
    DocumentSnapshot<Map<String, dynamic>> docs =
        await fireStore.collection(adsCollection).doc(docAdId).get();

    Map<String, dynamic> data = docs.data() as Map<String, dynamic>;

    return data['id'];
  }

  Future<void> loadBannerAd() async {
    bannerAdId = await getAdId(docAdId: "Banner");

    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAdId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          logger.i("Banner ad loaded...");
        },
        onAdFailedToLoad: (ad, error) {
          logger.e("Failed to load Banner ad...\nERROR: ${error.message}");
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  Future<void> loadInterstitialAd() async {
    interstitialAdId = await getAdId(docAdId: "Interstitial");

    InterstitialAd.load(
      adUnitId: interstitialAdId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          logger.i("Interstitial ad loaded...");
        },
        onAdFailedToLoad: (error) {
          logger
              .e("Failed to load Interstitial ad...\nERROR: ${error.message}");
        },
      ),
    );
  }

  Future<void> loadRewardedAd() async {
    rewardedAdId = await getAdId(docAdId: "Rewarded");

    RewardedAd.load(
      adUnitId: rewardedAdId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;

          logger.i("Rewarded ad loaded...");
        },
        onAdFailedToLoad: (error) {
          logger.e("Failed to load Rewarded ad...\nERROR: ${error.message}");
        },
      ),
    );
  }

  Future<void> loadNativeAd() async {
    nativeAdId = await getAdId(docAdId: 'Native-Advanced');

    nativeAd = NativeAd(
      adUnitId: nativeAdId,
      factoryId: "listTile",
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          logger.i("Native ad loaded...");
        },
        onAdFailedToLoad: (ad, error) {
          nativeAd.dispose();
          logger.e("Failed to load Native ad...\nERROR: ${error.message}");
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  Future<void> loadAppOpenAd() async {
    appOpenAdId = await getAdId(docAdId: "App-Open");

    AppOpenAd.load(
      adUnitId: appOpenAdId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;

          logger.i("App-Open ad loaded...");
        },
        onAdFailedToLoad: (error) {
          logger.e("Failed to load App-Open ad...\nERROR: ${error.message}");
        },
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  }
}
