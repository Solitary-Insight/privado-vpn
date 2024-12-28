import 'dart:async';
import 'dart:convert';

import 'package:Privado_Vpn/common/widgets/loaders.dart';
import 'package:Privado_Vpn/features/ads/controllers/ads_controller.dart';
import 'package:Privado_Vpn/features/home_page/contoller/locationsController.dart';
import 'package:Privado_Vpn/models/vpn_config.dart';
import 'package:Privado_Vpn/services/vpn_engine.dart';
import 'package:Privado_Vpn/utils/helpers/network_manager.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vpn_connection_detector/vpn_connection_detector.dart';

class homeController extends GetxController {
  RxString timer_String = "00h:00m:00s".obs;
  late Timer timer;
  int timeStart = 0;
  RxBool selected_vpn_changed = false.obs;
  NetworkManager networkManager = NetworkManager.instance;
  static homeController get instance => Get.find();
  AdsController ads_controller = Get.put(AdsController());

  RxString vpnState = VpnEngine.vpnDisconnected.obs;
  VpnConfig? selectedVpn;
  locationsController location_controller = Get.find();
  RxString selected_loc_name = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    VpnEngine.vpnStageSnapshot().listen((event) {
      vpnState.value = event;

      if (event == "connected") {
        startTimer();
      } else {
        endTimer();
      }
    });

    initVpn();

    //todo: check if vpn is connected or not
    checkVpnConnectedOrNot();
  }

  void initVpn() async {
    location_controller.loaded_vpnList.add(VpnConfig(
        config: await rootBundle.loadString('assets/vpn/japan.ovpn'),
        country: 'Japan',
        username: 'vpn',
        flag: "assets/images/japan.jpg",
        password: 'vpn'));

    location_controller.loaded_vpnList.add(VpnConfig(
        config: await rootBundle.loadString('assets/vpn/thailand.ovpn'),
        country: 'Thailand',
        username: 'vpn',
        flag: "assets/images/thailand.png",
        password: 'vpn'));

    SchedulerBinding.instance.addPostFrameCallback((t) {
      selectedVpn = location_controller.loaded_vpnList.first;
      set_selected_loc_name();
    });
  }

  set_selected_loc_name() {
    selected_loc_name.value = selectedVpn != null ? selectedVpn!.country : "";
  }

  void connectClick() async {
    ///Stop right here if user not select a vpn
    if (selectedVpn == null) {
      print("Not selected");
      return;
    }

    set_selected_loc_name();
    bool connectionStatus = await networkManager.isConnected();
    if (!connectionStatus) {
      SolitaryLoader.errorSnackBar(
          title: "Connection not possible",
          message: "It's look like you are not connected to the internet.");
      return;
    } else if (vpnState == VpnEngine.vpnDisconnected) {
      startVpn();

      ///
    } else {
      await VpnEngine.stopVpn();
      startVpn();
    }
  }

  locationClicked(VpnConfig configData) async {
    ///Stop right here if user not select a vpn
    if (selectedVpn == null) {
      print("Not selected");
      return;
    }
    selectedVpn = configData;
    set_selected_loc_name();
    bool connectionStatus = await networkManager.isConnected();
    if (!connectionStatus) {
      SolitaryLoader.errorSnackBar(
          title: "Connection not possible",
          message: "It's look like you are not connected to the internet.");
      return;
    }
    if (vpnState == VpnEngine.vpnConnected) {
      await VpnEngine.stopVpn();
    }
    startVpn();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      timeStart++;
      print(timeStart);
      timer_String.value = formatDuration(Duration(seconds: timeStart));
    });
  }

  void endTimer() {
    if (timer != null) {
      timer.cancel();
      timeStart = 0;
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}h:${twoDigitMinutes}m:${twoDigitSeconds}s";
  }

  void checkVpnConnectedOrNot() {
    final vpnDetector = VpnConnectionDetector();

    vpnDetector.vpnConnectionStream.listen((state) {
      vpnState.value = state.name;
    });
  }

  void startVpn() {
    print("Connecting");
    try {
      VpnEngine.startVpn(selectedVpn!);
    } catch (e) {
      print("Error in starting Vpn: " + e.toString());
    }
  }
}
