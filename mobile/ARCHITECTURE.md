# Mobile App - Architecture Documentation

## Overview

This document describes a reusable architecture and project structure for Flutter mobile applications. Use it as a template for any project: replace placeholders (e.g. app name, company, features) with your own.

**Customize for your project:**

- **Company:** _Your company name_
- **Project:** _Your app name_
- **Platform:** Flutter (iOS & Android)
- **State Management:** GetX (or adapt patterns for Provider, Riverpod, Bloc, etc.)

**How to use this doc:** Replace `your_app` in code samples with your app’s package name (from `pubspec.yaml`). The folder structure and patterns (screen-first, co-location, client/api + models) work for any Flutter app; swap GetX for another state solution if needed.

---

## Architecture Principles

### 1. GetX Architecture Pattern

- **Controllers**: Business logic and state management
- **Bindings**: Dependency injection and route management
- **Services**: Shared business logic and API calls
- **Models**: Data structures
- **Views**: UI components (Pages/Widgets)

### 2. Screen-First Structure

- Screens are organized by domain/functionality
- Each screen is self-contained
- Promotes team scalability and parallel development

### 3. Separation of Concerns

- **Presentation**: Views and Controllers (in `screens/`)
- **Business Logic**: Controllers
- **Data**: Models and API classes (in `api/`)
- **Infrastructure**: Network, Storage, Utils (in `core/`)

### 4. Co-location Pattern

- **Screen-based folders**: Each screen has its own folder
- **All related files together**: Controller, binding, view, and widgets in the same folder
- **Easy navigation**: Find all files for a screen in one place
- **Better organization**: Reduces cognitive load when working on a screen
- **Scalability**: Easy to add new screens without cluttering folders
- **Centralized API**: All API files and models in `client/` folder for easy access

**Example Structure:**

```
screens/feature_name/screen_name/
  ├── screen_name_controller.dart
  ├── screen_name_binding.dart
  ├── screen_name_view.dart
  └── screen_name_widgets.dart  # Screen-specific widgets
```

**API and models** are centralized in the `client/` folder:

```
client/
  ├── api/                   # API files
  │   ├── api_config.dart
  │   ├── api_client.dart
  │   ├── user_api.dart
  │   ├── item_api.dart       # Domain-specific API calls
  │   └── ...
  └── models/                # All models
      ├── base_model.dart
      ├── user_model.dart
      ├── item_model.dart
      └── ...
```

---

## Project Structure

