// To parse this JSON data, do
//
//     final paymentIntentResponse = paymentIntentResponseFromJson(jsonString);

import 'dart:convert';

PaymentIntentResponse paymentIntentResponseFromJson(String str) =>
    PaymentIntentResponse.fromJson(json.decode(str));

String paymentIntentResponseToJson(PaymentIntentResponse data) =>
    json.encode(data.toJson());

class PaymentIntentResponse {
  final String? id;
  final String? object;
  final int? amount;
  final int? amountCapturable;
  final AmountDetails? amountDetails;
  final int? amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final AutomaticPaymentMethods? automaticPaymentMethods;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String? captureMethod;
  final Charges? charges;
  final String? clientSecret;
  final String? confirmationMethod;
  final int? created;
  final String? currency;
  final dynamic customer;
  final dynamic description;
  final dynamic invoice;
  final dynamic lastPaymentError;
  final dynamic latestCharge;
  final bool? livemode;
  final Metadata? metadata;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final PaymentMethodOptions? paymentMethodOptions;
  final List<String>? paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String? status;
  final dynamic transferData;
  final dynamic transferGroup;

  PaymentIntentResponse({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.charges,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  PaymentIntentResponse copyWith({
    String? id,
    String? object,
    int? amount,
    int? amountCapturable,
    AmountDetails? amountDetails,
    int? amountReceived,
    dynamic application,
    dynamic applicationFeeAmount,
    AutomaticPaymentMethods? automaticPaymentMethods,
    dynamic canceledAt,
    dynamic cancellationReason,
    String? captureMethod,
    Charges? charges,
    String? clientSecret,
    String? confirmationMethod,
    int? created,
    String? currency,
    dynamic customer,
    dynamic description,
    dynamic invoice,
    dynamic lastPaymentError,
    dynamic latestCharge,
    bool? livemode,
    Metadata? metadata,
    dynamic nextAction,
    dynamic onBehalfOf,
    dynamic paymentMethod,
    PaymentMethodOptions? paymentMethodOptions,
    List<String>? paymentMethodTypes,
    dynamic processing,
    dynamic receiptEmail,
    dynamic review,
    dynamic setupFutureUsage,
    dynamic shipping,
    dynamic source,
    dynamic statementDescriptor,
    dynamic statementDescriptorSuffix,
    String? status,
    dynamic transferData,
    dynamic transferGroup,
  }) =>
      PaymentIntentResponse(
        id: id ?? this.id,
        object: object ?? this.object,
        amount: amount ?? this.amount,
        amountCapturable: amountCapturable ?? this.amountCapturable,
        amountDetails: amountDetails ?? this.amountDetails,
        amountReceived: amountReceived ?? this.amountReceived,
        application: application ?? this.application,
        applicationFeeAmount: applicationFeeAmount ?? this.applicationFeeAmount,
        automaticPaymentMethods:
            automaticPaymentMethods ?? this.automaticPaymentMethods,
        canceledAt: canceledAt ?? this.canceledAt,
        cancellationReason: cancellationReason ?? this.cancellationReason,
        captureMethod: captureMethod ?? this.captureMethod,
        charges: charges ?? this.charges,
        clientSecret: clientSecret ?? this.clientSecret,
        confirmationMethod: confirmationMethod ?? this.confirmationMethod,
        created: created ?? this.created,
        currency: currency ?? this.currency,
        customer: customer ?? this.customer,
        description: description ?? this.description,
        invoice: invoice ?? this.invoice,
        lastPaymentError: lastPaymentError ?? this.lastPaymentError,
        latestCharge: latestCharge ?? this.latestCharge,
        livemode: livemode ?? this.livemode,
        metadata: metadata ?? this.metadata,
        nextAction: nextAction ?? this.nextAction,
        onBehalfOf: onBehalfOf ?? this.onBehalfOf,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodOptions: paymentMethodOptions ?? this.paymentMethodOptions,
        paymentMethodTypes: paymentMethodTypes ?? this.paymentMethodTypes,
        processing: processing ?? this.processing,
        receiptEmail: receiptEmail ?? this.receiptEmail,
        review: review ?? this.review,
        setupFutureUsage: setupFutureUsage ?? this.setupFutureUsage,
        shipping: shipping ?? this.shipping,
        source: source ?? this.source,
        statementDescriptor: statementDescriptor ?? this.statementDescriptor,
        statementDescriptorSuffix:
            statementDescriptorSuffix ?? this.statementDescriptorSuffix,
        status: status ?? this.status,
        transferData: transferData ?? this.transferData,
        transferGroup: transferGroup ?? this.transferGroup,
      );

  factory PaymentIntentResponse.fromJson(Map<String, dynamic> json) =>
      PaymentIntentResponse(
        id: json["id"],
        object: json["object"],
        amount: json["amount"],
        amountCapturable: json["amount_capturable"],
        amountDetails: json["amount_details"] == null
            ? null
            : AmountDetails.fromJson(json["amount_details"]),
        amountReceived: json["amount_received"],
        application: json["application"],
        applicationFeeAmount: json["application_fee_amount"],
        automaticPaymentMethods: json["automatic_payment_methods"] == null
            ? null
            : AutomaticPaymentMethods.fromJson(
                json["automatic_payment_methods"]),
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod: json["capture_method"],
        charges:
            json["charges"] == null ? null : Charges.fromJson(json["charges"]),
        clientSecret: json["client_secret"],
        confirmationMethod: json["confirmation_method"],
        created: json["created"],
        currency: json["currency"],
        customer: json["customer"],
        description: json["description"],
        invoice: json["invoice"],
        lastPaymentError: json["last_payment_error"],
        latestCharge: json["latest_charge"],
        livemode: json["livemode"],
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        nextAction: json["next_action"],
        onBehalfOf: json["on_behalf_of"],
        paymentMethod: json["payment_method"],
        paymentMethodOptions: json["payment_method_options"] == null
            ? null
            : PaymentMethodOptions.fromJson(json["payment_method_options"]),
        paymentMethodTypes: json["payment_method_types"] == null
            ? []
            : List<String>.from(json["payment_method_types"]!.map((x) => x)),
        processing: json["processing"],
        receiptEmail: json["receipt_email"],
        review: json["review"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        status: json["status"],
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "amount": amount,
        "amount_capturable": amountCapturable,
        "amount_details": amountDetails?.toJson(),
        "amount_received": amountReceived,
        "application": application,
        "application_fee_amount": applicationFeeAmount,
        "automatic_payment_methods": automaticPaymentMethods?.toJson(),
        "canceled_at": canceledAt,
        "cancellation_reason": cancellationReason,
        "capture_method": captureMethod,
        "charges": charges?.toJson(),
        "client_secret": clientSecret,
        "confirmation_method": confirmationMethod,
        "created": created,
        "currency": currency,
        "customer": customer,
        "description": description,
        "invoice": invoice,
        "last_payment_error": lastPaymentError,
        "latest_charge": latestCharge,
        "livemode": livemode,
        "metadata": metadata?.toJson(),
        "next_action": nextAction,
        "on_behalf_of": onBehalfOf,
        "payment_method": paymentMethod,
        "payment_method_options": paymentMethodOptions?.toJson(),
        "payment_method_types": paymentMethodTypes == null
            ? []
            : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
        "processing": processing,
        "receipt_email": receiptEmail,
        "review": review,
        "setup_future_usage": setupFutureUsage,
        "shipping": shipping,
        "source": source,
        "statement_descriptor": statementDescriptor,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "status": status,
        "transfer_data": transferData,
        "transfer_group": transferGroup,
      };
}

class AmountDetails {
  final Metadata? tip;

  AmountDetails({
    this.tip,
  });

  AmountDetails copyWith({
    Metadata? tip,
  }) =>
      AmountDetails(
        tip: tip ?? this.tip,
      );

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: json["tip"] == null ? null : Metadata.fromJson(json["tip"]),
      );

  Map<String, dynamic> toJson() => {
        "tip": tip?.toJson(),
      };
}

class Metadata {
  Metadata();

  Metadata copyWith() => Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class AutomaticPaymentMethods {
  final String? allowRedirects;
  final bool? enabled;

  AutomaticPaymentMethods({
    this.allowRedirects,
    this.enabled,
  });

  AutomaticPaymentMethods copyWith({
    String? allowRedirects,
    bool? enabled,
  }) =>
      AutomaticPaymentMethods(
        allowRedirects: allowRedirects ?? this.allowRedirects,
        enabled: enabled ?? this.enabled,
      );

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) =>
      AutomaticPaymentMethods(
        allowRedirects: json["allow_redirects"],
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "allow_redirects": allowRedirects,
        "enabled": enabled,
      };
}

class Charges {
  final String? object;
  final List<dynamic>? data;
  final bool? hasMore;
  final int? totalCount;
  final String? url;

  Charges({
    this.object,
    this.data,
    this.hasMore,
    this.totalCount,
    this.url,
  });

  Charges copyWith({
    String? object,
    List<dynamic>? data,
    bool? hasMore,
    int? totalCount,
    String? url,
  }) =>
      Charges(
        object: object ?? this.object,
        data: data ?? this.data,
        hasMore: hasMore ?? this.hasMore,
        totalCount: totalCount ?? this.totalCount,
        url: url ?? this.url,
      );

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        object: json["object"],
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
        hasMore: json["has_more"],
        totalCount: json["total_count"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "has_more": hasMore,
        "total_count": totalCount,
        "url": url,
      };
}

class PaymentMethodOptions {
  final Card? card;

  PaymentMethodOptions({
    this.card,
  });

  PaymentMethodOptions copyWith({
    Card? card,
  }) =>
      PaymentMethodOptions(
        card: card ?? this.card,
      );

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      PaymentMethodOptions(
        card: json["card"] == null ? null : Card.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "card": card?.toJson(),
      };
}

class Card {
  final dynamic installments;
  final dynamic mandateOptions;
  final dynamic network;
  final dynamic requestIncrementalAuthorizationSupport;
  final String? requestThreeDSecure;

  Card({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestIncrementalAuthorizationSupport,
    this.requestThreeDSecure,
  });

  Card copyWith({
    dynamic installments,
    dynamic mandateOptions,
    dynamic network,
    dynamic requestIncrementalAuthorizationSupport,
    String? requestThreeDSecure,
  }) =>
      Card(
        installments: installments ?? this.installments,
        mandateOptions: mandateOptions ?? this.mandateOptions,
        network: network ?? this.network,
        requestIncrementalAuthorizationSupport:
            requestIncrementalAuthorizationSupport ??
                this.requestIncrementalAuthorizationSupport,
        requestThreeDSecure: requestThreeDSecure ?? this.requestThreeDSecure,
      );

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        installments: json["installments"],
        mandateOptions: json["mandate_options"],
        network: json["network"],
        requestIncrementalAuthorizationSupport:
            json["request_incremental_authorization_support"],
        requestThreeDSecure: json["request_three_d_secure"],
      );

  Map<String, dynamic> toJson() => {
        "installments": installments,
        "mandate_options": mandateOptions,
        "network": network,
        "request_incremental_authorization_support":
            requestIncrementalAuthorizationSupport,
        "request_three_d_secure": requestThreeDSecure,
      };
}
