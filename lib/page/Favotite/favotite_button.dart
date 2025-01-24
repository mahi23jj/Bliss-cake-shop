import 'package:coffee/page/Favotite/favorite_service.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final String itemId;
  final String name;
  final double price;
  final String img;

  const FavoriteButton({
    required this.itemId,
    required this.name,
    required this.price,
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  final FavoriteService favoriteService = FavoriteService('1'); // Replace with dynamic user ID

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  // Check initial favorite status
  void _checkFavoriteStatus() async {
    bool status = await favoriteService.isFavorite(widget.itemId);
    setState(() {
      isFavorite = status;
    });
  }

  // Toggle favorite status
  void _toggleFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    await favoriteService.toggleFavorite(
      widget.itemId,
      widget.name,
      widget.price,
      widget.img,
      isFavorite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
