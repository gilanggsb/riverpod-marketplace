# Clean Architecture & Riverpod di Flutter

Dokumen ini berisi konvensi dan best practices berdasarkan sesi implementasi "Marketplace Mini".

## 1. Pemisahan Layer (Dependency Rule)
Aturan utama: **Arah dependensi selalu mengarah ke dalam (Presentation -> Domain <- Data).**
*   **Domain Layer (Entity & UseCase):** Pusat logika bisnis. Tidak boleh mengimpor package UI (`flutter`), Riverpod API (`flutter_riverpod`), atau struktur data eksternal (Model/DTO/API/DB).
*   **Data Layer (Repository Impl & Data Source):** Bertugas menerjemahkan Model (DTO) menjadi Entity. Boleh mengimpor *library* pihak ketiga seperti Dio, http, atau freezed.
*   **Presentation Layer (Controller/Notifier & UI):** Mengatur *state* dan tampilan. Berkomunikasi dengan UseCase, tidak boleh langsung ke Repository.

## 2. DTO (Model) vs Entity
Selalu pisahkan struktur data yang dikirim/diterima API dengan struktur murni aplikasi (Entity).

### Request Parameters
*   **`...RequestParams` (Domain):** Class murni Dart tanpa anotasi JSON. Membawa data dari Controller -> UseCase -> Repository.
*   **`...RequestModel` (Data):** DTO di-generate dengan `freezed`. Menerjemahkan Params menjadi format yang dimengerti API (menggunakan `@JsonKey` dan `.toJson()`).

**Contoh (Request):**
```dart
// 1. DOMAIN LAYER (product_request_params.dart)
class ProductRequestParams {
  final int limit;
  final int offset;
  ProductRequestParams({this.limit = 10, this.offset = 0});
}

// 2. DATA LAYER (product_request_model.dart)
@freezed
class ProductRequestModel with _$ProductRequestModel {
  const factory ProductRequestModel({
    required int limit,
    @JsonKey(name: 'page_offset') required int offset, // Mapping untuk API
  }) = _ProductRequestModel;
  
  factory ProductRequestModel.fromJson(Map<String, dynamic> json) => _$ProductRequestModelFromJson(json);
}

// 3. REPOSITORY LAYER (product_repository_impl.dart)
// Menerjemahkan Params ke Model
Future<List<ProductEntity>> getProducts(ProductRequestParams params) async {
  final model = ProductRequestModel(limit: params.limit, offset: params.offset);
  return await remoteService.getProducts(model);
}
```

### Response Data
*   **`...ResponseModel` / `...Model` (Data):** Menangkap respon mentah dari API (`.fromJson()`). Wajib menggunakan `@JsonKey` jika format penamaan backend tidak konsisten dengan camelCase Dart (misal: *snake_case*).
*   **`...Entity` (Domain):** Objek inti aplikasi. Dipetakan (*mapped*) oleh Repository Impl dari Model.

**Contoh (Response):**
```dart
// 1. DATA LAYER (product_model.dart)
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'product_id') required int id,
    @JsonKey(name: 'product_title') required String title,
  }) = _ProductModel;
  
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

// 2. DOMAIN LAYER (product_entity.dart)
class ProductEntity {
  final int id;
  final String title;
  ProductEntity({required this.id, required this.title});
}

// 3. REPOSITORY LAYER (product_repository_impl.dart)
// Menerjemahkan Model ke Entity
ProductEntity toEntity(ProductModel model) {
  return ProductEntity(id: model.id, title: model.title);
}
```

## 3. Best Practices Riverpod
1. **Gunakan `ref.watch` di dalam `build()`:** Jangan pernah menggunakan `ref.read` di dalam method `build()` (baik widget maupun notifier) agar state selalu ter-update jika dependensinya berubah.
   ```dart
   @riverpod
   class ProductController extends _$ProductController {
     @override
     Future<List<ProductEntity>> build() async {
       // BENAR: Gunakan watch agar selalu re-fetch jika dependency berubah
       final useCase = ref.watch(getProductsUseCaseProvider);
       return await useCase.execute();
     }
   }
   ```
2. **Pisahkan State Independen:** Data yang sifatnya mandiri (seperti search query atau filter kategori) harus dibuat sebagai provider terpisah (`StateProvider`), bukan digabungkan secara paksa ke dalam satu class State yang besar. Controller utama dapat melakukan `ref.watch` terhadap provider independen tersebut.
   ```dart
   final searchQueryProvider = StateProvider<String>((ref) => '');
   ```
3. **Pagination State:** Gunakan satu class State khusus (contoh: `ProductPaginationState`) untuk melacak list data, `offset`, `hasMore`, dan `isLoadingMore`.
