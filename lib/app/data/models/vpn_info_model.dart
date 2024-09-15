import 'dart:convert';

class VpnInfoModel {
  final String hostname;
  final String ip;
  final dynamic ping;
  final String countryLongName;
  final String countryShortName;
  final String base64OpenVPNConfigurationData;
  final int speed;
  final int vpnSessionsNum;

  VpnInfoModel({
    required this.hostname,
    required this.ip,
    required this.ping,
    required this.countryLongName,
    required this.countryShortName,
    required this.base64OpenVPNConfigurationData,
    required this.speed,
    required this.vpnSessionsNum,
  });

  VpnInfoModel copyWith({
    String? hostname,
    String? ip,
    dynamic ping,
    String? countryLongName,
    String? countryShortName,
    String? base64OpenVPNConfigurationData,
    int? speed,
    int? vpnSessionsNum,
  }) {
    return VpnInfoModel(
      hostname: hostname ?? this.hostname,
      ip: ip ?? this.ip,
      ping: ping ?? this.ping,
      countryLongName: countryLongName ?? this.countryLongName,
      countryShortName: countryShortName ?? this.countryShortName,
      base64OpenVPNConfigurationData: base64OpenVPNConfigurationData ?? this.base64OpenVPNConfigurationData,
      speed: speed ?? this.speed,
      vpnSessionsNum: vpnSessionsNum ?? this.vpnSessionsNum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'HostName': hostname,
      'IP': ip,
      'Ping': ping,
      'CountryLong': countryLongName,
      'CountryShort': countryShortName,
      'OpenVPN_ConfigData_Base64': base64OpenVPNConfigurationData,
      'Speed': speed,
      'NumVpnSessions': vpnSessionsNum,
    };
  }

  factory VpnInfoModel.fromMap(Map<String, dynamic> map) {
    return VpnInfoModel(
      hostname: map['HostName'] ?? "",
      ip: map['IP'] ?? "",
      ping: map['Ping'] ?? 0,
      countryLongName: map['CountryLong'] ?? "",
      countryShortName: map['CountryShort'] ?? "",
      base64OpenVPNConfigurationData: map['OpenVPN_ConfigData_Base64'] ?? "",
      speed: map['Speed'] ?? 0,
      vpnSessionsNum: map['NumVpnSessions'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VpnInfoModel.fromJson(String source) => VpnInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
