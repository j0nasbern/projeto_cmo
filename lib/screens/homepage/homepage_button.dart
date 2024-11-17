import 'package:flutter/material.dart';

// Classe de HomepageButton
//
// Botão costumizado para o menu inicial da app. Recebe o
// nome do proximo ecrã e o widget do próximo ecrã.
class HomepageButton extends StatelessWidget {
  final String _text;
  final Widget _nextScreen;

  HomepageButton(this._text, this._nextScreen);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 12.0),
          fixedSize: const Size(380.0 , 70.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _nextScreen),);
        },
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            _text,
            textAlign: TextAlign.center,
          ),
        )
      );
  }
}