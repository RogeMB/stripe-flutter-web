class StripeCustomResponse {
  final bool isSuccessful;
  final String message;

  const StripeCustomResponse({
    required this.isSuccessful,
    required this.message,
  });
}
