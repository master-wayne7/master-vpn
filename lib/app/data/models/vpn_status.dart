import 'dart:convert';

class VpnStatus {
  String? byteIn;
  String? byteOut;
  String? durationTime;
  String? lastPacketReceive;
  VpnStatus({
    this.byteIn,
    this.byteOut,
    this.durationTime,
    this.lastPacketReceive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'byte_in': byteIn,
      'byte_out': byteOut,
      'duration': durationTime,
      'last_packet_receive': lastPacketReceive,
    };
  }

  factory VpnStatus.fromMap(Map<String, dynamic> map) {
    return VpnStatus(
      byteIn: map['byte_in'] != null ? map['byte_in'] as String : null,
      byteOut: map['byte_out'] != null ? map['byte_out'] as String : null,
      durationTime: map['duration'] != null ? map['duration'] as String : null,
      lastPacketReceive: map['last_packet_receive'] != null ? map['last_packet_receive'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VpnStatus.fromJson(String source) => VpnStatus.fromMap(json.decode(source) as Map<String, dynamic>);
}
