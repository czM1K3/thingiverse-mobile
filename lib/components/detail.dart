import 'package:flutter/material.dart';
import 'package:thingiversemobile/models/thingiverse/modelDetail.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SingleModelDetail extends StatelessWidget {
  const SingleModelDetail({Key? key, required this.model}) : super(key: key);

  final ThingiverseModelDetail model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: model.images
                .map(
                  (item) => Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      child: FadeInImage(
                        width: 10000,
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          item.sizes.first.url,
                        ),
                        placeholder: const AssetImage('assets/placeholder.png'),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(
              data: model.descriptionHtml,
            ),
          ),
        ],
      ),
    );
  }
}
