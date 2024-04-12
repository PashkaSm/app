import 'package:clever_ads_solutions/public/AdCallback.dart';
import 'package:clever_ads_solutions/public/AdImpression.dart';
import 'package:clever_ads_solutions/public/AdLoadCallback.dart';
import 'package:clever_ads_solutions/public/AdPosition.dart';
import 'package:clever_ads_solutions/public/AdSize.dart';
import 'package:clever_ads_solutions/public/AdType.dart';
import 'package:clever_ads_solutions/public/AdViewListener.dart';
import 'package:clever_ads_solutions/public/CASBannerView.dart';
import 'package:clever_ads_solutions/public/ConsentFlow.dart';
import 'package:clever_ads_solutions/public/InitializationListener.dart';
import 'package:clever_ads_solutions/public/ManagerBuilder.dart';
import 'package:clever_ads_solutions/public/MediationManager.dart';
import 'package:flutter/material.dart';
import 'package:clever_ads_solutions/CAS.dart';
import 'package:clever_ads_solutions/public/AdTypes.dart';
import 'jsond.dart';
// import 'package:flutter_test/flutter_test.dart';

class AdsAdd{
  MediationManager? manager;
  AdsAdd() {
    inititalize();
  }
  Future<void> inititalize() async {
    CAS.setDebugMode(true);
    // CAS.setTaggedAudience(Audience.NOT_CHILDREN);
    CAS.setFlutterVersion("1.20.0");

    CAS.setAnalyticsCollectionEnabled(true);
    //CAS.validateIntegration();

    ManagerBuilder builder = CAS
        .buildManager()
        .withTestMode(true)
        .withCasId("demo")
        .withAdTypes(AdTypeFlags.Banner |
    AdTypeFlags.Rewarded |
    AdTypeFlags.Interstitial)
        .withInitializationListener(InitializationListenerWrapper());

    manager = builder.initialize();
  }

  Future<void> showInterstitial() async {
    manager?.showInterstitial(InterstitialListenerWrapper());
  }

  Future<void> showRewarded() async {
    manager?.showRewarded(InterstitialListenerWrapper());
  }

  CASBannerView? view;
  Future<void> createAdaptiveBanner() async {
    view = manager?.getAdView(AdSize.Adaptive);
    view?.setAdListener(BannerListener());
    view?.setBannerPosition(AdPosition.BottomCenter);
    view?.showBanner();
  }

  Future<void> createStandartBanner() async {
    view = manager?.getAdView(AdSize.Banner);
    view?.setAdListener(BannerListener());
    view?.showBanner();
  }
  void hideBanner() {
    view = manager?.getAdView(AdSize.Adaptive);
    view?.setAdListener(BannerListener());
    view?.hideBanner();
  }
  void changeBannerTop() {
    view?.setBannerPosition(AdPosition.TopCenter);
  }

  void changeBannerBottom() {
    view?.setBannerPosition(AdPosition.BottomCenter);
  }
}