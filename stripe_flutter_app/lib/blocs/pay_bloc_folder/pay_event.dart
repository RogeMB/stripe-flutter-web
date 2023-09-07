part of 'pay_bloc.dart';

@immutable
sealed class PayEvent {}

class OnSelectCard extends PayEvent {
  final CustomCreditCard card;
  OnSelectCard({required this.card});
}

class OnUnSelectCard extends PayEvent {}
