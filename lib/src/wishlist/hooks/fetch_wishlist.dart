// import 'package:carwo/common/services/storage.dart';
// import 'package:carwo/common/utils/environment.dart';
// import 'package:carwo/src/categories/hook/fetch_products_by_categoeries.dart';
// import 'package:carwo/src/products/models/products_model.dart';
// import 'package:doctor_app/common/services/storage.dart';
// import 'package:doctor_app/common/utils/environment.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:http/http.dart' as http;

// FetchProduct fetchWishlist() {
//   final products = useState<List<Products>>([]);
//   final isLoading = useState(false);
//   final error = useState<String?>(null);

//   Future<void> fetchData() async {
//     isLoading.value = true;
//     error.value = null;

//     try {
//       final accessToken = Storage().getString('accessToken');
//       if (accessToken == null) {
//         error.value = 'User not authenticated';
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('${Environment.appBaseUrl}/api/wishlist/me'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Token $accessToken',
//         },
//       );

//       if (response.statusCode == 200) {
//         products.value = productsFromJson(response.body);
//       } else {
//         error.value = 'Failed to fetch wishlist';
//       }
//     } catch (e) {
//       error.value = 'Error: $e';
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   useEffect(() {
//     fetchData();
//     return;
//   }, const []);

//   return FetchProduct(
//     products: products.value,
//     isLoading: isLoading.value,
//     error: error.value,
//     refetch: fetchData,
//   );
// }
