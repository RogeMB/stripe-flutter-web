class StripeService {
  
  //* Singleton constructor: initialize only once for each instance
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;
  //static StripeService get instance => _instance;


  final String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  final String _secretKey = 'https://api.stripe.com/v1/payment_intents';
}
