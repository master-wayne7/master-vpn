import 'dart:math';

String formatSpeedBytes(int speedBytes, [int decimal = 2]) {
  if (speedBytes <= 0) {
    return "0 B";
  }
  const speedUnits = [
    "Bps",
    "Kbps",
    "Mbps",
    "Gbps",
    "Tbps"
  ];

  var speedIndex = (log(speedBytes) / log(1024)).floor();
  String formattedSpeed = (speedBytes / pow(1024, speedIndex)).toStringAsFixed(decimal);
  String currentSpeedUnit = speedUnits[speedIndex];

  return "$formattedSpeed $currentSpeedUnit";
}
