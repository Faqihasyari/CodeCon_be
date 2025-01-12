import 'dart:async';

import 'package:code_con_course_be/airtable/airtable_services.dart';
import 'package:code_con_course_be/airtable/settings.dart';
import 'package:code_con_course_be/duitku/entities/get_payment_method_params.dart';
import 'package:code_con_course_be/duitku/entities/get_transaction_request_params.dart';
import 'package:code_con_course_be/duitku/entities/get_transaction_status_params.dart';
import 'package:code_con_course_be/duitku/services/duitku_services.dart';
import 'package:code_con_course_be/extension/string_extension.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  // return Response(body: 'Welcome to Course Code Con belajar Payment Gateway!');
  try {
    // final response = await AirtableServices(airtableData).createRecord(
    //   fields: {
    //     'Email': 'pakihSlebew@umc.com',
    //     'Name': 'Faqih Asyari',
    //     'Order ID': '123456',
    //     'Duitku Reference': 'DUITKU-123456',
    //     'Status': 'PENDING',
    //     'Payment URL': 'https://duitku.com',
    //   },
    // );
    // final response = await AirtableServices(airtableData)
    //     .getRecordByEmail(email: 'pakihSlebew@umc.com');

    // final response = await AirtableServices(airtableData)
    //     .getRecordByReference(reference: 'DUITKU-123654');

    // final response = await AirtableServices(airtableData).updateRecord(
    //   fields: {
    //     'Duitku Reference': 'DUITKU-123456',
    //     'Payment URL': 'https://duitku.com',
    //     'Name': 'Faqih Asyari',
    //     'Email': 'pakihSlebew@umc.com',
    //     'Status': 'SUCCES',
    //     'Order ID': '123456',
    //   },
    //   recordId: 'reci15KtQCLaJhFER',
    // );

    // return DuitkuServices(merchantData: mechantData)
    //     .getPaymentMethod(GetPaymentMethodParams());

    // return DuitkuServices(merchantData: mechantData).getTransactionRequest(
    //     params: GetTransactionRequestParams(
    //         paymentMethod: 'VA',
    //         orderId: '11234',
    //         customerName: 'Yogi',
    //         customerEmail: 'yogi@gmail.com',
    //         returnUrl: '',
    //         totalPayment: 90000));

    return DuitkuServices(merchantData: mechantData)
        .gettransactionStatus(GetTransactionStatusParams(orderId: '11234'));

    // return Response.json(body: response);
  } catch (e) {
    return Response(body: e.toString());
  }
}
