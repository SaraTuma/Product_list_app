import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final VoidCallback onDelete;
  final VoidCallback onView;

  const ProductItem({
    Key? key,
    required this.title,
    required this.price,
    required this.description,
    required this.onDelete,
    required this.onView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      child: Padding(
        padding: EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 4),
            Text(
              'Preço: R\$ $price',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 6),
            Text(
              description,
              style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle_outlined, color: Theme.of(context).colorScheme.primary),
                  onPressed: onView,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.primary),
                  onPressed: onDelete,
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
