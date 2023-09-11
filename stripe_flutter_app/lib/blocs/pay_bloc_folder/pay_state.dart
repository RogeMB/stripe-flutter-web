// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pay_bloc.dart';

@immutable
class PayState {
  final double amount;
  final String currency;
  final bool isActive;
  final CustomCreditCard? creditCard;

  const PayState({
    this.amount = 375.20,
    this.currency = 'EUR',
    this.isActive = false,
    required this.creditCard,
  });

  String get getAmountString => amount.toStringAsFixed(2);

  PayState copyWith({
    double? amount,
    String? currency,
    bool? isActive,
    CustomCreditCard? creditCard,
  }) =>
      PayState(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        isActive: isActive ?? this.isActive,
        creditCard: creditCard ?? this.creditCard,
      );
}
