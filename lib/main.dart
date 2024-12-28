import 'package:Privado_Vpn/features/ads/controllers/ads_controller.dart';
import 'package:Privado_Vpn/features/ads/views/banner_ad_screen.dart';
import 'package:Privado_Vpn/features/home_page/Screens/home.dart';
import 'package:Privado_Vpn/features/home_page/contoller/homeController.dart';
import 'package:Privado_Vpn/features/home_page/contoller/locationsController.dart';
import 'package:Privado_Vpn/utils/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  NetworkManager network_manager = Get.put(NetworkManager());

  locationsController loc_controller = Get.put(locationsController());

  homeController controller = Get.put(homeController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Privado Vpn',
      home: home(),
    );
  }
}
