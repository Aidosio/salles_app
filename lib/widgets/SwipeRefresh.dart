import 'package:flutter/material.dart';

class SwipeRefresh extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  SwipeRefresh({required this.child, required this.onRefresh});

  @override
  _SwipeRefreshState createState() => _SwipeRefreshState();
}

class _SwipeRefreshState extends State<SwipeRefresh> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: widget.onRefresh,
      child: widget.child,
    );
  }
}
