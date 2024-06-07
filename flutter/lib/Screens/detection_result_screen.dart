import 'dart:typed_data';

import 'package:cancer_blood/service/detect_image.dart';
import 'package:cancer_blood/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class DetectionResultScreen extends StatelessWidget {
  DetectionResultScreen({required this.image, super.key});
  String image;
  var detectedImage = Uint8List(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        centerTitle: true,
        title: ListTile(
          title: Image.asset(
            'assets/Icon.png',
            width: 58,
            height: 89,
          ),
          subtitle: const Text(
            'Cancer Blood',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder(
          future: DetectImage.sendImage(image),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              detectedImage = snapshot.data!;
              return Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                    child: (detectedImage.isEmpty)
                        ? const Text('Could not load image',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                        : InteractiveViewer(
                            maxScale: double.infinity,
                            child: Image.memory(
                              detectedImage,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            )),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.red),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Close',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const Spacer(),
                        (detectedImage.isEmpty)
                        ?const SizedBox.shrink():ElevatedButton(
                          onPressed: () async {
                            if ((await Permission.storage.request().isGranted ||
                                    await Permission.photos
                                        .request()
                                        .isGranted) &&
                                context.mounted) {
                              final result = await ImageGallerySaver.saveImage(
                                detectedImage,
                                quality: 100,
                              );

                              if (context.mounted) {
                                Utils.showSnackBar(
                                  context,
                                  result['isSuccess']
                                      ? 'Image saved to gallery'
                                      : 'could not save image to gallery',
                                );
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.red),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Save to gallery',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            }
          }),
    );
  }
}
