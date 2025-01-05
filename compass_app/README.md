# Flutter Compass App

This is a simple Compass app built using Flutter, which utilizes the `flutter_compass` package to provide real-time direction readings. The app also manages location permissions using the `permission_handler` package.

## Features
- Displays real-time compass heading.
- Automatically rotates the compass image based on device orientation.
- Asks for location permission if not already granted.

## Screenshots

![Screenshot 2025-01-04 202703](https://github.com/user-attachments/assets/3945f11c-b012-4d10-8275-9a9c5eca0216)


## Getting Started

### Prerequisites
Ensure you have Flutter installed on your machine. If not, follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

### Packages Used
- [flutter_compass](https://pub.dev/packages/flutter_compass)
- [permission_handler](https://pub.dev/packages/permission_handler)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/salmanz64/Flutter_Projects/edit/main/compass_app/.git
   ```
2. Navigate to the project directory:
   ```bash
   cd compass-app
   ```
3. Get the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Usage
- Open the app.
- If location permission is required, click the "Click to Grant Permission for Location" button.
- Once permission is granted, the compass will start showing direction readings.

## App Structure
- `lib/main.dart`: Entry point of the app.
- `lib/screens/home_screen.dart`: Contains the main logic for the HomeScreen widget.
- `lib/images/compass.png`: The compass image asset.

## Permissions
Make sure you have the necessary permissions in your `AndroidManifest.xml` and `Info.plist` files for both Android and iOS platforms.

### Android
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

### iOS
In your `Info.plist` file, add:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to display the compass direction.</string>
```

## Contribution
Contributions are welcome! Feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.

