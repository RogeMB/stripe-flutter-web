import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';

import 'package:stripe_flutter_app/data/cards.dart';
import 'package:stripe_flutter_app/helpers/helpers.dart';
import 'package:stripe_flutter_app/models/custom_credit_card.dart';
import 'package:stripe_flutter_app/pages/card_page.dart';
import 'package:stripe_flutter_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width > 1200;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: const Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text('PAY'),
      //       Spacer(),
      //       Icon(
      //         Icons.payment,
      //         size: 16,
      //       )
      //     ],
      //   ),
      // ),
      body: Stack(fit: StackFit.loose, clipBehavior: Clip.antiAlias, children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
              colors: <Color>[
                const Color.fromARGB(255, 0, 7, 27).withAlpha(230),
                const Color.fromARGB(255, 253, 253, 253).withAlpha(20),
              ],
              stops: const <double>[
                0.85,
                1.0,
              ],
            ),
          ),
          //  margin: const EdgeInsets.only(top: 70),
          child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.start,
              controller: PageController(
                viewportFraction: !isDesktop ? 0.8 : 0.3,
              ),
              scrollBehavior: AppScrollBehavior(),
              itemCount: cards.length,
              itemBuilder: (_, i) {
                final CustomCreditCard card = cards[i];
                return FittedBox(
                  fit: BoxFit.contain,
                  child: InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () => Navigator.push(
                        context, navigatorFadeIn(context, const CardPage())),
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
                      glassmorphismConfig: Glassmorphism(
                        blurX: 10.0,
                        blurY: 10.0,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            const Color.fromARGB(255, 3, 3, 3).withAlpha(150),
                            const Color.fromARGB(255, 253, 253, 253)
                                .withAlpha(20),
                          ],
                          stops: const <double>[
                            0.6,
                            0.9,
                          ],
                        ),
                      ),
                      onCreditCardWidgetChange: (p0) {},
                    ),
                  ),
                );
              }),
        ),
        const CustomPayButtomWidget(),
      ]),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
