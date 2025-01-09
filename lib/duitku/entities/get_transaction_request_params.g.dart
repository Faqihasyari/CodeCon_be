// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transaction_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTransactionRequestParams _$GetTransactionRequestParamsFromJson(
        Map<String, dynamic> json) =>
    GetTransactionRequestParams(
      paymentMethod: json['paymentMethod'] as String,
      orderId: json['orderId'] as String,
      customerName: json['customerName'] as String,
      customerEmail: json['customerEmail'] as String,
      returnUrl: json['returnUrl'] as String,
      totalPayment: (json['totalPayment'] as num).toInt(),
      orderDescription: json['orderDescription'] as String? ?? '',
      expiryPeriod: (json['expiryPeriod'] as num?)?.toInt() ?? 15,
    );

Map<String, dynamic> _$GetTransactionRequestParamsToJson(
        GetTransactionRequestParams instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'orderId': instance.orderId,
      'orderDescription': instance.orderDescription,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'returnUrl': instance.returnUrl,
      'expiryPeriod': instance.expiryPeriod,
      'totalPayment': instance.totalPayment,
    };
