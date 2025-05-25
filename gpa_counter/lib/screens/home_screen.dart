import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calcolate your GPA',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.sizeOf(context).width*0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 43, 43, 43),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Subject: ', style: TextStyle(color: const Color.fromARGB(255, 138, 169, 212), fontSize: 24, fontWeight: FontWeight.w500),),
                              Text('CS', style: TextStyle(color: const Color.fromARGB(255, 138, 169, 212), fontSize: 24, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Cridit: ', style: TextStyle(color: const Color.fromARGB(255, 138, 169, 212), fontSize: 24, fontWeight: FontWeight.w500)),
                              Text('4', style: TextStyle(color: const Color.fromARGB(255, 138, 169, 212), fontSize: 24, fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Grade: ', style: TextStyle(color: const Color.fromARGB(255, 138, 169, 212), fontSize: 24, fontWeight: FontWeight.w500)),
                              Text('A+', style: TextStyle(color: const Color.fromARGB(255, 138, 169, 212), fontSize: 24, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.delete, color: const Color.fromARGB(255, 151, 73, 73), size: 56,)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.calculate_rounded)),
        
      // ])
      
      
    );
  }
}