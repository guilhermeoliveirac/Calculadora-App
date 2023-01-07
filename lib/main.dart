import 'dart:ui';

//import  'assets/images/apagar.png';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numeroPainel = '0';

  double primeiroNumero = 0.0;

  String operacao = '';
  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numeroPainel += tecla;

          numeroPainel.replaceAll(',', '.');

          if (numeroPainel.contains('.')) {
            double numeroDouble = double.parse(numeroPainel);
            numeroPainel = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numeroPainel);
            numeroPainel = numeroInt.toString();
          }
          numeroPainel.replaceAll('.', ',');
        });
        break;

      case '+':
      case '-':
      case 'x':
      case '/':
        operacao = tecla;
        numeroPainel = numeroPainel.replaceAll(',', '.');
        primeiroNumero = double.parse(numeroPainel);
        numeroPainel = numeroPainel.replaceAll('.', ',');
        numeroPainel = '0';
        break;

      case '=':
        var resultado = 0.0;

        if (operacao == '/') {
          if (double.parse(numeroPainel) * 1 == 0) {
            print('divisão por zero');

            return;
          }
        }

        if (operacao == '+') {
          resultado = primeiroNumero + double.parse(numeroPainel);
        }
        if (operacao == '-') {
          resultado = primeiroNumero - double.parse(numeroPainel);
        }
        if (operacao == 'x') {
          resultado = primeiroNumero * double.parse(numeroPainel);
        }
        if (operacao == '/') {
          resultado = primeiroNumero / double.parse(numeroPainel);
        }

        String resultadoString = resultado.toString();
        List<String> resultadosPartes = resultadoString.split('.');

        if (int.parse(resultadosPartes[1]) * 1 == 0) {
          setState(() {
            numeroPainel = int.parse(resultadosPartes[0]).toString();
            numeroPainel = numeroPainel.replaceAll('.', ',');
          });
        } else {
          setState(() {
            numeroPainel = resultado.toString();
            numeroPainel = numeroPainel.replaceAll('.', ',');
          });
        }
        break;

      case 'AC':
        setState(() {
          numeroPainel = '0';
        });
        break;

      case '<x':
        setState(() {
          if (numeroPainel.length > 0) {
            numeroPainel = numeroPainel.substring(0, numeroPainel.length - 1);
          }
        });

        break;

      default:
        numeroPainel += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Calculadora'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                numeroPainel,
                style: TextStyle(fontSize: 72),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => calcular('AC'),
                child: Text(
                  'AC',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              Text(''),
              Text(''),
              GestureDetector(
                onTap: () => calcular('<x'),
                child: Image.asset(
                  'assets/icon.png',
                  width: 60,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (() {
                  calcular('7');
                }),
                child: Text(
                  '7',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('8'),
                child: Text(
                  '8',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('9'),
                child: Text(
                  '9',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('/'),
                child: Text(
                  '/',
                  style: TextStyle(fontSize: 48),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => calcular('4'),
                child: Text(
                  '4',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('5'),
                child: Text(
                  '5',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('6'),
                child: Text(
                  '6',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('x'),
                child: Text(
                  'x',
                  style: TextStyle(fontSize: 48),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => calcular('1'),
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('2'),
                child: Text(
                  '2',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('3'),
                child: Text(
                  '3',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('-'),
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 48),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => calcular('0'),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('.'),
                child: Text(
                  ',',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('='),
                child: Text(
                  '=',
                  style: TextStyle(fontSize: 48),
                ),
              ),
              GestureDetector(
                onTap: () => calcular('+'),
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 48),
                ),
              ),
            ],
          ),
          Text('Feito em Flutter  DEV: @guilherme_olivira_c'),
        ],
      ),
    ));
  }
}
