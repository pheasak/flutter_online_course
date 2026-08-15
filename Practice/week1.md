# លំហាត់អនុវត្ត Flutter - សប្តាហ៍ទី ១ (Week 1 Practice Exercises)

មេរៀន និងលំហាត់អនុវត្តន៍សម្រាប់សប្តាហ៍ទី ១ ផ្ដោតលើ **Basic Widgets** និង **Interactivity Widgets** នៅក្នុង Flutter។

---

## 🎯 គោលបំណង (Objectives)
បន្ទាប់ពីធ្វើលំហាត់នេះចប់ សិស្សនឹងអាច៖
1. យល់ដឹងពីការប្រើប្រាស់ Structure មូលដ្ឋានរបស់ Flutter (MaterialApp, Scaffold, AppBar)។
2. ចេះរៀបចំ Layout ដោយប្រើប្រាស់ Text, Icon, Image (Asset & Network), Container, Padding, SizedBox, និង Card។
3. យល់ច្បាស់ពីភាពខុសគ្នារវាង `Image.asset` និង `Image.network`។
4. អាចបង្កើត និងប្រើប្រាស់ Interactive Widgets ដូចជា Buttons (ElevatedButton, TextButton, IconButton, CupertinoButton, FloatingActionButton), GestureDetector, និង ListTile។

---

## 📚 ផ្នែកទី ១៖ មេរៀនសង្ខេប & Basic Widgets

### 1.1 រចនាសម្ព័ន្ធគ្រឹះ (Foundation Widgets)
- **MaterialApp**: ជា Top-level widget ដែលកំណត់ Theme, Navigation (Routing), និងព័ត៌មានទូទៅនៃកម្មវិធី Android/Material Design។
- **Scaffold**: ជា App Layout Structure (មាន AppBar, Body, FloatingActionButton, Drawer, BottomNavigationBar...)។
- **AppBar**: របារខាងលើនៃកម្មវិធី (Header bar)។

### 1.2 Widgets សម្រាប់បង្ហាញព័ត៌មាន និង Decoration
- **Text**: ប្រើសម្រាប់បង្ហាញអត្ថបទ និងកំណត់ Style (fontSize, fontWeight, color, ផ្សេងៗ)។
- **Icon**: ប្រើសម្រាប់បង្ហាញរូបតំណាង Icon ចេញពី `Icons` class។
- **Image**:
  - `Image.asset('assets/images/sample.png')`: ប្រើសម្រាប់បង្ហាញរូបភាពដែលមានស្រាប់នៅក្នុង folder គម្រោង (ត្រូវតែប្រកាសក្នុង `pubspec.yaml` ជាមុន)។
  - `Image.network('https://example.com/image.jpg')`: ប្រើសម្រាប់ទាញយករូបភាពពី Internet ដោយផ្ទាល់តាមរយៈ URL។
- **Container**: Widget Multifunction ដែលអាចកំណត់ Width, Height, Margin, Padding, Background Color, Border, Border Radius (Decoration)។
- **Padding**: ប្រើសម្រាប់បង្កើតចន្លោះទំនេរខាងក្នុង (Internal Spacing) ជុំវិញ Widget កូន។
- **SizedBox**: ប្រើសម្រាប់កំណត់ទំហំថេរ (Fixed Width/Height) ឬបង្កើតចន្លោះទំនេរ (Spacer) រវាង Widget។
- **Card**: Panel មួយដែលមានរាងជ្រុងមូល (Rounded Corners) និងមានស្រមោល (Elevation/Shadow) ស័ក្តិសមសម្រាប់បង្ហាញព័ត៌មានជាប្លុក។

---

## 👆 ផ្នែកទី ២៖ Interactivity Widgets (ការធ្វើអន្តរកម្ម)

