import 'package:flutter/material.dart';
import 'package:thingiversemobile/components/models_list.dart';
import 'package:thingiversemobile/models/thingiverse.dart';
import 'package:thingiversemobile/models/thingiverse/model.dart';

class NewestPage extends StatelessWidget {
  static const String routeName = "/newest";

  const NewestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewestModels();
  }
}

//
class NewestModels extends StatefulWidget {
  const NewestModels({Key? key}) : super(key: key);

  @override
  State<NewestModels> createState() => _NewestModelsState();
}

class _NewestModelsState extends State<NewestModels> {
  late Future<List<ThingiverseModel>?> _future;

  @override
  void initState() {
    super.initState();
    var thingiverse = Thingiverse();
    _future = thingiverse.getNewest();
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
