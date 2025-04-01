import 'package:flutter/material.dart';
import 'team_score.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int scoreA = 0;
  int scoreB = 0;
  int setsA = 0;
  int setsB = 0;
  String nomeA = "Time A";
  String nomeB = "Time B";

  void resetScores() {
    setState(() {
      scoreA = 0;
      scoreB = 0;
    });
  }

  void resetSets() {
    setState(() {
      setsA = 0;
      setsB = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TeamScore(
                teamName: nomeA,
                teamColor: Colors.blue,
                score: scoreA,
                onScoreIncrease: () {
                  setState(() {
                    scoreA++;
                  });
                },
                onScoreDecrease: () {
                  setState(() {
                    scoreA--;
                  });
                },
                onNameChanged: (valor) {
                  setState(() {
                    nomeA = valor;
                  });
                },
              ),
            ),
            Container(
              width: 60,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    setsA++;
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (setsA > 0) setsA--;
                  });
                },
                child: Center(
                  child: Text(
                    "$setsA",
                    style: TextStyle(fontSize: 50, fontFamily: "Digital7"),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: resetScores,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Icon(
                Icons.restart_alt_sharp,
                size: 24,
              ),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: resetSets,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Icon(
                Icons.restore_rounded,
                size: 24,
              ),
            ),
            SizedBox(width: 20),
            Container(
              width: 60,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    setsB++;
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (setsB > 0) setsB--;
                  });
                },
                child: Center(
                  child: Text(
                    "$setsB",
                    style: TextStyle(fontSize: 50, fontFamily: "Digital7"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TeamScore(
                teamName: nomeB,
                teamColor: Colors.red,
                score: scoreB,
                onScoreIncrease: () {
                  setState(() {
                    scoreB++;
                  });
                },
                onScoreDecrease: () {
                  setState(() {
                    scoreB--;
                  });
                },
                onNameChanged: (valor) {
                  setState(() {
                    nomeB = valor;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
