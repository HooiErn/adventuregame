import 'package:flutter/material.dart';
import 'package:adventuregame/story_brain.dart';

void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}

 StoryBrain storyBrain = StoryBrain();//Import the storyBrain

class StoryPage extends StatefulWidget {

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/Star.jpg"),// background image assets
            fit: BoxFit.cover,
            ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.landscape, size: 30),
              SizedBox(width: 10), // Add some space between the icon and text
              Text(
                "Adventure Game",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // Choice 1 made by user
                    setState(() {
                      storyBrain.nextStory(1);
                      print("Button 1 clicked");
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.red,
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white,
                    ),
                    shape: MaterialStateProperty.resolveWith(
                          (states) => BeveledRectangleBorder(),
                    ),
                  ),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(), //if false, then disappear
                  child: TextButton(
                    onPressed: () {
                      // Choice 2 made by user
                      setState(() {
                        storyBrain.nextStory(2);
                        print("Button 2 clicked");
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.blue),
                      foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                      shape: MaterialStateProperty.resolveWith(
                              (states) => BeveledRectangleBorder()
                      ),
                    ),
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
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


