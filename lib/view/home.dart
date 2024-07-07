import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_burger/controller/controller.dart';
import 'package:provider_burger/view/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: double.infinity,
          toolbarHeight: 135,
          leading: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hot & Fast Food",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                    Text(
                      "Delevers on Time",
                      style: TextStyle(color: Colors.white38, fontSize: 22),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottom: TabBar(
              unselectedLabelStyle: TextStyle(fontSize: 15),
              labelStyle: TextStyle(fontSize: 15),
              labelColor: Colors.white,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.orange,
              tabs: [
                Tab(
                  text: "Burger",
                ),
                Tab(
                  text: "Pizza",
                ),
                Tab(
                  text: "Cheese",
                ),
                Tab(
                  text: "Pasta",
                ),
              ]),
        ),
        body: GridView.builder(
            itemCount: context.read<Controller>().model.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext, raneem) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailed(
                            data:
                                context.read<Controller>().model.data?[raneem]),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Image.asset(
                          context
                                  .read<Controller>()
                                  .model
                                  .data?[raneem]
                                  .image ??
                              "assets/1.png",
                          height: 90,
                        ),
                        Text(
                          context
                                  .read<Controller>()
                                  .model
                                  .data?[raneem]
                                  .title ??
                              "Burger",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                            context
                                    .read<Controller>()
                                    .model
                                    .data?[raneem]
                                    .subTitle ??
                                "subtitle",
                            style: TextStyle(color: Colors.white)),
                        Text(
                            context
                                    .read<Controller>()
                                    .model
                                    .data?[raneem]
                                    .price ??
                                "100",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              );
            }),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.black),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              selectedItemColor: Colors.orange,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), label: 'Messages'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favourite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_sharp), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'Notification'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me')
              ],
            )),
      ),
    );
  }
}
