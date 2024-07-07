import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_burger/controller/controller.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: TextButton(
            child: Text(
              "Shop Now",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
          height: 50,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(15)),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.white,
        // ),
        title: Text(
          "Your Cart",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<Controller>(builder: (h, _, d) {
            return Column(
              children: [
                Column(
                  children: List.generate(
                    context.read<Controller>().cartList?.length ?? 0,
                    (index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        width: 370,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.white10,
                                spreadRadius: 5)
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                context
                                        .read<Controller>()
                                        .cartList?[index]
                                        ?.image ??
                                    "",
                                height: 50,
                              ),
                              Text(context
                                      .read<Controller>()
                                      .cartList?[index]
                                      ?.title ??
                                  ""),
                              IconButton(
                                  onPressed: () {
                                    context.read<Controller>().increament(
                                        context
                                            .read<Controller>()
                                            .cartList?[index]);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.orange,
                                  )),
                              Text(
                                context
                                        .read<Controller>()
                                        .cartList?[index]
                                        ?.quantity
                                        .toString() ??
                                    '0',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              IconButton(
                                  onPressed: () {
                                    context.read<Controller>().decreament(
                                        context
                                            .read<Controller>()
                                            .cartList?[index]);
                                  },
                                  icon:
                                      Icon(Icons.remove, color: Colors.orange)),
                              IconButton(
                                  onPressed: () {
                                    context.read<Controller>().removeTocart(
                                        context
                                            .read<Controller>()
                                            .cartList?[index]);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            );
          })),
    );
  }
}
