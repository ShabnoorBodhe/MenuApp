import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedMenu;
  String _menuDescription = "Select a dish to see details.";
  List<String> favoriteRecipes = [];
  bool _showFavoriteOption = false;

  Image menuImage(int? value) {
    switch (value) {
      case 0:
        return Image.asset('images/menu1.jpeg', width: 150, height: 150);
      case 1:
        return Image.asset('images/menu2.png', width: 150, height: 150);
      case 2:
        return Image.asset('images/menu6.png', width: 150, height: 150);
      default:
        return Image.asset('images/placeholder.png', width: 150, height: 150);
    }
  }

  void _handleMenuSelection(int? value) {
    setState(() {
      _selectedMenu = value ?? -1;
      _showFavoriteOption = true;
      switch (_selectedMenu) {
        case 0:
          _menuDescription = """
Creamy Tortellini with Broccoli Recipe:

Ingredients:
- For the pasta:
  - 300g (10 oz) cheese or spinach tortellini (fresh or packaged)
  - 2 cups fresh broccoli florets, chopped into bite-sized pieces
- For the sauce:
  - 2 tablespoons unsalted butter
  - 3 cloves garlic, minced
  - 2 tablespoons all-purpose flour
  - 1 ½ cups milk (whole milk preferred)
  - ½ cup heavy cream
  - 1 cup grated Parmesan cheese
  - ¼ teaspoon ground nutmeg (optional, for added flavor)
  - Salt and pepper to taste
- Optional garnish:
  - Grated Parmesan
  - Fresh parsley, chopped

Instructions:
1. Cook the pasta and broccoli:
   - Bring a large pot of salted water to a boil.
   - Add the tortellini and cook according to the package instructions (usually 2–5 minutes).
   - During the last 2 minutes of cooking, add the broccoli florets to the boiling water with the pasta.
   - Drain the tortellini and broccoli together and set aside.

2. Prepare the sauce:
   - In a large skillet or saucepan, melt the butter over medium heat.
   - Add the minced garlic and sauté for 1 minute, until fragrant.
   - Sprinkle the flour over the garlic and whisk well to form a roux. Cook the roux for 1–2 minutes to remove the raw flour taste.
   - Gradually pour in the milk and heavy cream, whisking constantly to ensure no lumps form.
   - Cook the sauce for 4–5 minutes, stirring frequently, until it thickens slightly.

3. Add the cheese and seasonings:
   - Lower the heat and stir in the grated Parmesan cheese until melted and smooth.
   - Add the nutmeg (if using), and season with salt and pepper to taste.

4. Combine everything:
   - Add the cooked tortellini and broccoli to the sauce.
   - Toss gently to coat the pasta and broccoli evenly in the sauce.

5. Serve:
   - Serve the creamy tortellini and broccoli hot.
   - Garnish with additional grated Parmesan and fresh parsley, if desired.

Tips:
- For a richer flavor, use freshly grated Parmesan cheese instead of pre-packaged grated cheese.
- You can add cooked chicken or crispy bacon for extra protein.
- If you like a spicier kick, add a pinch of red pepper flakes to the sauce.

Enjoy your meal!
""";
          break;

        case 1:
          _menuDescription = """
Mediterranean Bow-Tie Pasta Recipe:

Ingredients:
- For the pasta:
  - 300g (10 oz) Farfalle (bow-tie pasta)
  - 1 tablespoon olive oil
- For the vegetables:
  - 1 medium red bell pepper, julienned
  - 1 medium green bell pepper, julienned
  - 1 medium orange bell pepper, julienned
  - 1 small zucchini, sliced into half-moons
  - ½ cup black olives, sliced
- For the sauce:
  - 2 tablespoons olive oil
  - 3 cloves garlic, minced
  - 1 can (14 oz) crushed tomatoes
  - 1 teaspoon dried oregano
  - ½ teaspoon dried basil
  - ½ teaspoon red pepper flakes (optional, for heat)
  - Salt and pepper to taste
- Optional garnish:
  - Grated Parmesan cheese
  - Fresh basil leaves, chopped

Instructions:
1. Cook the pasta:
   - Bring a large pot of salted water to a boil.
   - Add the Farfalle and cook according to the package instructions (usually 8–10 minutes).
   - Drain, drizzle with 1 tablespoon olive oil to prevent sticking, and set aside.

2. Prepare the vegetables:
   - Heat 1 tablespoon of olive oil in a large skillet over medium heat.
   - Add the bell peppers, zucchini, and a pinch of salt.
   - Sauté for 5–7 minutes, or until the vegetables are slightly softened.
   - Stir in the sliced black olives and remove the skillet from heat.

3. Make the sauce:
   - In a separate saucepan, heat 2 tablespoons olive oil over medium heat.
   - Add the minced garlic and sauté for 1 minute, until fragrant.
   - Pour in the crushed tomatoes and stir.
   - Add the dried oregano, basil, red pepper flakes (if using), and season with salt and pepper.
   - Simmer the sauce for 8–10 minutes, stirring occasionally, until thickened.

4. Combine everything:
   - Add the cooked pasta and sautéed vegetables to the sauce.
   - Toss gently to coat the pasta and vegetables evenly with the sauce.

5. Serve:
   - Serve the Mediterranean Bow-Tie Pasta hot.
   - Garnish with grated Parmesan cheese and fresh basil, if desired.

Enjoy your meal!
""";
          break;

        case 2:
          _menuDescription = """
Spaghetti Bolognese Recipe:

Ingredients:
- For the pasta:
  - 300g (10 oz) spaghetti
  - Salt for boiling water
- For the meat sauce:
  - 2 tablespoons olive oil
  - 1 medium onion, finely chopped
  - 2 garlic cloves, minced
  - 1 medium carrot, finely diced
  - 1 celery stalk, finely diced
  - 500g (1 lb) ground beef (or a mix of beef and pork)
  - 1 can (14 oz) crushed tomatoes
  - 2 tablespoons tomato paste
  - ½ cup beef broth (or red wine for extra flavor)
  - 1 teaspoon dried oregano
  - 1 teaspoon dried basil
  - ½ teaspoon red chili flakes (optional, for heat)
  - Salt and pepper to taste
- Optional garnish:
  - Fresh basil leaves, chopped
  - Grated Parmesan cheese

Instructions:
1. Cook the spaghetti:
   - Bring a large pot of salted water to a boil.
   - Add the spaghetti and cook according to the package instructions (usually 8–10 minutes).
   - Drain and set aside.

2. Prepare the meat sauce:
   - Heat olive oil in a large skillet or saucepan over medium heat.
   - Add the chopped onion, garlic, carrot, and celery. Sauté for 5–7 minutes until softened.
   - Add the ground beef and cook until browned, breaking it up with a wooden spoon as it cooks.
   - Stir in the tomato paste and cook for 1–2 minutes to enhance the flavor.
   - Add the crushed tomatoes, beef broth (or red wine), oregano, basil, and red chili flakes (if using).
   - Season with salt and pepper to taste.
   - Reduce the heat to low and let the sauce simmer for 20–25 minutes, stirring occasionally.

3. Combine and serve:
   - Toss the cooked spaghetti with the meat sauce or serve the sauce ladled over the pasta.
   - Garnish with grated Parmesan cheese and fresh basil leaves.

Enjoy your meal!
""";
          break;

        default:
          _menuDescription = "Select a dish to see details.";
          _showFavoriteOption = false;
          break;
      }
    });
  }

  Future<void> _addToFavorites() async {
    if (_selectedMenu == null || _selectedMenu == -1) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteRecipes = prefs.getStringList('favoriteRecipes') ?? [];

    String recipeName = "";
    switch (_selectedMenu) {
      case 0:
        recipeName = "Tortellini";
        break;
      case 1:
        recipeName = "Bow-Tie";
        break;
      case 2:
        recipeName = "Pasta";
        break;
    }

    if (!favoriteRecipes.contains(recipeName)) {
      favoriteRecipes.add(recipeName);
      await prefs.setStringList('favoriteRecipes', favoriteRecipes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Text("Menu Selection"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 5,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteRecipesScreen()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: menuImage(_selectedMenu),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int?>(
                    activeColor: Colors.brown,
                    value: 0,
                    groupValue: _selectedMenu,
                    onChanged: _handleMenuSelection,
                  ),
                  Text("Tortellini", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Radio<int?>(
                    activeColor: Colors.redAccent,
                    value: 1,
                    groupValue: _selectedMenu,
                    onChanged: _handleMenuSelection,
                  ),
                  Text("Bow-Tie", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Radio<int?>(
                    activeColor: Colors.orangeAccent,
                    value: 2,
                    groupValue: _selectedMenu,
                    onChanged: _handleMenuSelection,
                  ),
                  Text("Pasta", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    _menuDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.teal.shade900, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              if (_showFavoriteOption)
                GestureDetector(
                  onTap: _addToFavorites,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Add to Favorites",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
