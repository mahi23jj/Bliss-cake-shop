import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteService {
  final String userId;

  FavoriteService(this.userId);

  // Reference to the user's favorites collection
  CollectionReference get _favCollection => FirebaseFirestore.instance
      .collection('use')
      .doc(userId)
      .collection('favorites');

  // Add or update item in favorites
  Future<void> toggleFavorite(String itemId, String name, double price, String img, bool isFavorite) async {
    try {
      final favDoc = _favCollection.doc(itemId);

      if (isFavorite) {
        // Add or update the favorite item
        await favDoc.set({
          'name': name,
          'price': price,
          'img': img,
        });
      } else {
        // Remove the item from favorites
        await favDoc.delete();
      }
    } catch (e) {
      print('Error updating favorite: $e');
      // Optional: Handle error (e.g., show a notification or retry)
    }
  }

  // Check if an item is already a favorite
  Future<bool> isFavorite(String itemId) async {
    try {
      final favDoc = await _favCollection.doc(itemId).get();
      return favDoc.exists;
    } catch (e) {
      print('Error checking favorite status: $e');
      return false;
    }
  }
}
