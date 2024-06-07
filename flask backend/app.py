import argparse
import os
import cv2
from flask import Flask, request, send_file
from werkzeug.utils import secure_filename
from ultralytics import YOLO

app = Flask(__name__)
yolo_model = YOLO('best.pt')


@app.route("/", methods=["POST"])
def predict_img():
    if 'file' not in request.files:
        return "No file uploaded."
    f = request.files['file']
    basepath = os.path.dirname(__file__)
    filepath = os.path.join(basepath, 'uploads', secure_filename(f.filename))
    print("upload folder is ", filepath)
    f.save(filepath)

    file_extension = f.filename.rsplit('.', 1)[1].lower()

    if file_extension in ['jpg', 'jpeg', 'png']:
        img = cv2.imread(filepath)
        print("Running YOLO object detection...")
        results = yolo_model(img)
        annotated_img = results[0].plot()
        output_path = os.path.join(basepath, 'uploads', 'processed_' + f.filename)
        cv2.imwrite(output_path, annotated_img)
        return send_file(output_path, mimetype='image/jpeg')

    else:
        return "Unsupported file format. Please upload an image file (JPG, JPEG, or PNG)."


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Flask app exposing YOLOv8 models")
    parser.add_argument("--port", default=5000, type=int, help="port number")
    args = parser.parse_args()
    model = YOLO('best.pt')
    app.run(host="0.0.0.0", port=args.port)
