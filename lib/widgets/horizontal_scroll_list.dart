import 'package:flutter/material.dart';

class HorizontalScrollList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String type; // 'movie' o 'series'

  const HorizontalScrollList({
    super.key,
    required this.items,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Aquí irá la navegación a la pantalla de reproducción
              // TODO: Implementar navegación a la pantalla de reproducción
            },
            child: Container(
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  items[index]['imageUrl'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 