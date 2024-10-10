import 'package:flutter/material.dart';

class ScrollableHeaderPage extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;
  final bool canGoBack;

  final ScrollController scrollController = ScrollController();

  ScrollableHeaderPage({
    super.key,
    required this.title,
    required this.child,
    this.actions,
    this.canGoBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      )),
                  titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                  expandedTitleScale: 2,
                ),
                forceElevated: innerBoxIsScrolled,
                actions: actions,
                leading: canGoBack
                    ? IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    : null,
              )
            ],
        body: Container(
            alignment: AlignmentDirectional.topStart,
            color: Colors.blueAccent,
            child: child));
  }
}
