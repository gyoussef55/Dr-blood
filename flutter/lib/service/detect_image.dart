
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class DetectImage {
   static Future<Uint8List> sendImage(String imgPath) async {
    
    
    // Set up the API endpoint
    String url = 'http://127.0.0.1:5000/';

    // Get the image file (assuming it's stored locally)
    File imageFile = File(imgPath);

    // Open the image file

    var stream = http.ByteStream(imageFile.openRead());
    stream.cast();

    // Get the length of the file
    var length = await imageFile.length();

    // Create multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add image file to the request
    var multipartFile =
        http.MultipartFile('file', stream, length, filename: 'image.jpg');
    request.files.add(multipartFile);
    Uint8List _imageBytes = Uint8List(0);
    try {
      // Send the request
      var response = await request.send();

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Read response from stream
         _imageBytes = await response.stream.toBytes();
      
      } else {
        // Handle other status codes
        print('Request failed with status: ${response.statusCode}');
        
      }
    } catch (e) {
      // Handle any errors
      print('Error sending POST request: $e');
    }
    return _imageBytes;
  }
}
