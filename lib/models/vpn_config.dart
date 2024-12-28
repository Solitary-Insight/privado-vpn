class VpnConfig {
  VpnConfig({
    required this.country,
    this.flag = '',
    required this.username,
    required this.password,
    required this.config,
    this.ip = "",
    this.ping = "",
    this.speed = 0,
  });

  final String country;
  final String flag;
  final String username;
  final String password;
  final String config;
  late final String ip;
  late final String ping;
  late final int speed;
}