```
lib/
├── app/                            # App initialization
│   ├── data/                       # App-level data
│   │   └── bindings/
│   │       └── initial_binding.dart
│   ├── routes/                     # App routes
│   │   └── app_pages.dart
│   ├── theme/                      # App theming
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   └── app_text_styles.dart
│   └── translations/               # Internationalization
│       └── translations.dart
│
├── core/                           # Core functionality
│   ├── constants/                  # Constants
│   │   ├── api_constants.dart
│   │   ├── app_constants.dart
│   │   └── storage_keys.dart
│   ├── storage/                     # Local storage
│   │   ├── local_storage_service.dart
│   │   └── secure_storage_service.dart
│   ├── utils/                       # Utilities
│   │   ├── validators.dart
│   │   ├── formatters.dart
│   │   ├── extensions.dart
│   │   └── helpers.dart
│   ├── widgets/                     # Reusable widgets
│   │   ├── buttons/
│   │   ├── inputs/
│   │   ├── cards/
│   │   └── loading/
│   └── errors/                      # Error handling
│       ├── exceptions.dart
│       └── error_handler.dart
│
├── client/                          # API and data layer
│   ├── api/                         # API files
│   │   ├── api_config.dart          # API configuration
│   │   ├── api_client.dart          # Base API client
│   │   ├── api_interceptor.dart     # API interceptors
│   │   ├── user_api.dart            # User-related API calls
│   │   ├── auth_api.dart            # Authentication API calls
│   │   ├── item_api.dart            # Domain-specific API (e.g. items, products)
│   │   └── ...                      # Add APIs per domain
│   └── models/                      # All data models
│       ├── base_model.dart          # Base model class
│       ├── user_model.dart
│       ├── auth_response_model.dart
│       ├── profile_model.dart
│       ├── item_model.dart          # Domain entity model
│       └── ...                      # Add models per domain
│
├── screens/                         # UI screens (organize by feature/domain)
│   ├── auth/                        # Authentication
│   │   ├── login/
│   │   │   ├── login_controller.dart
│   │   │   ├── login_binding.dart
│   │   │   └── login_view.dart
│   │   ├── register/
│   │   │   ├── register_controller.dart
│   │   │   ├── register_binding.dart
│   │   │   └── register_view.dart
│   │   └── onboarding/
│   │       ├── onboarding_controller.dart
│   │       ├── onboarding_binding.dart
│   │       ├── onboarding_view.dart
│   │       └── onboarding_widgets.dart
│   │
│   ├── home/                        # Main / home feature
│   │   └── home/
│   │       ├── home_controller.dart
│   │       ├── home_binding.dart
│   │       ├── home_view.dart
│   │       └── home_widgets.dart
│   │
│   ├── profile/
│   │   ├── profile/
│   │   │   ├── profile_controller.dart
│   │   │   ├── profile_binding.dart
│   │   │   ├── profile_view.dart
│   │   │   └── profile_widgets.dart
│   │   └── edit_profile/
│   │       ├── edit_profile_controller.dart
│   │       ├── edit_profile_binding.dart
│   │       ├── edit_profile_view.dart
│   │       └── edit_profile_widgets.dart
│   │
│   ├── items/                       # Example feature (e.g. list + detail)
│   │   ├── item_list/
│   │   │   ├── item_list_controller.dart
│   │   │   ├── item_list_binding.dart
│   │   │   ├── item_list_view.dart
│   │   │   └── item_list_widgets.dart
│   │   └── item_detail/
│   │       ├── item_detail_controller.dart
│   │       ├── item_detail_binding.dart
│   │       ├── item_detail_view.dart
│   │       └── item_detail_widgets.dart
│   │
│   └── settings/                   # Settings / preferences
│       └── settings/
│           ├── settings_controller.dart
│           ├── settings_binding.dart
│           ├── settings_view.dart
│           └── settings_widgets.dart
│
└── main.dart                        # App entry point
```

---

## GetX Architecture Components

### 1. Controllers (GetXController)

**Responsibility:** Business logic, state management, and UI state

**Location:** Each screen has its own controller in its screen folder

- `screens/items/item_list/item_list_controller.dart`
- `screens/home/home/home_controller.dart`
- `screens/auth/login/login_controller.dart`

**Structure:**

```dart
// screens/items/item_list/item_list_controller.dart
import 'package:your_app/client/api/item_api.dart';
import 'package:your_app/client/models/item_model.dart';

class ItemListController extends GetxController {
  final ItemApi _itemApi = Get.find();

  final RxList<ItemModel> items = <ItemModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  Future<void> loadItems() async {
    try {
      isLoading.value = true;
      final list = await _itemApi.getItems();
      items.value = list;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshItems() async {
    await loadItems();
  }
}
```

**Guidelines:**

- Extend `GetxController`
- Use `.obs` for reactive variables
- Use `Get.find()` for dependency injection
- Override `onInit()`, `onReady()`, `onClose()` as needed
- Keep controllers focused on single responsibility
- **Place controller in the same folder as its view and binding** (co-location)

### 2. Bindings

**Responsibility:** Dependency injection and route management

**Location:** Each screen has its own binding in its screen folder

- `screens/items/item_list/item_list_binding.dart`
- `screens/home/home/home_binding.dart`
- `screens/auth/login/login_binding.dart`

**Structure:**

