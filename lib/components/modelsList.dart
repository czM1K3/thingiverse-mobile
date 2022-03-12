import 'package:flutter/material.dart';
import 'package:thingiversemobile/components/model.dart';
import 'package:thingiversemobile/models/thingiverse/model.dart';

class ModelsList extends StatelessWidget {
  const ModelsList({Key? key, required this.models}) : super(key: key);

  final List<ThingiverseModel> models;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GridView.count(
      crossAxisCount: (width / 300).ceil(),
      children: models.map((model) => SingleModel(model: model)).toList(),
    );
  }
}
