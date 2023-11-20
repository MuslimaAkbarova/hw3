import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  final Map<String, dynamic> ingredients = {
    'Flour': '200g',
      'Milk': '250ml',
      'Egg': '1',
      'Sugar': '2 tbsp',
      'Baking Powder': '1 tsp',
  };

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  late Map<String, bool> checkedItems;

  @override
  void initState() {
    super.initState();
    checkedItems = Map.fromIterable(
      widget.ingredients.keys,
      key: (key) => key as String,
      value: (value) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Shopping List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildShoppingList(),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShoppingList() {
    return Expanded(
      child: ListView(
        children: widget.ingredients.entries.map((entry) {
          return ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Checkbox(
              value: checkedItems[entry.key],
              onChanged: (value) {
                setState(() {
                  checkedItems[entry.key] = value!;
                });
              },
            ),
            title: Text(
              '${entry.key} (${entry.value})',
              style: TextStyle(fontSize: 16),
            ),
          );
        }).toList(),
      ),
    );
  }
}