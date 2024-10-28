import 'package:banking_app/View/Card_details.dart';
import 'package:banking_app/model/CardModel.dart';
import 'package:banking_app/model/transectionModel.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            child: Column(
              children: [
                HeaderWidget(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text(
                  'Your Current Balance',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '\$90,987',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 75),
                ),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: cards
                        .map((card) => Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: buildCard(card),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaction History',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'see all',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: transactions.map(transactionHistory).toList())
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget buildCard(CardModel card) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CardDetailsScreens(
                      card: card,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 2,
          left: 2,
          bottom: 4,
        ),
        child: Container(
          height: 270,
          width: 200,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(-1, 1)),
            ],
            border: Border.all(color: Colors.black12),
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 22),
                  child: Image.asset(
                    card.method,
                    height: 40,
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  card.cardImage,
                  height: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  card.cardType.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${card.cardHolderName}  ${card.expirationDate}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90, right: 15),
                  child: Image.network(
                    card.cardLogo,
                    height: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget transactionHistory(Transaction transactions) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transactions.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: transactions.isDebit ? Colors.white : Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transactions.description,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          transactions.isDebit ? Colors.white : Colors.black),
                ),
                Text(
                  transactions.amount,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color:
                          transactions.isDebit ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Row HeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.grid_view_rounded,
            color: Colors.white,
          ),
        ),
        const Text(
          'Home',
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
              child: Badge(child: Icon(Iconsax.notification)),
            ),
          ),
        ),
      ],
    );
  }
}
