import 'package:flutter/material.dart';

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
          child: FittedBox(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                RichText(
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
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PayButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width > 1200;
  }
}
