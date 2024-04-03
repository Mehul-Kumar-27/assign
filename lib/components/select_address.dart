import 'package:flutter/material.dart';

class SelectAddress extends StatelessWidget {
  final VoidCallback onTap;
  SelectAddress({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text(
                "Select Address",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 40),
          child: Container(
            height: 5,
            width: 23,
            color: Colors.grey,
          ),
        ),
        Material(
          elevation: 12,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 13,
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 2,
                    color: Colors.grey,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.grey,
                      size: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Your Location',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Destination',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        const SizedBox(height: 25),
        const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              SizedBox(width: 20),
              Text("Show on map")
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "RECENT",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
              separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(),
                  ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text(
                      "Kings Cross Station",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: const Text(
                      "London",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ));
              }),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}