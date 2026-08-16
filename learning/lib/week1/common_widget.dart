import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget {
  const CommonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person),
        ),
        centerTitle: true,
        title: Text(
          'My Profile Card',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 5),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //     'https://imgs.search.brave.com/rDj6VkF_MVhp-JUVYY0ocmrmEREevLAbQqQfyW39KWo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTAx/OTg5NjIzNC9waG90/by9wcm9maWxlLXNo/b3Qtb2YtYmVhdXRp/ZnVsLXlvdW5nLW1h/bi1zaG90LW9uLXN0/dWRpby5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9azBzRWlU/NkhRUjFHcXFtamlS/czlLby1fVm91aFFw/WnRJeU9VSjRDODVm/WT0',
                      //   ),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/toy-story-4-5k-2560x1600.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                // Image.asset('assets/images/profile_image.jpg'),
                Text(
                  'Ros Rithsakphea',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.lightBlue, width: 1),
                  ),
                  child: Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.warning_rounded, color: Colors.lightBlue),
                      Flexible(
                        child: Text(
                          'jkhalkjsdf kjhljjhhhaljkdhf lajhdfasdfasdfahlaksdf',
                          maxLines: 4,
                        ),
                      ),

                      // Icon(Icons.info_outline,color: Colors.lightBlue,),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    spacing: 20,
                    children: [
                      Icon(Icons.phone),
                      Text('010203039293'),
                      Spacer(),
                      Text(
                        'Call',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container()
                Divider(indent: 60, endIndent: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    spacing: 20,
                    children: [
                      Icon(Icons.mail),
                      Text('example@gmail.com'),
                      Spacer(),
                      Text(
                        'MESSAGE',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                // Text('john.doe@example.com'),
                // Text('+1234567890'),
              ],
            ),
          ),
        ),
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
}
