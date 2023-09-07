import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPayButtomWidget extends StatelessWidget {
  const CustomPayButtomWidget({Key? key}) : super(key: key);
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
              const _PayButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PayButtonWidget extends StatelessWidget {
  const _PayButtonWidget();

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.googlePay,
          color: Colors.white,
          size: 20,
        ),
      );
    } else if ((Theme.of(context).platform == TargetPlatform.iOS)) {
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.applePay,
          color: Colors.white,
          size: 20,
        ),
      );
    } else if ((Theme.of(context).platform == TargetPlatform.windows)) {
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () {},
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
    } else {
      return MaterialButton(
        height: 45,
        minWidth: 150,
        elevation: 2,
        color: Colors.black,
        shape: const StadiumBorder(),
        onPressed: () {},
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