```dart
// screens/items/item_list/item_list_binding.dart
import 'package:your_app/client/api/item_api.dart';

class ItemListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemApi>(() => ItemApi(), fenix: true);
    Get.lazyPut<ItemListController>(() => ItemListController());
  }
}

// screens/home/home/home_binding.dart
import 'package:your_app/client/api/user_api.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserApi>(() => UserApi(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
```

**Guidelines:**

- **Create one binding per screen** (co-located with controller and view)
- Use `lazyPut` for controllers (disposed when not in use)
- Use `lazyPut` with `fenix: true` for API classes (recreated if disposed)
- Use `put` for APIs that should persist throughout app lifecycle
- Register in `app/routes/app_pages.dart`
- Each binding only registers its own controller and required API dependencies

### 3. API Classes

**Responsibility:** API calls, data fetching, network requests

**Location:** All API files in `client/api/` folder

- `client/api/item_api.dart`
- `client/api/user_api.dart`
- `client/api/auth_api.dart`

**Structure:**

```dart
// client/api/item_api.dart
import 'package:your_app/client/api/api_client.dart';
import 'package:your_app/client/models/item_model.dart';

class ItemApi {
  final ApiClient _apiClient = Get.find();

  Future<List<ItemModel>> getItems() async {
    final response = await _apiClient.get('/items');
    return (response.data as List)
        .map((json) => ItemModel.fromJson(json))
        .toList();
  }

  Future<ItemModel> getItemById(String id) async {
    final response = await _apiClient.get('/items/$id');
    return ItemModel.fromJson(response.data);
  }

  Future<ItemModel> createItem(Map<String, dynamic> data) async {
    final response = await _apiClient.post('/items', data: data);
    return ItemModel.fromJson(response.data);
  }
}

// client/api/user_api.dart
import 'package:your_app/client/api/api_client.dart';
import 'package:your_app/client/models/user_model.dart';

class UserApi {
  final ApiClient _apiClient = Get.find();

  Future<UserModel> getCurrentUser() async {
    final response = await _apiClient.get('/user/me');
    return UserModel.fromJson(response.data);
  }
}
```

**Guidelines:**

- One API class per domain (item_api.dart, user_api.dart, etc.)
- Use `ApiClient` for all HTTP requests
- Return model instances from API calls
- Handle data transformation (JSON to models)
- Can be registered in bindings or globally in main.dart

### 4. Models

**Responsibility:** Data structures

**Location:** All models in `client/models/` folder

- `client/models/base_model.dart`
- `client/models/user_model.dart`
- `client/models/item_model.dart`

**Structure:**

```dart
// client/models/base_model.dart
abstract class BaseModel {
  Map<String, dynamic> toJson();

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson must be implemented');
  }
}

// client/models/item_model.dart
class ItemModel extends BaseModel {
  final String id;
  final String title;
  final String? description;
  final DateTime createdAt;

  ItemModel({
    required this.id,
    required this.title,
    this.description,
    required this.createdAt,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
```

**Guidelines:**

- Include `fromJson` and `toJson` methods
- Use immutable classes when possible
- Validate data in constructors

### 5. Views (Pages)

**Responsibility:** UI components

**Location:** Each screen has its own view in its screen folder

- `screens/items/item_list/item_list_view.dart`
- `screens/home/home/home_view.dart`
- `screens/auth/login/login_view.dart`

**Structure:**

```dart
// screens/items/item_list/item_list_view.dart
class ItemListView extends GetView<ItemListController> {
  static const routeName = '/items';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        return ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) => ItemTile(item: controller.items[index]),
        );
      }),
    );
  }
}

// screens/home/home/home_view.dart
class HomeView extends GetView<HomeController> {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Obx(() => /* your UI */),
    );
  }
}
```

**Guidelines:**

