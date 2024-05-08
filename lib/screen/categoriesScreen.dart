import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zafram_mart/screen/categoryItemListScreen.dart';
import 'package:zafram_mart/screen/searchScreen.dart';
import 'package:zafram_mart/screen/sidebar.dart';

import '../component/color.dart';
import '../component/my_widgtes.dart';

//defining category Items
class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String _selectedCategory="";// Default selected category

  @override
  void initState() {
    _selectedCategory = 'Oil';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: pink, // Replace with your desired color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor, // Replace with your desired color
        toolbarHeight: 70,
        title: Text(
          "All Categories",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: myCart(),
          ),
        ],
      ),
      body: Row(
        children: <Widget>[
          Sidebar(
            onNavigate: (category) {
              setState(() {
                _selectedCategory =
                    category; // Update the selected category based on the clicked item
              });
            },
            items: [
              DrawerItem(title: 'Oil', image: 'assets/images2/Aashirrvad Oli.png'),
              DrawerItem(title: 'Fruits & Vegetables', image: 'assets/category/fruit.png'),
              DrawerItem(
                  title: 'Home & Kitchen', image: 'assets/category/home.png'),
              DrawerItem(title: 'Fashion', image: 'assets/category/fation.png'),
              DrawerItem(
                  title: 'Dairy & Bakery',
                  image: 'assets/images2/Low Fit Milk.png'),
              DrawerItem(
                  title: 'Home care', image: 'assets/images2/Tide.png'),
              DrawerItem(title: 'Snacks & Branded Food', image: 'assets/images2/snacks.png'),
              DrawerItem(
                  title: 'Cold Drink', image: 'assets/images2/Sprite.png'),
              DrawerItem(title: 'Flour', image: 'assets/images2/chakki Atta.png'),
            ],
          ),
          Expanded(
            child: CategoryData(categoryName: _selectedCategory),
          ),
        ],
      ),
    );
  }
}

//list of category data  mj
class CategoryData extends StatefulWidget {
  final String categoryName;

