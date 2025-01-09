import 'dart:io';

import 'package:code_con_course_be/airtable/settings.dart';
import 'package:code_con_course_be/duitku/entities/get_payment_method_params.dart';
import 'package:code_con_course_be/duitku/services/duitku_services.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(
      body: 'Method not allowed',
      statusCode: HttpStatus.methodNotAllowed,
    );
  }

  return DuitkuServices(merchantData: mechantData).getPaymentMethod(
    GetPaymentMethodParams.fromJson(
      await context.request.json() as Map<String, dynamic>,
    ),
  );
}