- **ElevatedButton**: ប៊ូតុងដែលមានជម្រៅ/ស្រមោល (3D effect) ស័ក្តិសមសម្រាប់ Primary Actions។
- **TextButton**: ប៊ូតុងសាមញ្ញគ្មាន background/ស្រមោល ប្រើសម្រាប់ Secondary Actions (ឧ. "Cancel", "Learn More")។
- **IconButton**: ប៊ូតុងដែលមានតែរូបតំណាង Icon (គ្មានអត្ថបទ)។
- **CupertinoButton**: ប៊ូតុងរចនាប័ទ្ម iOS (Cupertino/Apple style) ផ្តល់នូវ Animation ចុចបែប iOS។
- **FloatingActionButton (FAB)**: ប៊ូតុងរង្វង់មូលដែលអណ្តែតនៅជ្រុងខាងក្រោមនៃ Scaffold សម្រាប់ Main Action នៃអេក្រង់។
- **GestureDetector**: Widget ដែលអាចចាប់រាល់សកម្មភាព Touch/Gesture ផ្សេងៗ (Tap, Double Tap, Long Press, Drag) លើ Widget ណាមួយដែលគ្មានការចុចពីធម្មជាតិ។
- **ListTile**: Widget បន្ទាត់បញ្ឈរដែលរៀបចំស្រាប់ (Leading, Title, Subtitle, Trailing) ស័ក្តិសមសម្រាប់ធ្វើការបង្ហាញ List ឬ Menu។

---

## 📝 ផ្នែកទី ៣៖ លំហាត់អនុវត្ត (Practice Tasks)

### 📌 លំហាត់ទី ១: បង្កើត Profile Card តាំងបង្ហាញព័ត៌មានផ្ទាល់ខ្លួន (Basic Widgets Focus)

**គំរូលទ្ធផលរំពឹងទុក (Expected UI Result):**

![Profile Card Practice UI Mockup](/Users/user/.gemini/antigravity-ide/brain/e8a70f89-bbc1-46f8-b76c-1aca384ef763/flutter_profile_card_preview_1786816729922.png)

**តម្រូវការ:**
1. ប្រើប្រាស់ `Scaffold` និង `AppBar` ដាក់ចំណងជើងថា `"My Profile Card"`។
2. ប្រើប្រាស់ `Card` នៅចំកណ្តាលអេក្រង់ ដោយមាន `Padding` 20px។
3. នៅក្នុង Card ត្រូវមាន៖
   - រូបភាព Profile ដោយប្រើប្រាស់ `Image.network` (ឬ `Image.asset`) មានកាំជ្រុងមូល ឬដាក់ក្នុង `Container` (មាន `BorderRadius`)។
   - ឈ្មោះរបស់អ្នក (ប្រើ `Text` មាន font ធំ និង bold)។
   - ជំនាញ ឬ មុខតំណែង (ប្រើ `Text` ពណ៌ប្រផេះ)។
   - `SizedBox` សម្រាប់ឃ្លាតចន្លោះពីធាតុមួយទៅធាតុមួយ។
   - បង្ហាញព័ត៌មានទំនាក់ទំនង (លេខទូរស័ព្ទ, អ៊ីមែល) ដោយប្រើ `ListTile` ឬ `Row` ជាមួយ `Icon`។

---

### 📌 លំហាត់ទី ២: ការបង្កើត Interactive Action Buttons (Interactivity Focus)

**គំរូលទ្ធផលរំពឹងទុក (Expected UI Result):**

![Interactive Widgets Practice UI Mockup](/Users/user/.gemini/antigravity-ide/brain/e8a70f89-bbc1-46f8-b76c-1aca384ef763/flutter_interactive_widgets_preview_1786817026464.png)

**តម្រូវការ:**
1. បង្កើតសកម្មភាពចុចនៅលើ Buttons ផ្សេងៗគ្នា៖
   - **ElevatedButton**: ចុចហើយបង្ហាញ `SnackBar` ឬ Print សារកម្រិតខ្ពស់។
   - **TextButton**: ចុចដើម្បី Reset ឬ បោះបង់។
   - **IconButton**: ប៊ូតុង Like (Icon បេះដូង) ឬ Favorite។
   - **CupertinoButton**: បង្កើតប៊ូតុងរចនាប័ទ្ម iOS ពណ៌ខៀវ មានអត្ថបទ `"iOS Action"`។
   - **FloatingActionButton**: ដាក់នៅបាតអេក្រង់ Scaffold ពេលចុចឱ្យវាបង្ហាញ Message។
2. ប្រើប្រាស់ `GestureDetector` រុំលើ `Container` មួយ (ដែលមានពណ៌ និងជ្រុងមូល) ដើម្បីបង្កើត Custom Button ដោយខ្លួនឯង៖
   - ពេល `onTap` -> ឱ្យបង្ហាញសារ ឬប្តូរ trạng thái/print log។
   - ពេល `onLongPress` -> ឱ្យ print សារ `"Long Pressed!"`។

