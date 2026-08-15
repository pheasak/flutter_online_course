# Windows Installation

## Step 1: Download Flutter SDK
**Visit:** [https://docs.flutter.dev/install/manual](https://docs.flutter.dev/install/manual)

- Download the Flutter SDK bundle for Windows (e.g., `flutter_windows_...-stable.zip`).

---

## Step 2: Extract Flutter SDK
- Extract the downloaded zip file to:
  ```text
  C:\flutter
  ```
  *(Ensure the directory structure results in `C:\flutter\bin`)*

---

## Step 3: Add Flutter to PATH

1. Open **Windows Search** $\rightarrow$ Search for **Environment Variables** $\rightarrow$ Click **Edit the system environment variables** (or **Edit environment variables for your account**).
2. Click the **Environment Variables...** button.
3. Under **User variables** (or **System variables**), find and select **Path**, then click **Edit...**.
4. Click **New** and add:
   ```text
   C:\flutter\bin
   ```
5. Click **OK** on all open windows to apply the changes.
6. Open a new Command Prompt / PowerShell and verify:
   ```bash
   flutter --version
   ```

---

## Step 4: Install Android Studio

**Download:**
- [Android Studio Download](https://developer.android.com/studio)

**Install & Configure (via Android Studio Settings / SDK Manager):**
- Open Android Studio $\rightarrow$ **Settings** (or **More Actions** $\rightarrow$ **SDK Manager**)
- Under **Languages & Frameworks** $\rightarrow$ **Android SDK** $\rightarrow$ **SDK Tools** tab, check and install:
  - **Android SDK**
  - **Android SDK Platform-Tools**
  - **Android SDK Command-line Tools (latest)**
  - **Android Emulator**

---

## Step 5: Create Android Emulator

**Navigate in Android Studio:**
- **Tools** $\rightarrow$ **Device Manager** $\rightarrow$ **Create Device**
- Choose a device definition (e.g., Pixel), select a system image, and click **Finish**.

---

## Step 6: Verify Environment

Run in Command Prompt / PowerShell:
```bash
flutter doctor
```

If prompted to accept Android licenses, run:
```bash
flutter doctor --android-licenses
```
