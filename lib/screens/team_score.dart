import 'package:flutter/material.dart';

class TeamScore extends StatelessWidget {
  final String teamName;
  final Color teamColor;
  final int score;
  final Function onScoreIncrease;
  final Function onScoreDecrease;
  final Function(String) onNameChanged;

  const TeamScore({
    required this.teamName,
    required this.teamColor,
    required this.score,
    required this.onScoreIncrease,
    required this.onScoreDecrease,
    required this.onNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: teamColor,
            ),
            controller: TextEditingController(text: teamName)
              ..selection = TextSelection.collapsed(offset: teamName.length),
            onChanged: onNameChanged,
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () => onScoreIncrease(),
            onLongPress: () => onScoreDecrease(),
            child: Container(
              width: 170,
              height: 150,
              decoration: BoxDecoration(
                color: teamColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$score",
                    style: TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                      fontFamily: 'Digital7',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
