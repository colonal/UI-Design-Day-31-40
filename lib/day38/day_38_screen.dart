import 'package:flutter/material.dart';

class Day38Screen extends StatefulWidget {
  const Day38Screen({Key? key}) : super(key: key);

  @override
  State<Day38Screen> createState() => _Day38ScreenState();
}

class _Day38ScreenState extends State<Day38Screen> {
  int selectedTool = -1;

  List<dynamic> tools = [
    {
      'image': 'https://cdn-icons-png.flaticon.com/128/732/732244.png',
      'selected_image': 'https://cdn-icons-png.flaticon.com/128/732/732244.png',
      'name': 'Sketch',
      'description': 'The digital design platform.',
    },
    {
      'image': 'https://img.icons8.com/color/2x/adobe-xd.png',
      'selected_image': 'https://img.icons8.com/color/2x/adobe-xd--v2.gif',
      'name': 'Adobe XD',
      'description': 'Fast & powerful UI/UX design solution.',
    },
    {
      'image': 'https://img.icons8.com/color/2x/figma.png',
      'selected_image': 'https://img.icons8.com/color/2x/figma--v2.gif',
      'name': 'Figma',
      'description': 'The collaborative interface design tool.',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Select a Design Tool",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ))
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "What do you want to learn?",
              style: TextStyle(color: Colors.grey[600], fontSize: 20),
            ),
            const SizedBox(height: 50),
            Expanded(
              // height: 50,
              child: ListView.separated(
                  itemCount: tools.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) => buildLearn(index)),
            )
          ],
        ),
      )),
    );
  }

  buildLearn(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTool = index;
        });
      },
      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
                width: 2,
                color:
                    selectedTool == index ? Colors.blueAccent : Colors.white),
            boxShadow: selectedTool == index
                ? [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ]
                : []),
        child: Row(
          children: [
            Image.network(
              selectedTool == index
                  ? tools[index]["selected_image"]
                  : tools[index]["image"],
              height: 60,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tools[index]["name"],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    tools[index]["description"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              ),
            ),
            if (selectedTool == index)
              const Icon(
                Icons.check_circle,
                color: Colors.blueAccent,
              )
          ],
        ),
      ),
    );
  }
}
