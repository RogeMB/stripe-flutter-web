import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_flutter_app/services/stripe_service.dart';

import '../blocs/completed_cubit/completed_cubit.dart';
import '../blocs/pay_bloc/pay_bloc.dart';
import '../helpers/alerts.dart';

class CardFormPage extends StatefulWidget {
  const CardFormPage({
    super.key,
  });

  @override
  State<CardFormPage> createState() => _CardFormPageState();
}

class _CardFormPageState extends State<CardFormPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    CardFieldInputDetails? _card;
    final StripeService stripeService = StripeService();
    final currentContext = context;
    //final payBloc = BlocProvider.of<PayBloc>(context);
    final payBloc = context.watch<PayBloc>();
    final completedCubit = context.watch<CompletedCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CardForm'),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.of(context).pop();
            context.read<PayBloc>().add(OnUnSelectCard());
            completedCubit.toggleToFalse();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Write your card details here:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 60,
                  width: 372,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CardField(
                    autofocus: true,
                    enablePostalCode: false,
                    androidPlatformViewRenderType: AndroidPlatformViewRenderType
                        .expensiveAndroidView, //! Careful with this.
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                    onCardChanged: (card) {
                      setState(() {
                        _card = card;
                        if (card!.complete) {
                          completedCubit.toggleCompleted();
                        } else {
                          completedCubit.toggleToFalse();
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                if (completedCubit.state.isCompleted)
                  ElevatedButton(
                    onPressed: () async {
                      showLoading(context);
                      final String amount = payBloc.state.getAmountString;
                      final String currency = payBloc.state.currency;

                      if (!context.mounted) return;
                      if (context.mounted) {
                        final response = await stripeService.payWithNewCard(
                          amount: amount,
                          currency: currency,
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
                            message: response.message
                                .split(',')[3]
                                .trim()
                                .toUpperCase(),
                          );
                        }
                      }
                    },
                    child: const Text('Accept'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
