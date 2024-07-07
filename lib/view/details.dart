import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_burger/controller/controller.dart';

import 'package:provider_burger/model/model.dart';
import 'package:provider_burger/view/cart.dart';

class Detailed extends StatefulWidget {
  const Detailed({super.key, required this.data});
  final Data? data;
  @override
  State<Detailed> createState() => _DetailedState();
}

class _DetailedState extends State<Detailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.data?.image ?? ""),
            Text(widget.data?.title ?? "",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(widget.data?.description ?? ""),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Price",style: TextStyle(color: Colors.orange,fontSize: 20),),
             Padding(
               padding: const EdgeInsets.only(left: 5),
               child: Text("\$ ${widget.data?.price}",style: TextStyle(color: Colors.white,fontSize: 20),),
             ),
                ],
              ),
            ),
           
            Spacer(),
            Container(
              child: TextButton(
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  context.read<Controller>().addTocart(widget.data);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
              ),
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white12, borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
      ),
    );
  }
}
