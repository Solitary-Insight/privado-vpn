// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdsController extends GetxController {
//   static AdsController get instance => Get.find();
//   late BannerAd banner_ad;
//   late InterstitialAd interstitial_ad;
//   RxBool isBannerAdLoaded = false.obs;
//   RxBool isInterstitialAdLoaded = false.obs;
//   String banner_ads_unit_id =
//       "ca-app-pub-5162626584176709/8525586530"; //test id for now
//   String interstitial_ads_unit_id =
//       "ca-app-pub-5162626584176709/4633894245"; //test id for now
//   @override
//   void onInit() {
//     super.onInit();
//     loadBannerAd();
//     loadInterstitialAd();
//   }

//   void loadBannerAd() {
//     banner_ad = BannerAd(
//         size: AdSize.banner,
//         adUnitId: banner_ads_unit_id,
//         listener: BannerAdListener(onAdLoaded: ((ad) {
//           // SolitaryLoader.successSnackBar(title: "Banner ad loaded");
//           isBannerAdLoaded.value = true;
//         }), onAdFailedToLoad: ((ad, error) {
//           ad.dispose();
//           print("BANNER AD FAILED " + error.toString());
//         })),
//         request: const AdRequest());
//     banner_ad.load();
//   }

//   void loadInterstitialAd() {
//     interstitial_ad.fullScreenContentCallback =
//         FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
//       ad.dispose();
//     }, onAdFailedToShowFullScreenContent: ((ad, error) {
//       ad.dispose();
//       isInterstitialAdLoaded.value = false;
//     }));
//     interstitial_ad.show();
//     InterstitialAd.load(
//         adUnitId: interstitial_ads_unit_id,
//         request: const AdRequest(),
//         adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
//           interstitial_ad = ad;
//           isInterstitialAdLoaded.value = true;
//           ad.show();
//         }, onAdFailedToLoad: ((error) {
//           interstitial_ad.dispose();
//           print("INTERSTITIAL AD FAILED " + error.toString());

//           isInterstitialAdLoaded.value = false;
//         })));
//   }

//   void showInterstialAds(VoidCallback onClose) async {
//     onClose();
//     try {
//       if (!isInterstitialAdLoaded.value) {
//         loadInterstitialAd();
//       }
//     } catch (e) {
//       print("Interstiatial Ads Failed " + e.toString());
//     }
//   }
// }

//todo: Revised Code from ChatGptimport 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends GetxController {
  static AdsController get instance => Get.find();

  late BannerAd bannerAd;
  late InterstitialAd interstitialAd;

  RxBool isBannerAdLoaded = false.obs;
  RxBool isInterstitialAdLoaded = false.obs;

  final String bannerAdsUnitId = "ca-app-pub-5162626584176709/8525586530";
  //*  "ca-app-pub-3940256099942544/6300978111"; // Testing banner ad unit ID
  final String interstitialAdsUnitId = "ca-app-pub-5162626584176709/4633894245";
  //* "ca-app-pub-3940256099942544/1033173712"; // Testing interstitial ad unit ID

  @override
  void onInit() {
    super.onInit();
    loadAds();
  }

  Future<void> loadAds() async {
    await loadBannerAd();
    await loadInterstitialAd();
  }

  Future<void> loadBannerAd() async {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAdsUnitId,
      listener: BannerAdListener(
        onAdLoaded: (_) => isBannerAdLoaded.value = true,
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("Banner ad failed to load: $error");
        },
      ),
      request: AdRequest(),
    );
    await bannerAd.load();
  }

  Future<void> loadInterstitialAd() async {
    InterstitialAd.load(
      adUnitId: interstitialAdsUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          isInterstitialAdLoaded.value = true;
          interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              isInterstitialAdLoaded.value = false;
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              isInterstitialAdLoaded.value = false;
              print("Interstitial ad failed to show: $error");
            },
          );
        },
        onAdFailedToLoad: (error) {
          print("Interstitial ad failed to load: $error");
        },
      ),
    );
  }

  void disposeAds() {
    bannerAd.dispose();
    interstitialAd.dispose();
  }

  void showInterstitialAd(VoidCallback onClose) {
    onClose();
    if (isInterstitialAdLoaded.value) {
      interstitialAd.show();
    } else {
      loadInterstitialAd();
    }
  }
}
