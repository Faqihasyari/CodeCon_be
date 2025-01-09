part of 'duitku_services.dart';

extension GetTransactionStatus on DuitkuServices {
  Future<df.Response> gettransactionStatus(
    GetTransactionStatusParams params,
  ) async {
    try {
      final signature = '${merchantData.merchantCode}${params.orderId}'
              '${merchantData.apiKey}'
          .toMD5();

      final apiParams = {
        'merchantCode': merchantData.merchantCode,
        'merchantOrderId': params.orderId,
        'signature': signature,
      };
      final response = await _dio.post(
        '${environment.baseUrl}/transactionStatus',
        options: Options(contentType: Headers.formUrlEncodedContentType),
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
