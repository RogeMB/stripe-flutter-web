import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_flutter_app/constants/environment.dart';
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

  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      // final paymentMethod = await Stripe.instance.initPaymentSheet(
      //     paymentSheetParameters: const SetupPaymentSheetParameters(
      //   appearance: PaymentSheetAppearance(),
      // ));

      final paymentMethod = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: _secretKey,
        data: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(),
          ),
        ),
      );

      //TODO Create payment intent.

      return const StripeCustomResponse(
          isSuccessful: true, message: "All was successful!");
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
  }) async {}

  Future<void> _createPaymentIntent({
    required String amount,
    required String currency,
  }) async {}

  Future<void> _getThePayment({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {}
}
