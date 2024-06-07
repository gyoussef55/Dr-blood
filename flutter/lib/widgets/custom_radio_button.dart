import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  GenderSelection({required this.onChanged, super.key});
  void Function(String) onChanged;
  @override
  State<StatefulWidget>  createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedGender = 'Male';
              widget.onChanged(selectedGender!);
            });
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.black,
                
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: selectedGender == 'Male'
                ? Colors.red
                : Colors.white,
          ),
          child: const Text(
            'Male',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedGender = 'Female';
              widget.onChanged(selectedGender!);
            });
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.black,
                
              ),
              borderRadius: BorderRadius.circular(5),
              
            ),
            backgroundColor: selectedGender == 'Female'
                ? Colors.red
                : Colors.white
          ),
          child: const Text(
            'Female',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        
        
      ],
    );
  }
}