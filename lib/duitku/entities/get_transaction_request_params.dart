import 'package:json_annotation/json_annotation.dart';

part 'get_transaction_request_params.g.dart';

@JsonSerializable()
class GetTransactionRequestParams {
  GetTransactionRequestParams({
    required this.paymentMethod,
    required this.orderId,
    required this.customerName,
    required this.customerEmail,
    required this.returnUrl,
    required this.totalPayment,
    this.orderDescription = '',
    this.expiryPeriod = 15,
  });

  factory GetTransactionRequestParams.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionRequestParamsFromJson(json);

  final String paymentMethod;
  final String orderId;
  final String orderDescription;
  final String customerName;
  final String customerEmail;
  final String returnUrl;
  final int expiryPeriod;
  final int totalPayment;

  Map<String, dynamic> toJson() => _$GetTransactionRequestParamsToJson(this);
}
