import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRecipesScreen extends StatefulWidget {
  @override
  _FavoriteRecipesScreenState createState() => _FavoriteRecipesScreenState();
}

class _FavoriteRecipesScreenState extends State<FavoriteRecipesScreen> {
  List<String> favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteRecipes = prefs.getStringList('favoriteRecipes') ?? [];
    });
  }

  Future<void> _removeFavorite(String recipe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteRecipes.remove(recipe);
      prefs.setStringList('favoriteRecipes', favoriteRecipes);
    });
  }

  void _undoDelete(String recipe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteRecipes.add(recipe);
      prefs.setStringList('favoriteRecipes', favoriteRecipes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Recipes"),
        backgroundColor: Colors.teal,
      ),
      body: favoriteRecipes.isEmpty
          ? Center(
        child: Text(
          "No favorite recipes yet!",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      )
          : ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return Dismissible(
            key: Key(recipe),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              _removeFavorite(recipe);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("$recipe removed"),
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () => _undoDelete(recipe),
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 4,
              child: ListTile(
                title: Text(
                  recipe,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
