import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_flutter_app/helpers/alerts.dart';

import '../blocs/pay_bloc_folder/pay_bloc.dart';

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
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'Total',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(
                      text: '250€',
                      style: TextStyle(
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
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        },
        child: const Icon(
          FontAwesomeIcons.applePay,
          color: Colors.white,
          size: 34,
        ),
      );
    } else if ((Theme.of(context).platform == TargetPlatform.windows &&
        state.isActive)) {
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () async {
          //showLoading(context);
          showError(context, title: 'Pago', message: 'Invalid');
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
