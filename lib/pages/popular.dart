import 'package:flutter/material.dart';
import 'package:thingiversemobile/components/infinite_scroll/popular.dart';

class PopularPage extends StatelessWidget {
  static const String routeName = "/popular";

  const PopularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InfinitePopular();
  }
}
