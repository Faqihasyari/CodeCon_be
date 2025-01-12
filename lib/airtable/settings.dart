import 'dart:io';

import 'package:code_con_course_be/airtable/airtable_data.dart';
import 'package:code_con_course_be/duitku/entities/duitku_merchant_data.dart';

final airtableData = AirtableData(
  baseId: 'appS0dZg9V7UrR0pD',
  tableId: 'tbl5bZ2DNO16e2t1K',
  token: Platform.environment['AIRTABLE_TOKEN']!,
);

final mechantData = DuitkuMerchantData(
  merchantCode: 'DS21228',
  apiKey: Platform.environment['DUITKU_API_KEY']!,
);
