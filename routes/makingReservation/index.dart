import 'package:code_con_course_be/airtable/airtable_data.dart';
import 'package:code_con_course_be/airtable/airtable_services.dart';
import 'package:code_con_course_be/airtable/settings.dart';
import 'package:code_con_course_be/duitku/entities/get_transaction_request_params.dart';
import 'package:code_con_course_be/duitku/entities/get_transaction_status_params.dart';
import 'package:code_con_course_be/duitku/services/duitku_services.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dio/dio.dart' as dio;

Future<Response> onRequest(RequestContext context) async {
  try {
    final params = GetTransactionRequestParams.fromJson(
        (await context.request.json()) as Map<String, dynamic>);

    final existingRecords =
        (await AirtableServices(airtableData).getRecordByEmail(
      email: params.customerEmail,
    ))['records'] as List;
    if (existingRecords.isEmpty) {
      final transactionRequest = await DuitkuServices(merchantData: mechantData)
          .getTransactionRequest(params: params, callbackUrl: 'https://codecon_be4.globeapp.dev/callback');

      final result = await AirtableServices(airtableData).createRecord(
        fields: {
          'Email': params.customerEmail,
          'Name': params.customerName,
          'Order ID': params.orderId,
          'Duitku Reference': (await transactionRequest.json()
              as Map<String, dynamic>)['reference'],
          'Status': 'PENDING',
          'Payment URL': (await transactionRequest.json()
              as Map<String, dynamic>)['paymentUrl'],
        },
      );

      return Response.json(
        body: {'data': result['fields']},
      );
    } else {
      return Response(body: 'Email Sudah Terdaftar', statusCode: 400);
    }
  } on dio.DioException catch (e) {
    return Response(
      body: e.response?.data.toString(),
      statusCode: e.response?.statusCode ?? 500,
    );
  }
}
