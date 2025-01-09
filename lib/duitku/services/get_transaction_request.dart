part of 'duitku_services.dart';

extension GetTransactionRequest on DuitkuServices {
  Future<df.Response> getTransactionRequest({
    required GetTransactionRequestParams params,
    String callbackUrl = '',
  }) async {
    final signature = '${merchantData.merchantCode}${params.orderId}'
            '${params.totalPayment}${merchantData.apiKey}'
        .toMD5();

    final apiParams = {
      'merchantCode': merchantData.merchantCode,
      'paymentAmount': '${params.totalPayment}',
      'paymentMethod': params.paymentMethod,
      'merchantOrderId': params.orderId,
      'productDetails': params.orderDescription,
      'customerVaName': params.customerName,
      'email': params.customerEmail,
      'callbackUrl': callbackUrl,
      'returnUrl': params.returnUrl,
      'signature': signature,
      'expiryPeriod': params.expiryPeriod,
    };

    try {
      final response = await _dio.post(
        '${environment.baseUrl}/v2/inquiry',
        data: apiParams,
      );

      return df.Response.json(body: response.data);
    } on DioException catch (e) {
      return df.Response(
        body: e.response?.data.toString(),
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }
}
