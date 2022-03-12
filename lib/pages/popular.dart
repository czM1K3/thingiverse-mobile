import 'package:flutter/material.dart';
import 'package:thingiversemobile/components/modelsList.dart';
import 'package:thingiversemobile/models/thingiverse.dart';
import 'package:thingiversemobile/models/thingiverse/model.dart';

class PopularPage extends StatelessWidget {
  static const String routeName = "/popular";

  const PopularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PopularModels();
  }
}

//
class PopularModels extends StatefulWidget {
  const PopularModels({Key? key}) : super(key: key);

  @override
  State<PopularModels> createState() => _PopularModelsState();
}

class _PopularModelsState extends State<PopularModels> {
  late Future<List<ThingiverseModel>?> _future;

  @override
  void initState() {
    super.initState();
    var thingiverse = Thingiverse();
    _future = thingiverse.getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (builder, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var models = snapshot.data as List<ThingiverseModel>?;
            if (models == null) {
              return const Center(
                child: Text("No models found"),
              );
            }
            return ModelsList(models: models);
          } else {
            return const Center(child: Text("Error"));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
