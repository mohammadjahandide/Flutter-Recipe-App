import 'package:flutter/material.dart';

class InstructionList extends StatelessWidget {
  final List<String> instructions;
  const InstructionList({
    Key? key,
    required this.instructions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: instructions.length,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: Text(
            '${index + 1}',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          title: Text(
            instructions[index],
          ),
        );
      }),
    );
  }
}
