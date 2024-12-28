// import 'package:Privado_Vpn/models/vpn_config.dart';
// import 'package:flutter/services.dart';

// class SolitaryVpns {
//   List<VpnConfig> listVpn = [];
//   SolitaryVpns() {}

//   Future<List<VpnConfig>> getVpnList() async {
//     List<VpnConfig> vpnConfigs = [];
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/japan.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/thailand.ovpn'),
//         country: 'Thailand',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Brazil.ovpn'),
//         country: 'Brazil',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Canada.ovpn'),
//         country: 'Canada',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Japan.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Japan1.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Japan2.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Japan3.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Japan4.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Japan5.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Japan6.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Japan7.ovpn'),
//         country: 'Japan',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Korea.ovpn'),
//         country: 'Korea',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Korea1.ovpn'),
//         country: 'Korea',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Korea2.ovpn'),
//         country: 'Korea',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Korea3.ovpn'),
//         country: 'Korea',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Korea4.ovpn'),
//         country: 'Korea',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Thailand.ovpn'),
//         country: 'Thailand',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Thailand1.ovpn'),
//         country: 'Thailand',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Usa.ovpn'),
//         country: 'Usa',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Usa1.ovpn'),
//         country: 'Usa',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Usa2.ovpn'),
//         country: 'Usa',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Usa2.ovpn'),
//         country: 'Usa',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Usa3.ovpn'),
//         country: 'Usa',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------

// //  todo: -----------------------------
//     listVpn.add(VpnConfig(
//         config: await rootBundle.loadString('assets/vpn/Veitnam.ovpn'),
//         country: 'Veitnam',
//         username: 'vpn',
//         password: 'vpn'));

// //  todo: -----------------------------
//     return listVpn;
//   }
// }