- Extend `GetView<Controller>` for type-safe controller access
- Use `Obx()` for reactive UI updates
- Keep views simple and focused on UI
- Extract complex widgets to separate files (can be in same folder or `widgets/` subfolder)
- **Place view in the same folder as its controller and binding** (co-location)
- **Define route in the view:** each view declares `static const routeName = '/path';` so routes live with the screen

---

## Routing & Navigation

### Route in each view

Each view owns its route name. No central `app_routes.dart`.

```dart
// screens/home/home/home_view.dart
class HomeView extends GetView<HomeController> {
  static const routeName = '/home';
  // ...
}

// screens/items/item_list/item_list_view.dart
class ItemListView extends GetView<ItemListController> {
  static const routeName = '/items';
  // ...
}

// screens/items/item_detail/item_detail_view.dart
class ItemDetailView extends GetView<ItemDetailController> {
  static const routeName = '/items/detail';
  // ...
}
```

### app_pages.dart (register routes only)

```dart
// app/routes/app_pages.dart
import 'package:your_app/screens/home/home/home_binding.dart';
import 'package:your_app/screens/home/home/home_view.dart';
import 'package:your_app/screens/items/item_list/item_list_binding.dart';
import 'package:your_app/screens/items/item_list/item_list_view.dart';
import 'package:your_app/screens/items/item_detail/item_detail_binding.dart';
import 'package:your_app/screens/items/item_detail/item_detail_view.dart';
// ... other screen imports

class AppPages {
  static String get initial => HomeView.routeName;

  static final routes = [
    GetPage(
      name: HomeView.routeName,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: ItemListView.routeName,
      page: () => ItemListView(),
      binding: ItemListBinding(),
    ),
    GetPage(
      name: ItemDetailView.routeName,
      page: () => ItemDetailView(),
      binding: ItemDetailBinding(),
    ),
    // ... more routes using View.routeName
  ];
}
```

### Navigation

Use the view’s `routeName` when navigating:

```dart
// Navigate to route
Get.toNamed(ItemListView.routeName);

// Navigate with arguments
Get.toNamed(ItemDetailView.routeName, arguments: itemId);

// Navigate and remove previous
Get.offNamed(HomeView.routeName);

// Navigate and remove all previous
Get.offAllNamed(LoginView.routeName);

// Go back
Get.back();

// Get arguments
final itemId = Get.arguments;
```

---

## Dependency Injection

### GetX Dependency Injection

**Registration:**

```dart
// In bindings or main.dart
Get.put(ApiClient()); // Singleton, persists
Get.lazyPut(() => AuthService()); // Lazy, created when first accessed
Get.putAsync(() => DatabaseService.init()); // Async initialization
```

**Retrieval:**

```dart
final service = Get.find<AuthService>();
final controller = Get.find<ItemListController>();
```

**Removal:**

```dart
Get.delete<AuthService>(); // Remove specific dependency
Get.reset(); // Remove all lazy dependencies
```

### Initial Setup

```dart
// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize core services
  Get.put(ApiClient());
  Get.put(LocalStorageService());
  Get.put(SecureStorageService());

  runApp(MyApp());
}
```

---

## State Management Patterns

### Reactive Variables

```dart
// In Controller
final count = 0.obs;
final name = 'John'.obs;
final user = UserModel().obs;
final items = <String>[].obs;

// Update
count.value = 10;
name.value = 'Jane';
user.value = newUser;
items.add('new item');
```

### Reactive Widgets

```dart
// Obx - Rebuilds when any observable changes
Obx(() => Text(controller.name.value))

// GetBuilder - Manual update with update()
GetBuilder<Controller>(
  builder: (controller) => Text(controller.name),
)

// GetX - Type-safe with controller
GetX<Controller>(
  builder: (controller) => Text(controller.name.value),
)
```

### Workers (Reactive Programming)

