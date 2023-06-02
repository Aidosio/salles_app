import 'package:flutter/material.dart';

class MyBarWidget extends StatelessWidget {
  const MyBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 22, left: 22, bottom: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          Divider(
            height: 1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Общая стоимость:'), Text('6 666' + ' тг')],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sales-refund-Accept');
                print('id');
              },
              child: Text("Оформить возврат"),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(0, 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
