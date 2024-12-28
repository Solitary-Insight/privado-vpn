import 'dart:convert';
import 'dart:developer';

import 'package:Privado_Vpn/common/widgets/loaders.dart';
import 'package:Privado_Vpn/features/home_page/contoller/SolitaryVpnConfig.dart';
import 'package:Privado_Vpn/models/vpn_config.dart';
import 'package:Privado_Vpn/utils/helpers/network_manager.dart';
import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

class locationsController extends GetxController {
  @override
  void onInit() {
    handleLocationsData();
  }

  static locationsController get instance => Get.find();
  RxBool areServerLoading = false.obs;
  RxBool connectionStatus = false.obs;

  List<VpnConfig> vpnList = [];
  List<VpnConfig> loaded_vpnList = [];

  handleLocationsData() async {
    vpnList.clear();
    connectionStatus.value = await NetworkManager.instance.isConnected();
    if (!connectionStatus.value) {
      SolitaryLoader.errorSnackBar(
          title: "Connection not possible",
          message: "It's look like you are not connected to the internet.");
    }
    try {
      areServerLoading.value = true;
      final res =
          await http.get(Uri.parse("http://www.vpngate.net/api/iphone/"));
      SolitaryLoader.successSnackBar(
          title: "Locations loaded",
          message: "Server locations are loaded to be connected");

      generateJson(res);
    } catch (e) {
      log("-------------------------Failed to load servers---------------------------------------");
      log("EROR: Servers loading failed" + e.toString());
    } finally {
      areServerLoading.value = false;
    }
  }

  void generateJson(http.Response res) async {
    List<SolitaryVpnConfig> sol_config = <SolitaryVpnConfig>[];

    String csvBody = res.body.split("#")[1].replaceAll("*", "");
    List<List<dynamic>> list = const CsvToListConverter().convert(csvBody);
    final header = list[0];

    for (int i = 1; i < list.length; ++i) {
      if (list[i].isNotEmpty) {
        try {
          final Map<String, dynamic> serverData = {};

          for (int j = 0; j < header.length; ++j) {
            serverData.addAll({header[j].toString(): list[i][j]});
          }
          sol_config.add(SolitaryVpnConfig.fromJson(serverData));
        } catch (e) {
          log(e.toString());
          continue;
        }
      }
    }
    sol_config.shuffle();
    vpnList = await generateVpnConfigs(sol_config);
  }

  Future<List<VpnConfig>> generateVpnConfigs(
      List<SolitaryVpnConfig> vpn_list) async {
    final List<VpnConfig> list = [];
    vpnList.sort(((a, b) => a.speed.compareTo(b.speed)));
    for (var data in vpn_list) {
      if (!data.openvpnconfigdatabase64.isEmpty) {
        final config_data =
            await Base64Decoder().convert(data.openvpnconfigdatabase64);
        final config = await Utf8Decoder().convert(config_data);
        final VpnConfig vpnConfig = VpnConfig(
            country: data.countrylong,
            speed: data.speed,
            ip: data.ip,
            ping: data.ping,
            username: "vpn",
            password: 'vpn',
            config: config);
        list.add(vpnConfig);
      }
    }
    return list;
  }
}
