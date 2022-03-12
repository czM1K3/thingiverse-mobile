import 'package:flutter/material.dart';
import 'package:thingiversemobile/models/thingiverse/model.dart';

class SingleModel extends StatelessWidget {
  const SingleModel({Key? key, required this.model}) : super(key: key);

  final ThingiverseModel model;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: model.id);
        },
        child: Container(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      model.creator.thumbnail,
                    ),
                    radius: 10,
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(right: 13),
                    child: Text(
                      model.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ]),
              Expanded(
                child: FadeInImage(
                  image: NetworkImage(
                    model.thumbnail,
                  ),
                  placeholder: const AssetImage('assets/placeholder.png'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.thumb_up_alt_outlined),
                  const SizedBox(width: 5),
                  Text("${model.id}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