```dart
@override
void onInit() {
  super.onInit();

  // Called every time count changes
  ever(count, (value) => print('Count changed: $value'));

  // Called once when count changes
  once(count, (value) => print('Count changed once: $value'));

  // Called after user stops typing for 1 second
  debounce(searchText, (value) => search(value), time: Duration(seconds: 1));

  // Called every 1 second while count changes
  interval(count, (value) => print('Count: $value'), time: Duration(seconds: 1));
}
```

---

## Network Layer

### API Client Setup

```dart
// client/api/api_client.dart
class ApiClient extends GetxService {
  late Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ));

    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(LogInterceptor());
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

  // ... other methods
}
```

### Interceptor Example

```dart
// client/api/api_interceptor.dart
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add auth token
    final token = Get.find<LocalStorageService>().getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle errors globally
    ErrorHandler.handleError(err);
    handler.next(err);
  }
}
```

---

## Local Storage

### Storage Service

```dart
// core/storage/local_storage_service.dart
class LocalStorageService extends GetxService {
  late SharedPreferences _prefs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  // ... other methods
}
```

### Secure Storage

```dart
// core/storage/secure_storage_service.dart
class SecureStorageService extends GetxService {
  final _storage = FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: StorageKeys.AUTH_TOKEN, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: StorageKeys.AUTH_TOKEN);
  }
}
```

---

## Testing Strategy

### Test Structure

```
test/
├── unit/
│   ├── controllers/
│   │   └── item_list_controller_test.dart
│   └── api/
│       ├── item_api_test.dart
│       ├── user_api_test.dart
│       └── auth_api_test.dart
├── widget/
│   └── screens/
│       └── items/
│           └── item_list_view_test.dart
└── integration/
    └── screens/
        └── item_list_flow_test.dart
```

### Controller Testing

```dart
// test/unit/controllers/item_list_controller_test.dart
import 'package:your_app/client/api/item_api.dart';
import 'package:your_app/client/models/item_model.dart';

void main() {
  late ItemListController controller;
  late MockItemApi mockApi;

  setUp(() {
    mockApi = MockItemApi();
    Get.put<ItemApi>(mockApi);
    controller = ItemListController();
  });

  tearDown(() {
    Get.reset();
  });

  test('loadItems should update items list', () async {
    when(mockApi.getItems())
        .thenAnswer((_) async => [ItemModel(id: '1', title: 'Item', createdAt: DateTime.now())]);

    await controller.loadItems();

    expect(controller.items.length, 1);
    expect(controller.isLoading.value, false);
  });
}
```

---

## Code Quality & Standards

### Linting

- Use `flutter_lints` or custom rules
- Configure in `analysis_options.yaml`
- Enforce in CI/CD

### Naming Conventions

- **Files**: snake_case (e.g., `swipe_controller.dart`)
- **Classes**: PascalCase (e.g., `ItemListController`)
- **Variables**: camelCase (e.g., `userName`)
- **Constants**: lowerCamelCase (e.g., `const maxRetries = 3`)
- **Controllers**: `*Controller` suffix
- **Services**: `*Service` suffix
- **Models**: `*Model` suffix
- **Views**: `*View` suffix

---

## Performance Optimization

### Best Practices

1. **Lazy Loading**: Use `lazyPut` for controllers
2. **Dispose Controllers**: Controllers auto-dispose with `lazyPut`
3. **Reactive Updates**: Use `Obx` only where needed
4. **Image Caching**: Use `cached_network_image`
5. **Pagination**: Load data in chunks
6. **Memory Management**: Dispose resources in `onClose()`

### GetX Performance Tips

- Use `GetBuilder` instead of `Obx` when possible (more efficient)
- Use `workers` for side effects instead of `ever` in widgets
- Dispose controllers properly
- Use `permanent: true` only when necessary

---

## Security Considerations

### Data Protection

- Use `SecureStorageService` for tokens
- HTTPS only for API calls
- Encrypt sensitive local data
- Certificate pinning for production

### Authentication

- Store tokens securely
- Auto-refresh tokens
- Clear data on logout
- Biometric authentication support

