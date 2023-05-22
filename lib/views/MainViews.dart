import 'package:flutter/material.dart';

class MainViews extends StatefulWidget {
  const MainViews({super.key});

  @override
  State<MainViews> createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  @override
  Widget build(BuildContext context) {
    TextTheme typography = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Button',
                  style: typography.titleLarge,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _dispalayBottomSheet(context);
                  },
                  icon: Icon(Icons.add),
                  label: Text("data"),
                ),
                FilledButton(
                  onPressed: () => {},
                  child: Text("data"),
                ),
                FilledButton.tonal(
                  onPressed: () => {},
                  child: Text("data"),
                ),
                OutlinedButton(
                  onPressed: () => {},
                  child: Text("data"),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text("data"),
                )
              ],
            ),
            Divider(),
            Column(
              children: [
                Text(
                  'Button',
                  style: typography.titleLarge,
                ),
                ElevatedButton.icon(
                  onPressed: () => {},
                  icon: Icon(Icons.add),
                  label: Text("data"),
                ),
                FilledButton(
                  onPressed: () => {},
                  child: Text("data"),
                ),
                FilledButton.tonal(
                  onPressed: () => {},
                  child: Text("data"),
                ),
                OutlinedButton(
                  onPressed: () => {},
                  child: Text("data"),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text("data"),
                ),
                MaterialButton(
                  onPressed: () => {},
                  child: Text('2332'),
                  color: Colors.amber,
                  elevation: 0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future _dispalayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: double.infinity,
      ),
    );
  }
}
