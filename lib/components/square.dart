import 'package:chest/components/piece.dart';
import 'package:chest/values/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final void Function()? onTap; //点击事件

  const Square({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.isValidMove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    //若选择，则方格变为绿色
    if (isSelected) {
      squareColor = Colors.green;
    }
    //
    else if (isValidMove) {
      squareColor = Colors.purple;
    }
    //否则，仅是黑白棋子
    else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,

        //视觉调整使更直观
        margin: EdgeInsets.all(isValidMove ? 8 : 0),

        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
