import 'package:cancer_blood/Screens/detection_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetectScreen extends StatelessWidget {
  const DetectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(203, 189, 189, 1),
              ),
              child: const ListTile(
                title: Text(
                  'Disease Detection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    color: Color.fromRGBO(161, 48, 48, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Please upload picture of the blood analysis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    )),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final imagePicker = ImagePicker();
              final pickedImage =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              if (pickedImage == null) {
                return;
              }
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetectionResultScreen(
                      image: pickedImage.path,
                    ),
                  ),
                );
              }
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.75,
              height: MediaQuery.sizeOf(context).width * 0.50,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(203, 189, 189, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Upload Image',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.add,
                      size: 48,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
