import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: const Divider(color: Colors.grey)),
        const Text(
          'OR',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: const Divider(color: Colors.grey)),
      ],
    );
  }
}
