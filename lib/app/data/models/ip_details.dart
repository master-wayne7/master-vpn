class IPDetails {
  final String countryName;
  final String regionName;
  final String cityName;
  final String zipCode;
  final String timeZone;
  final String internetServiceProvider;
  final String query;

  IPDetails({
    required this.countryName,
    required this.regionName,
    required this.cityName,
    required this.zipCode,
    required this.timeZone,
    required this.internetServiceProvider,
    required this.query,
  });

  factory IPDetails.fromMap(Map<String, dynamic> map) {
    return IPDetails(
      countryName: map['country'] ?? "",
      regionName: map['regionName'] ?? "",
      cityName: map['city'] ?? "",
      zipCode: map['zip'] ?? "",
      timeZone: map['timezone'] ?? "Unknown",
      internetServiceProvider: map['isp'] ?? "Unknown",
      query: map['query'] ?? "Not available",
    );
  }
}
