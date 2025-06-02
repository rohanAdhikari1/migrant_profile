class DataModel {
  final int id;
  final String? name;
  final String? number;
  final String? migratedCountry;
  final String? caste;
  final String? type;

  DataModel({
    required this.id,
    required this.name,
    required this.number,
    required this.migratedCountry,
    required this.caste,
    required this.type
  });

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id:map['id'],
      name: map['name'],
      number: map['contact_no'],
      migratedCountry: map['migrated_country'],
        caste: map['caste'],
      type: map['type']
    );
  }
}
