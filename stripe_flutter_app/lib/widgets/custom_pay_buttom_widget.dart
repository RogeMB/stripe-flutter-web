import 'package:flutter/material.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_stripe_web/flutter_stripe_web.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stripe_flutter_app/helpers/alerts.dart';
import 'package:stripe_flutter_app/models/custom_credit_card.dart';
import 'package:stripe_flutter_app/models/stripe_custom_response.dart';
import 'package:stripe_flutter_app/services/stripe_service.dart';

import '../blocs/pay_bloc/pay_bloc.dart';

class CustomPayButtomWidget extends StatelessWidget {
  final PayState state;
  const CustomPayButtomWidget({
    Key? key,
    required this.state,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width > 1200;

    return Positioned(
      bottom: 20,
      width: width,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: isDesktop ? width * 0.3 : width,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.amber.shade700,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    const TextSpan(
                      text: 'Total',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(
                      text: '${state.amount} ${state.currency}',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 36,
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              _PayButtonWidget(state: state),
            ],
          ),
        ),
      ),
    );
  }
}

class _PayButtonWidget extends StatelessWidget {
  final PayState state;

  const _PayButtonWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    final currentContext = context;
    final CustomCreditCard? selectedCard = state.creditCard;
    final StripeService stripeService = StripeService();

    if (Theme.of(context).platform == TargetPlatform.android) {
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () async {
          showLoading(context);
          await Future.delayed(const Duration(seconds: 2));
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        },
        child: const Icon(
          FontAwesomeIcons.googlePay,
          color: Colors.white,
          size: 34,
        ),
      );
    } else if ((Theme.of(context).platform ==
            TargetPlatform.iOS || //* Change || to && . || only for testing
        !state.isActive)) {
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () async {
          showLoading(context);
          await Future.delayed(const Duration(seconds: 2));
          if (context.mounted) {
            Navigator.pop(context);
          } else {
            return;
          }
        },
        child: const Icon(
          FontAwesomeIcons.applePay,
          color: Colors.white,
          size: 34,
        ),
      );
    } else if ((Theme.of(context).platform == TargetPlatform.windows &&
        state.isActive)) {
      final expiracyDate = selectedCard!.expiracyDate.split('/');
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () async {
          //! THIS IS NOT COMPLETED --> CHECK OUT STRIPESERVICE.PAYWITHEXISTINGCARD
          showLoading(context);
          if (!context.mounted) return;
          if (context.mounted) {
            final StripeCustomResponse response =
                await stripeService.payWithExistingCard(
              amount: state.getAmountString,
              currency: state.currency,
              card: CardDetails(
                cvc: selectedCard.cvv,
                expirationMonth: expiracyDate.first as int,
                expirationYear: expiracyDate.last as int,
                number: selectedCard.cardNumber,
              ),
            );
            if (response.isSuccessful && context.mounted) {
              Navigator.pop(context);
              return showCustomDialog(
                currentContext,
                title: 'Congratulations!',
                message: response.message,
              );
            } else if (!response.isSuccessful && context.mounted) {
              Navigator.pop(context);
              return showCustomDialog(
                currentContext,
                title: 'Something went wrong!',
                message: response.message.split(',')[3].trim().toUpperCase(),
              );
            }
          } else {
            return;
          }
        },
        child: const SizedBox(
          width: 100,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidCreditCard,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      );
    } else {
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () async {
          showLoading(context);
          await Future.delayed(const Duration(seconds: 2));
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        },
        child: const SizedBox(
          width: 100,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidCreditCard,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      );
    }
  }
}
