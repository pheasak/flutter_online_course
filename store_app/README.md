# FakeStore E-Commerce Flutter App (MVVM Architecture)

A modern, responsive e-commerce application built with **Flutter**, **MVVM pattern**, and **Sample FakeStore Data**.

---

## 🏛️ MVVM Architecture Overview

The app follows a strict **Model-View-ViewModel (MVVM)** pattern:

```text
lib/
├── data/                               # DATA LAYER
│   ├── models/                         # Domain & API Models (Entities)
│   │   ├── product_model.dart          # Product & Rating models
│   │   └── cart_item_model.dart        # CartItem model with quantity & price calculation
│   ├── repositories/                   # Repository Pattern (Single source of truth)
│   │   └── product_repository.dart     # ProductRepository interface & ProductRepositoryImpl
│   └── fake_store_data.dart            # Local sample catalog (offline-first)
│
├── view_models/                        # VIEWMODEL LAYER
│   ├── product_view_model.dart         # Manages product listing, search, category filter, sorting & wishlist
│   ├── cart_view_model.dart            # Manages cart state, vouchers, shipping, tax & checkout
│   └── navigation_view_model.dart      # Manages active tab & bottom bar index
│
├── views/                              # VIEW LAYER (UI Presentation)
│   ├── main_navigation_screen.dart     # Bottom navigation with persistent state & live cart badge
│   ├── home_screen.dart                # Main catalog view with banners, categories, search & grid
│   ├── product_detail_screen.dart      # Hero detail view with quantity stepper & related items
│   ├── cart_screen.dart                # Cart view with items, promo vouchers & checkout confirmation
│   ├── wishlist_screen.dart            # Wishlist view of saved favorite products
│   └── categories_screen.dart          # Dedicated category cards view
│
├── widgets/                            # REUSABLE UI COMPONENTS
│   ├── banner_slider.dart              # Promo hero banners with discounts
│   ├── category_pills.dart             # Category selector with active indicators
│   ├── product_card.dart               # Product card with hero animation & quick add
│   └── search_filter_bar.dart          # Search bar & sort modal trigger
│
├── theme/
│   └── app_theme.dart                  # Colors, typography, buttons & card styles
└── main.dart                           # Dependency injection (Repository -> ViewModels -> Views)
```

---

## 🔄 MVVM Separation of Concerns

1. **Model**:
   - `Product` & `CartItem` define the data structures and business validation (e.g. calculation of item totals and discount rates).
2. **Repository**:
   - `ProductRepository` defines the contract for accessing product data.
   - `ProductRepositoryImpl` encapsulates the sample data source, making it effortless to switch between local data and a real API in the future without changing any View or ViewModel code.
3. **ViewModel**:
   - `ProductViewModel` and `CartViewModel` hold the observable state (`Rx`), handle business logic, and expose methods for the Views to call. They never hold direct UI/widget references.
4. **View**:
   - Pure UI widgets that observe ViewModel states (`Obx`) and dispatch user actions to ViewModel methods.

---

## 🚀 How to Run the App

Inside `/Users/user/Documents/Flutter class/store_app`:

```bash
# Run on macOS desktop
flutter run -d macos

# Run on Chrome
flutter run -d chrome

# Run tests
flutter test

# Run linter
flutter analyze
```
