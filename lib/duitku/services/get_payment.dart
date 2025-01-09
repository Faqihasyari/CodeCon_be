part of 'duitku_services.dart';

extension GetPayment on DuitkuServices {
  Future<df.Response> getPaymentMethod(GetPaymentMethodParams params) async {
    final formatDataTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(params.dateTime);

    final signature = '${merchantData.merchantCode}${params.amount}'
            '$formatDataTime${merchantData.apiKey}'
        .toSHA256();

    final apiParams = {
      'merchantcode': merchantData.merchantCode,
      'amount': '${params.amount}',
      'datetime': formatDataTime,
      'signature': signature,
    };

    try {
      final response = await _dio.post(
        '${environment.baseUrl}/paymentmethod/getpaymentmethod',
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
