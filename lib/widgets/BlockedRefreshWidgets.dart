import 'package:flutter/material.dart';

class BlockedRefreshWidgets extends StatelessWidget {
  final bool isVisible;

  const BlockedRefreshWidgets({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(27, 16, 16, 0.1),
          ),
          Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
