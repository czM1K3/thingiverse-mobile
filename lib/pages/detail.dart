import 'package:flutter/material.dart';
import 'package:thingiversemobile/components/detail.dart';
import 'package:thingiversemobile/models/thingiverse.dart';
import 'package:thingiversemobile/models/thingiverse/model_detail.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  const DetailPage({Key? key, required this.arguments}) : super(key: key);

  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return ModelDetail(
      id: arguments,
    );
  }
}

//
class ModelDetail extends StatefulWidget {
  final int id;

  const ModelDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<ModelDetail> createState() => _ModelDetailState();
}

class _ModelDetailState extends State<ModelDetail> {
  late Future<ThingiverseModelDetail?> _future;

  @override
  void initState() {
    super.initState();
    var thingiverse = Thingiverse();
    _future = thingiverse.getSingle(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (builder, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var model = snapshot.data as ThingiverseModelDetail;
            return SingleModelDetail(model: model);
          } else {
            return const Center(child: Text("Error"));
          }
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Loading"),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
