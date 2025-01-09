///Data Airtable yang digunakan untuk melakukan request ke API Airtable

class AirtableData {
  const AirtableData(
      {required this.baseId, required this.tableId, required this.token});

  final String baseId;
  final String tableId;
  final String token;
}
