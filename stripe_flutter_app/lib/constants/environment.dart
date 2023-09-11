import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String paymentUrl =
      'https://api.stripe.com/v1/payment_intents';
  static String stripeSecretKey =
      dotenv.env['STRIPE_SECRET'] ?? 'No api key provided';
  static String stripePublishabledKey =
     dotenv.env['STRIPE_PUBLISHABLE'] ?? 'No api key provided';
}
