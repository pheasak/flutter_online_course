import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Back!'),
        centerTitle: false,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/toy-story-4-5k-2560x1600.jpg',
            ),
          ),
          SizedBox(width: 8),
          Text('User name'),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Category
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text('All', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text('Watch', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text('Phone', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text('Laptop', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Headphone',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Product List
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return productCard();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }

  Widget productCard() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                color: Colors.grey,
                child: Image.network(
                  fit: BoxFit.cover,
                  'https://imgs.search.brave.com/OvpPy8rye6UzKF0S3ENiyHkNQ1CFkXPgxdy-sSjfMBg/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly93d3cu/YXBwbGUuY29tL3Yv/aXBob25lL2hvbWUv/Y2ovaW1hZ2VzL292/ZXJ2aWV3L2NvbnNp/ZGVyX21vZGFscy9p/bm5vdmF0aW9uL21v/ZGFsX3NlY29uZF9f/ZDlsaGJlOW91dTgy/X2xhcmdlLmpwZw',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        '-20%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$100',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Description (Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quod.)',
              maxLines: 2,
              style: TextStyle(fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
