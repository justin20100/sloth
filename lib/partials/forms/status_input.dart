import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';

@immutable
class StatusInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  const StatusInput({this.onChanged, Key? key}) : super(key: key);

  @override
  State<StatusInput> createState() => _StatusInputState();
}

class _StatusInputState extends State<StatusInput> {
  Map<num, String> statusMap = {
    1: 'Utilisateur normal',
    2: 'Aidant',
  };

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value:  statusMap[1],
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: widget.onChanged,
      },
      items: statusMap<DropdownMenuItem<String>>((key, text) {
        return DropdownMenuItem<String>(
          value: key,
          child: Text(text),
        );
      }).toList(),
    );
  }
}

