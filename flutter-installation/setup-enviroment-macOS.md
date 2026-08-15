# macOS Installation

## Step 1: Download Flutter SDK
**Visit:** [https://docs.flutter.dev/install/manual](https://docs.flutter.dev/install/manual)

- Download the appropriate Flutter SDK bundle for your Mac:
  - **Apple Silicon (ARM64)**: `flutter_macos_arm64_...-stable.zip`
  - **Intel**: `flutter_macos_...-stable.zip`

---

## Step 2: Extract SDK

**Run bash:**
```bash
unzip <sdk_zip_path> -d <destination_directory_path>
```

### Example:
```bash
unzip ~/Downloads/flutter_macos_3.29.3-stable.zip -d ~/development/
```

---

## Step 3: Add Flutter to PATH

### 1. Open terminal:
```bash
nano ~/.zshrc
```

### 2. Add:
```bash
export PATH="$PATH:$HOME/development/flutter/bin"
```

### 3. Save:
- Press `CTRL + X`
- Press `Y`
- Press `ENTER`

### 4. Reload:
```bash
source ~/.zshrc
```

### 5. Verify:
```bash
flutter --version
```

---

## Step 4: Install Xcode

**Download:**
- **Apple Xcode** (from the Mac App Store)

### After download:
```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

### Then:
```bash
sudo xcodebuild -runFirstLaunch
```

---

## Step 5: Install CocoaPods

### Install:
```bash
sudo gem install cocoapods
```

### Verify:
```bash
pod --version
```

---

## Step 6: Install Android Studio

**Download:**
- [Android Studio Download](https://developer.android.com/studio)

**Install & Configure (via Android Studio Settings / SDK Manager):**
- Android SDK
- Android SDK Platform
- Android SDK Command-line Tools
- Android Emulator

---

## Step 7: Create Android Emulator

**Navigate in Android Studio:**
- **Tools** $\rightarrow$ **Device Manager** $\rightarrow$ **Create Device**
