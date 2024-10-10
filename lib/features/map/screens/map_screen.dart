import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scout_link/widgets/scrollable_header_page.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableHeaderPage(
      title: "map_label".tr,
      canGoBack: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('CIAO MAPPA'),
      ),
    );
  }
}
