# quote

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

* Learn Flutter: https://docs.flutter.dev/get-started/learn-flutter
* Write your first Flutter app: https://docs.flutter.dev/get-started/codelab
* Flutter learning resources: https://docs.flutter.dev/reference/learning-resources

For help getting started with Flutter development, view the online documentation:
https://docs.flutter.dev/

---

## Development Setup

### Prerequisites

* Flutter SDK
* Android SDK
* Java 21+
* VS Code (recommended)
* Android device with USB debugging enabled

### Verify Installation

```bash
flutter doctor
```

Ensure there are no Android toolchain errors.

---

## Running on Redmi Note 11 (or any Android device)

### 1. Connect Device

* Enable Developer Options on the phone
* Enable USB Debugging
* Connect via USB
* Allow the computer when prompted for USB debugging authorization

### 2. Verify Device Detection

```bash
adb devices
```

Expected output:

```text
List of devices attached
<device-id>    device
```

Verify Flutter can detect the device:

```bash
flutter devices
```

### 3. Run the App

From the project root:

```bash
flutter run
```

Or target a specific device:

```bash
flutter run -d <device-id>
```

Example:

```bash
flutter run -d d7e7f60a
```

---

## Daily Development Workflow

### Start Development Session

From the project root:

```bash
flutter run -d d7e7f60a
```

This will:

* Build the application
* Install it on the phone
* Launch it automatically

### Make Changes

Edit files inside:

```text
lib/
```

Most application code will live here.

### Hot Reload

After making changes, press:

```text
r
```

in the terminal running Flutter.

This updates the UI while preserving application state.

### Hot Restart

If changes require a full restart, press:

```text
R
```

This restarts the application while keeping the Flutter process running.

### Stop the App

Press:

```text
q
```

to stop the running Flutter session.

---

## Useful Commands

Get project dependencies:

```bash
flutter pub get
```

Check for issues:

```bash
flutter doctor
```

List connected devices:

```bash
flutter devices
```

Analyze code:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

Build a release APK:

```bash
flutter build apk --release
```

Generated APK:

```text
build/app/outputs/flutter-apk/app-release.apk
```
