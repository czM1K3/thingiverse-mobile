import 'package:flutter/material.dart';
import 'package:thingiversemobile/components/infinite_scroll/newest.dart';

class NewestPage extends StatelessWidget {
  static const String routeName = "/newest";

  const NewestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InfiniteNewest();
  }
}
