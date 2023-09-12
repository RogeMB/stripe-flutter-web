import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:stripe_flutter_app/constants/environment.dart';
import 'package:stripe_flutter_app/models/payment_intent_response.dart';
import 'package:stripe_flutter_app/models/stripe_custom_response.dart';

class StripeService {
  //* Singleton constructor: initialize only once for each instance */
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() {
    final paymentApiUrl = Environment.paymentUrl;
    final secretKey = Environment.stripeSecretKey;
    final publishableKey = Environment.stripePublishabledKey;

    return _instance;
  }

  //* Private variables */

  final String _paymentApiUrl = Environment.paymentUrl;
  final String _secretKey = Environment.stripeSecretKey;
  final String _publishableKey = Environment.stripePublishabledKey;

  //* Normal constructor */
  // StripeService(
  //     {required String paymentApiUrl,
  //     required String secretKey,
  //     required String publishableKey})
  //     : _paymentApiUrl = paymentApiUrl,
  //       _secretKey = secretKey,
  //       _publishableKey = publishableKey;

  void init() {
    Stripe.publishableKey = _publishableKey;
    Stripe.merchantIdentifier = "test";
  }

  Future payWithExistingCard({
    required String amount,
    required String currency,
    required PaymentMethodType card,
    // CardField card,
  }) async {}

  Future<void> payWithApplePayOrGooglePay({
    required String amount,
    required String currency,
  }) async {}

  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      // final paymentMethod = await Stripe.instance.confirmPayment(
      //   paymentIntentClientSecret: _secretKey,
      //   data: const PaymentMethodParams.card(
      //     paymentMethodData: PaymentMethodData(
      //       billingDetails: BillingDetails(),
      //     ),
      //   ),
      // );

      final response = await _createPaymentIntent(
        amount: amount,
        currency: currency,
      );

      //TODO realizar cobro

      return const StripeCustomResponse(
          isSuccessful: true, message: "All was successful!");
    } catch (e) {
      return StripeCustomResponse(
        isSuccessful: false,
        message: e.toString(),
      );
    }
  }

  Future<PaymentIntentResponse> _createPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        _paymentApiUrl,
        data: {
          "amount": amount,
          "currency": currency,
          "automatic_payment_methods[enabled]": true,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': 'Bearer $_secretKey'},
        ),
      );
      return PaymentIntentResponse.fromJson(response.data);
    } catch (e) {
      return PaymentIntentResponse(
        status: "400",
      );
    }
  }

  Future<void> _confirmThePayment({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {}
}
