import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Subtract one (1) here because of the thickness of the wiper above
      alignment: AlignmentDirectional.center,
      color: Colors.blueAccent,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.top,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("CIASAONE"),
          ],
        ),
      ),
    );
  }
}
