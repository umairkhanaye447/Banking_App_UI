import 'package:banking_app/model/CardModel.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CardDetailsScreens extends StatefulWidget {
  final CardModel card;
  const CardDetailsScreens({super.key, required this.card});

  @override
  State<CardDetailsScreens> createState() => _CardDetailsScreensState();
}

class _CardDetailsScreensState extends State<CardDetailsScreens> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          Colors.black45,
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.orange[900]!,
          Colors.amber[200]!,
          Colors.amber[200]!,
          Colors.amber[200]!,
          Colors.white
        ], radius: 1.5)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SingleChildScrollView(
              child: Column(children: [
            HeaderWidget(),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Text(
              'Your Current Balance',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\$90,987',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 75),
            ),
            Row(
              children: [
                const Icon(
                  Icons.upgrade_sharp,
                  color: Colors.green,
                ),
                Text(
                  "${widget.card.percentIncrease}% more than last month",
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 200,
                width: 300,
                child: SfSparkLineChart(
                  color: Colors.amber,
                  data: widget.card.graphItems,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  symboles("D", false),
                  symboles("M", false),
                  symboles("6M", true),
                  symboles("Y", false),
                  symboles("ALL", false)
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'You have revice a \nammount of money of from...',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "\$${widget.card.receiveAmount}",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "\$${widget.card.cardType}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SwipeableButtonView(
                onFinish: () {},
                onWaitingProcess: () {},
                activeColor: Colors.white,
                buttonWidget: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                buttonText: 'Confirm your payement',
                buttontextstyle: const TextStyle(color: Colors.black),
              ),
            )
          ])),
        )),
      ),
    );
  }

  Container symboles(String name, bool isActive) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.black,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: isActive ? Colors.black : Colors.white),
        ),
      ),
    );
  }

  Row HeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        const Text(
          'Details',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(50)),
            child: const Center(
              child: Icon(Icons.credit_card),
            ),
          ),
        ),
      ],
    );
  }
}
