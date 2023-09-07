import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_flutter_app/models/custom_credit_card.dart';

import '../blocs/pay_bloc_folder/pay_bloc.dart';

import '../widgets/custom_pay_buttom_widget.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomCreditCard? card = context.watch<PayBloc>().state.creditCard;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Selection'),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.of(context).pop();
            context.read<PayBloc>().add(OnUnSelectCard());
          },
        ),
      ),
      body: Stack(
        fit: StackFit
            .expand, //* It will take up the entire screen or space available.
        alignment: Alignment.topCenter,
        children: [
          //Container(),
          if (card != null)
            Hero(
              tag: card.cardNumber,
              child: CreditCardWidget(
                width: 450,
                height: 230,
                cardNumber: card.cardNumber,
                expiryDate: card.expiracyDate,
                bankName: card.brand,
                cardHolderName: card.cardHolderName,
                cvvCode: card.cvv,
                isChipVisible: true,
                showBackView: false,
                obscureCardNumber: false,
                obscureInitialCardNumber: false,
                obscureCardCvv: false,
                isHolderNameVisible: true,
                onCreditCardWidgetChange: (p0) {},
                glassmorphismConfig: Glassmorphism(
                  blurX: 10.0,
                  blurY: 10.0,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      const Color.fromARGB(255, 3, 3, 3).withAlpha(150),
                      const Color.fromARGB(255, 253, 253, 253).withAlpha(20),
                    ],
                    stops: const <double>[
                      0.6,
                      0.9,
                    ],
                  ),
                ),
              ),
            ),
          BlocBuilder<PayBloc, PayState>(
            builder: (context, state) {
              return CustomPayButtomWidget(state: state);
            },
          ),
        ],
      ),
    );
  }
}
