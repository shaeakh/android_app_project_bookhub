
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bids.dart';
class BidList extends StatefulWidget{
  const BidList({super.key});
  @override
  State<BidList> createState() => _BidList();
}

class _BidList extends State<BidList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe4e5e7),
        body: Column(
        children: [
          OthersBid(),
          OthersBid(),
          OthersBid(),
        ],
      ),
    );
  }
}