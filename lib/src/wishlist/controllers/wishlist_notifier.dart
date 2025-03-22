import 'dart:convert';
import 'package:doctor_app/common/services/storage.dart';
import 'package:doctor_app/common/utils/environment.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class WishlistNotifier with ChangeNotifier {
  String? error;
  List<int> _wishlist = [];

  List<int> get wishlist => _wishlist;

  WishlistNotifier() {
    loadWishlist(); // Load wishlist on initialization
  }

  void setError(String e) {
    error = e;
    notifyListeners();
  }

  Future<void> addRemoveWishlist(int id, Function refetch) async {
    final accessToken = Storage().getString('accessToken');

    if (accessToken == null) {
      setError('Access token is missing');
      return;
    }

    try {
      final response = await http.get(
        Uri.parse('${Environment.appBaseUrl}/api/wishlist/toggle/?id=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $accessToken',
        },
      );

      if (response.statusCode == 201) {
        addToList(id);
      } else if (response.statusCode == 204) {
        removeFromList(id);
      }

      refetch();
    } catch (e) {
      setError('Failed to update wishlist: $e');
    }
  }

  void setWishlist(List<int> w) {
    _wishlist = w;
    _updateLocalStorage();
    notifyListeners();
  }

  void addToList(int id) {
    if (!_wishlist.contains(id)) {
      _wishlist.add(id);
      _updateLocalStorage();
    }
  }

  void removeFromList(int id) {
    _wishlist.remove(id);
    _updateLocalStorage();
  }

  void _updateLocalStorage() {
    Storage().setString('user_wishlist', jsonEncode(_wishlist));
    notifyListeners();
  }

  /// ✅ **New Function to Load Wishlist from Local Storage on Startup**
  void loadWishlist() {
    String? storedWishlist = Storage().getString('user_wishlist');
    if (storedWishlist != null) {
      _wishlist = List<int>.from(jsonDecode(storedWishlist));
      notifyListeners(); // Ensure UI updates correctly after loading
    }
  }
}
