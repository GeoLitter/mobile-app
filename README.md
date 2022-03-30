# Ecocrypt.org

An app to help keep the world cleaner and hold people accountable of their pollution through data collection.

For help getting started with Flutter, view flutter's
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# Ecocrypt development setup guidelines

# Prepare environments
Make sure to include a .env.dev and .env for production with: 
```bash
API_URL:https://api.ecocrypt.org/
```

# Add Environments for VScode
Make sure to add or update this on your VScode launch.json

``` bash
    {
      "name": "Ecocrypt Dev",
      "request": "launch",
      "type": "dart",
      "args": [
        "-t",
        "lib/main_dev.dart",
        "--flavor",
        "dev"
      ]
    },
    {
      "name": "Ecocrypt Prod",
      "request": "launch",
      "type": "dart",
      "args": [
        "-t",
        "lib/main_prod.dart",
        "--flavor",
        "prod"
      ]
    }
```

# Add config files for iOS and Android
Both projects, under ios and android folders, you need to add GoogleServices files that match the apps package name (com.example.bettapay). These GoogleServices files can be found and downloaded through your firebase account. Look for dev and prod folders for each project build, and add the files there. For ios, add the files through xcode first and then update it through vscode if xcode does not sync the project. 

# Build Android appbundle (Recommended for google play store)
Build for dev
```bash
flutter build appbundle --flavor dev -t lib/main_dev.dart
```
Build for Prod
```bash
flutter build appbundle --flavor prod -t lib/main_prod.dart
```

# Build Android apk (See android guidelines to target hosting plaforms)
Build for dev
```bash
flutter build apk --flavor dev -t lib/main_dev.dart
```
Build for Prod
```bash
flutter build apk --flavor prod -t lib/main_prod.dart
```

## Getting Started 
```bash
# configure flutter environment and ensure there are no issue developing with flutter
 flutter doctor
 
# Install dependencies (Update pubpec.ymal)
 
# Test on device (For any aviable device)
 flutter run
 
# Test on Android Device (For any aviable device)
 flutter run android
 
# Test on iOS device(For any aviable device)
 flutter run ios
```