  CategoryData({required this.categoryName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryData> {
  final List<Map<String, String>> searchCategory = [
    {
      "imagepath": "assets/images2/Aashirrvad Oli.png",
      "name": "Aashirrvad Oli",
      "category": "Oil"
    },
    {
      "imagepath": "assets/images2/Amul Gold.png",
      "name": "Amul Gold",
      "category": "Dairy & Bakery"
    },
    {
      "imagepath": "assets/images2/Amul tax.png",
      "name": "Amul taza",
      "category": "Dairy & Bakery"
    },
    {
      "imagepath": "assets/images2/AmulKool.png",
      "name": "Amul Kool",
      "category": "Dairy & Bakery"
    },
    {
      "imagepath": "assets/category/fation.png",
      "name": "Amul taza",
      "category": "Fashion"
    },
    {
      "imagepath": "assets/category/fation.png",
      "name": "Amul Kool",
      "category": "Fashion"
    },
    {
      "imagepath": "assets/images2/Arabian Dates.png",
      "name": "Arabian Dates",
      "category": "Fruits & Vegetables"
    },
    {
      "imagepath": "assets/images2/chakki Atta.png",
      "name": "chakki Rice Flour",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/chakki Atta.png",
      "name": "chakki Rice Flour",
      "category": "Flour"
    },
    {
      "imagepath": "assets/images2/chana daal.png",
      "name": "chana daal",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/Cow Ghee big pack.png",
      "name": "Cow Ghee big pack",
      "category": "Dairy & Bakery"
    },
    {
      "imagepath": "assets/images2/Cow Ghee big pack.png",
      "name": "Cow Ghee big pack",
      "category": "Oil"
    },
    {
      "imagepath": "assets/images2/CowGhee.png",
      "name": "Cow Ghee",
      "category": "Dairy & Bakery"
    },
    {
      "imagepath": "assets/images2/CowGhee.png",
      "name": "Cow Ghee",
      "category": "Oil"
    },
    {
      "imagepath": "assets/images2/Dates.png",
      "name": "Dates",
      "category": "Fruits & Vegetables"
    },
    {
      "imagepath": "assets/images2/EveryDay.png",
      "name": "Every Day",
      "category": "Dairy & Bakery"
    },
    {
      "imagepath": "assets/images2/Fortune Oil.png",
      "name": "Fortune Oil",
      "category": "Oil"
    },
    {
      "imagepath": "assets/images2/Foutune Oil.png",
      "name": "Fortune Oil",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/Good Life Sugar.png",
      "name": "Good Life Sugar",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/GulabOil.png",
      "name": "Gulab Oil",
      "category": "Oil"
    },
    {
      "imagepath": "assets/images2/Harpic.png",
      "name": "Harpic",
      "category": "Home care"
    },
    {
      "imagepath": "assets/images2/Harpic pack2.png",
      "name": "Harpic pack",
      "category": "Home care"
    },
    {
      "imagepath": "assets/images2/jeera.png",
      "name": "jeera",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/Kabuli Chana.png",
      "name": "Kabuli Chana",
      "category": "Flour"
    },
    {
      "imagepath": "assets/images2/Low Fit Milk.png",
      "name": "Low Fit Milk",
      "category": "Dairy & Bakery"
    },
    {
      "imagepath": "assets/images2/Madhur sugar.png",
      "name": "Madhur sugar",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/masoor Daal.png",
      "name": "masoor Daal",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/nandiniOil.png",
      "name": "Nandini Oil",
      "category": "Oil"
    },
    {
      "imagepath": "assets/images2/Parle-G 450g.png",
      "name": "Parle-G 450g",
      "category": "Snacks & Branded Food"
    },
    {
      "imagepath": "assets/images2/Parle-G-1kg.png",
      "name": "Parle-G",
      "category": "Snacks & Branded Food"
    },
    {
      "imagepath": "assets/images2/Pepsi.png",
      "name": "Pepsi",
      "category": "Cold Drink"
    },
    {
      "imagepath": "assets/images2/priya sunflower oil.png",
      "name": "Priya Sunflower Oil",
      "category": "Oil"
    },
    {
      "imagepath": "assets/images2/priya sunflower oil - Copy.png",
      "name": "Priya Sunflower Oil ",
      "category": "Oil"
    },
    {
      "imagepath": "assets/images2/punam Ata.png",
      "name": "Punam Ata",
      "category": "Flour"
    },
    {
      "imagepath": "assets/images2/Rice.png",
      "name": "Rice",
      "category": "Flour"
    },
    {
      "imagepath": "assets/images2/Rice.png",
      "name": "Rice",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/Rice Queen.png",
      "name": "Queen Rice",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/Sprite.png",
      "name": "Sprite 2l",
      "category": "Cold Drink"
    },
    {
      "imagepath": "assets/images2/Sprite - Copy.png",
      "name": "Sprite 1L",
      "category": "Cold Drink"
    },
    {
      "imagepath": "assets/images2/Sprite - Copy.png",
      "name": "Sprite 1/2 L",
      "category": "Cold Drink"
    },
    {
      "imagepath": "assets/images2/Sprite 1L - Copy.png",
      "name": "Sprite 1L",
      "category": "Cold Drink"
    },
    {
      "imagepath": "assets/images2/Surf excel.png",
      "name": "Surf Excel",
      "category": "Home care"
    },
    {
      "imagepath": "assets/images2/Surf excel - Copy.png",
      "name": "Surf Excel",
      "category": "Home care"
    },
    {
      "imagepath": "assets/images2/Tata salt.png",
      "name": "Tata Salt",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/Tata salt - Copy.png",
      "name": "Tata Salt",
      "category": "Home & Kitchen"
    },
    {
      "imagepath": "assets/images2/Tide.png",
      "name": "Tide",
      "category": "Home care"
    },
    {
      "imagepath": "assets/images2/Tide - Copy.png",
      "name": "Tide",
      "category": "Home care"
    },
  ];

  final List<Map<String, String>> category = [];

  @override
  void didUpdateWidget(CategoryData oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categoryName != widget.categoryName) {
      _filterCategories(
          widget.categoryName); // Filter when category name changes
    }
  }

  void _filterCategories(String categoryName) {
    // Clear previous search results
    setState(() {
      category.clear();
      // Filter categories based on the categoryName
      for (var item in searchCategory) {
        setState(() {
          if (item['category'] == categoryName) {
            category.add(item);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.8, color: Colors.grey),
              // color: skyBlue.withOpacity(0.5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    widget
                        .categoryName, // Use the categoryName passed from the constructor
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: appbarColor, // Replace with your desired color
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        // Display categories
        Expanded(
            child: GridView.builder(
          itemCount: category.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              width: 100, // Set a fixed width for each item
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryItem(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: skyBlue,
                      radius: 35,
                      child: Image.asset(
                        "${category[index]["imagepath"]}",
                        // fit: BoxFit.cover,
                        width:
                            65, // You might need to adjust the width and height to fit the CircleAvatar properly
                        height: 65,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ), // Adjust spacing between CircleAvatar and Text
                    Text(
                      "${category[index]["name"]}",
                      style: TextStyle(
                        // fontSize: 15,
                        fontFamily: "monsterrat",
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ))
      ],
    );
  }
}
