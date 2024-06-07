# Dr Blood Mobile
## Run

```sh
flutter pub get
```

Check you have some connected device with: `flutter devices`.
If you target an android device you need to run these commands so the device can reach the local flask instance.

**Note: Only run the command if you are using a local Flask server; otherwise, there's no need to set up port forwarding.**

```sh
adb reverse tcp:5000 tcp:5000
```

Then run on your device:

```sh
flutter run -d <my_device>
```
