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
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    final _paymentApiUrl = Environment.paymentUrl;
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    final _secretKey = Environment.stripeSecretKey;
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    final _publishableKey = Environment.stripePublishabledKey;

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

  Future<StripeCustomResponse> payWithExistingCard({
    required String amount,
    required String currency,
    required CardDetails card,
    // CardField card,
  }) async {
    try {
      //* THIS IS INCORRECT. We have to take the CardDetails of the card parameter somehow and
      //* create a PaymentMethod with them but I haven't resolved this yet. */
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      final StripeCustomResponse finalResponse = await _confirmPayment(
        amount: amount,
        currency: currency,
        paymentMethod: paymentMethod,
      );

      return finalResponse;
      //
    } catch (e) {
      return StripeCustomResponse(
        isSuccessful: false,
        message: e.toString(),
      );
    }
  }

  Future<void> payWithApplePayOrGooglePay({
    required String amount,
    required String currency,
  }) async {
    //! INCOMPLETE
  }

  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      //* Payment method creation */
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      final StripeCustomResponse finalResponse = await _confirmPayment(
        amount: amount,
        currency: currency,
        paymentMethod: paymentMethod,
      );

      return finalResponse;
      //
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
      //
    } catch (e) {
      return PaymentIntentResponse(
        status: "400",
      );
    }
  }

  Future<StripeCustomResponse> _confirmPayment({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {
    try {
      final PaymentMethodParams paymentMethodParams =
          PaymentMethodParams.cardFromMethodId(
        paymentMethodData:
            PaymentMethodDataCardFromMethod(paymentMethodId: paymentMethod.id),
      );

      //* Payment intent creation */
      final paymentIntentResponse = await _createPaymentIntent(
        amount: amount,
        currency: currency,
      );
      //* Confirm payment */
      final paymentResult = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret:
            paymentIntentResponse.clientSecret.toString(),
        data: paymentMethodParams,
      );

      if (paymentResult.status.name.toLowerCase() == "succeeded") {
        return const StripeCustomResponse(
            isSuccessful: true, message: "Payment completed successfully!");
      } else {
        return StripeCustomResponse(
          isSuccessful: true,
          message: "Failed: ${paymentResult.status.name.toLowerCase()}",
        );
      }
    } catch (e) {
      return StripeCustomResponse(
        isSuccessful: false,
        message: e.toString(),
      );
    }
  }
}