---

### 📌 លំហាត់ទី ៣: លំហាត់រួមបញ្ជូល (Combined Practice Challenge)

ចូរရေးកូដ Flutter ពេញលេញនៅក្នុងឯកសារ `main.dart` ដែលរួមបញ្ចូល Widgets ទាំងអស់ដែលបានរៀនខាងលើ។

#### កូដគំរូ និងរចនាសម្ព័ន្ធ (Sample Complete Code):

```dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Week 1 Flutter Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Week1PracticeScreen(),
    );
  }
}

class Week1PracticeScreen extends StatelessWidget {
  const Week1PracticeScreen({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 1: Basic & Interactivity'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showMessage(context, 'App Info Clicked!'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---------------------------------------------------
              // Section 1: Basic Widgets & Image Comparison
              // ---------------------------------------------------
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Network Image Demonstration
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://picsum.photos/100',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.account_circle, size: 100, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'សុខ ចាន់ (Sok Chan)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Flutter Mobile Developer',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Asset Image Note Demonstration
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.image, color: Colors.blue),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'កំណត់ចំណាំ: Image.asset ប្រើសម្រាប់រូបភាពក្នុង Assets folder ចំណែក Image.network ទាញពីរលកអាកាស (URL)។',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ---------------------------------------------------
              // Section 2: Buttons & Interactivity
              // ---------------------------------------------------
              const Text(
                'Interactive Buttons Practice',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // ElevatedButton
              ElevatedButton.icon(
                onPressed: () => _showMessage(context, 'ElevatedButton Clicked!'),
                icon: const Icon(Icons.check),
                label: const Text('Elevated Button'),
              ),
              const SizedBox(height: 8),

              // TextButton
              TextButton(
                onPressed: () => _showMessage(context, 'TextButton Clicked!'),
                child: const Text('Text Button (Cancel/Secondary)'),
              ),
              const SizedBox(height: 8),

              // CupertinoButton (iOS Style)
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () => _showMessage(context, 'CupertinoButton Clicked!'),
                child: const Text('Cupertino Button (iOS Style)'),
              ),
              const SizedBox(height: 16),

              // ---------------------------------------------------
              // Section 3: GestureDetector & ListTile
              // ---------------------------------------------------
              const Text(
                'GestureDetector & ListTile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // GestureDetector Custom Card
              GestureDetector(
                onTap: () => _showMessage(context, 'Custom Box Tapped!'),
                onLongPress: () => _showMessage(context, 'Custom Box Long-Pressed!'),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purpleAccent, Colors.deepPurple],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'GestureDetector (Tap or Long Press Me!)',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ListTile Practice
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.green),
                      title: const Text('លេខទូរស័ព្ទ'),
                      subtitle: const Text('+855 12 345 678'),
                      trailing: IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () => _showMessage(context, 'Calling...'),
                      ),
                      onTap: () => _showMessage(context, 'ListTile Phone Tapped!'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.orange),
                      title: const Text('អ៊ីមែល'),
                      subtitle: const Text('sokchan@example.com'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => _showMessage(context, 'ListTile Email Tapped!'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMessage(context, 'FloatingActionButton Clicked!'),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

## 🔍 សំណួរពិភាក្សា និងការរំលឹកសាល្បង (Quiz / Discussion)

1. តើ **Image.asset** និង **Image.network** មានលក្ខណៈខុសគ្នាយ៉ាងដូចម្តេច? ហើយតើពេលណាដែលយើងគួរប្រើប្រាស់មួយណា?
2. ហេតុអ្វីបានជាគេប្រើប្រាស់ **SizedBox** ជំនួស **Padding** ឬ **Container** ក្នុងករណីខ្លះ?
3. តើ **GestureDetector** និង **InkWell** ខុសគ្នាយ៉ាងដូចម្តេច? (រំលឹក: InkWell មាន Ripple animation ពេលចុច)
4. តើ **ElevatedButton**, **TextButton**, និង **CupertinoButton** ស័ក្តិសមប្រើប្រាស់ក្នុងកាលៈទេសៈណាខ្លះ?
