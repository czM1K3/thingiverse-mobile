import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingiversemobile/components/model.dart';
import 'package:thingiversemobile/config.dart' as config;
import 'package:thingiversemobile/models/thingiverse.dart';
import 'package:thingiversemobile/models/thingiverse/model.dart';

class InfiniteNewest extends StatefulWidget {
  const InfiniteNewest({Key? key}) : super(key: key);

  @override
  State<InfiniteNewest> createState() => _InfiniteNewestState();
}

class _InfiniteNewestState extends State<InfiniteNewest> {
  final PagingController<int, ThingiverseModel> _pagingController =
      PagingController(firstPageKey: 1);
  late Thingiverse _thingiverse;

  @override
  void initState() {
    _thingiverse = Thingiverse();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _thingiverse.getNewest(page: pageKey);
      if (newItems == null) {
        return;
      }
      final isLastPage = newItems.length < config.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return PagedGridView(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<ThingiverseModel>(
        itemBuilder: (context, item, index) {
          return SingleModel(model: item);
        },
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (width / 300).ceil(),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