---

## Third-Party Integrations

Customize this section for your app. Common integrations:

### OAuth / Social Login

- **OAuth 2.0**: Use for Google, Apple, or other providers
- **Token Management**: Store and refresh tokens securely
- **Rate Limiting**: Handle provider API limits if applicable

### Backend & Real-time (optional)

- **REST/GraphQL**: Your API client in `client/api/`
- **WebSockets**: For real-time features (chat, live updates)
- **Firebase / Supabase / custom backend**: Auth, database, push, analytics—document your choices here

---

## Getting Started

### Initial Setup

1. Install Flutter SDK
2. Add GetX dependency: `flutter pub add get`
3. Install dependencies: `flutter pub get`
4. Set up environment variables
5. Configure API keys
6. Run: `flutter run`

### Development Workflow

#### Creating a New Screen

**Example: Adding a "Item Detail" screen**

1. **Create screen folder structure:**

   ```
   screens/items/item_detail/
     ├── item_detail_controller.dart
     ├── item_detail_binding.dart
     ├── item_detail_view.dart
     └── item_detail_widgets.dart (optional)
   ```

2. **Create or extend API (if needed):**

   ```dart
   // client/api/item_api.dart — add method
   Future<ItemModel> getItemById(String id) async {
     final response = await _apiClient.get('/items/$id');
     return ItemModel.fromJson(response.data);
   }
   ```

3. **Create or reuse Model:**

   Use existing `ItemModel` or add a new model in `client/models/`.

4. **Create the Controller:**

   ```dart
   // screens/items/item_detail/item_detail_controller.dart
   import 'package:your_app/client/api/item_api.dart';
   import 'package:your_app/client/models/item_model.dart';

   class ItemDetailController extends GetxController {
     final ItemApi _itemApi = Get.find();
     final Rx<ItemModel?> item = Rx<ItemModel?>(null);

     @override
     void onInit() {
       super.onInit();
       loadItem(Get.arguments as String);
     }

     Future<void> loadItem(String id) async {
       final result = await _itemApi.getItemById(id);
       item.value = result;
     }
   }
   ```

5. **Create the Binding:**

   ```dart
   // screens/items/item_detail/item_detail_binding.dart
   class ItemDetailBinding extends Bindings {
     @override
     void dependencies() {
       Get.lazyPut<ItemApi>(() => ItemApi(), fenix: true);
       Get.lazyPut<ItemDetailController>(() => ItemDetailController());
     }
   }
   ```

6. **Create the View** (include `routeName` in the view):

   ```dart
   // screens/items/item_detail/item_detail_view.dart
   class ItemDetailView extends GetView<ItemDetailController> {
     static const routeName = '/items/detail';

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('Item Detail')),
         body: Obx(() => /* your UI */),
       );
     }
   }
   ```

7. **Register the route in `app/routes/app_pages.dart`:**

   ```dart
   GetPage(
     name: ItemDetailView.routeName,
     page: () => ItemDetailView(),
     binding: ItemDetailBinding(),
   ),
   ```

8. **Write tests** (unit, widget, integration)
9. **Submit PR**

#### General Workflow

1. Create feature branch
2. Create screen folder with controller, binding, view (co-located)
3. In the view, add `static const routeName = '/your-path';`
4. Create/update API file in `client/api/` if needed
5. Create/update model in `client/models/` if needed
6. Register route in `app_pages.dart` using `YourView.routeName`
7. Write tests
8. Submit PR

---

## Resources

### GetX

- [GetX Documentation](https://pub.dev/packages/get)
- [GetX GitHub](https://github.com/jonataslaw/getx)
- [GetX Patterns](https://github.com/kauemurakami/getx_pattern)

### Flutter

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Best Practices](https://docs.flutter.dev/development/best-practices)

---

---

**Last Updated:** _Update when you change this doc_  
**Maintained By:** _Your team or company_
