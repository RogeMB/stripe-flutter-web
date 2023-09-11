import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_flutter_app/helpers/navigator_fade_in.dart';
import 'package:stripe_flutter_app/pages/home_page.dart';

class CardFormPage extends StatelessWidget {
  const CardFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    CardFieldInputDetails? _card;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CardForm'),
      ),
      body: Center(
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
                // style: TextStyle(
                //   decoration: TextDecoration.underline,
                //   fontSize: 16,
                //   fontWeight: FontWeight.w900,
                //   color: Colors.red,
                //   height: 20,
                // ),
                decoration: const InputDecoration(
                  //iconColor: Colors.red,
                  isCollapsed: false,
                  enabled: true,
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 2),
                  ),
                ),
                onCardChanged: (card) {
                  _card = card;
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            if (_card?.complete ?? false)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    navigatorFadeIn(
                      context,
                      const HomePage(),
                    ),
                  );
                },
                child: const Text('Seleccionar'),
              ),
          ],
        ),
      ),
    );
  }
}
