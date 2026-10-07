class CarbonRecord {
  String id;
  String costCenterId;
  String emissionSource;
  String auditorEmail;
  double tco2e;
  double budget;

  CarbonRecord({
    required this.id,
    required this.costCenterId,
    required this.emissionSource,
    required this.auditorEmail,
    required this.tco2e,
    required this.budget,
  });
}