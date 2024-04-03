import 'package:flutter/material.dart';

class ShowSheet extends StatefulWidget {
  const ShowSheet({super.key});

  @override
  State<ShowSheet> createState() => _ShowSheetState();
}

class _ShowSheetState extends State<ShowSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: _sheet,
      initialChildSize: 0.5,
      maxChildSize: 1,
      minChildSize: 0,
      expand: true,
      snap: true,
      snapSizes: const [0.5],
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 40),
              child: Container(
                height: 5,
                width: 23,
                color: Colors.grey,
              ),
            ),
            Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 40,
                width: 320,
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        );    
      },
    );
  }
}

