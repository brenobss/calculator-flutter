import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double primeiroNumero = 0.0;
  String operacao = '';
  String numero = '0';
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
          numero += tecla;
          numero = numero.replaceAll(',', '.');
          if (numero.contains('.')) {
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;

      case '+':
      case '-':
      case 'X':
      case '/':
        operacao = tecla;
        numero = numero.replaceAll(',', '. ');
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;

        if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            // ignore: avoid_print
            print('Erro: divisão por zero');
            return;
          }
        }

        if (operacao == '+') {
          resultado = primeiroNumero + double.parse(numero);
        }
        if (operacao == '-') {
          resultado = primeiroNumero - double.parse(numero);
        }
        if (operacao == 'X') {
          resultado = primeiroNumero * double.parse(numero);
        }
        if (operacao == '/') {
          resultado = primeiroNumero / double.parse(numero);
        }

        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }
        break;
      case 'AC':
        setState(() {
          numero = '0';
        });
        break;
      case '<X':
        setState(() {
          if (numero.isNotEmpty) {
            numero = numero.substring(0, numero.length - 1);
          }
        });
        break;
      default:
        setState(() {
          numero += tecla;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Calculadora')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(numero, style: const TextStyle(fontSize: 72)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('AC'),
                    child: const Text('AC', style: TextStyle(fontSize: 48))),
                const Text(''),
                const Text(''),
                GestureDetector(
                    onTap: () => calcular('<X'),
                    child: Image.asset(
                      'assets/images/arrow_left.png',
                      width: 52,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('7'),
                    child: const Text('7', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('8'),
                    child: const Text('8', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('9'),
                    child: const Text('9', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('/'),
                    child: Image.asset('assets/images/divisao.png')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('4'),
                    child: const Text('4', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('5'),
                    child: const Text('5', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('6'),
                    child: const Text('6', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('X'),
                    child: Image.asset(
                      'assets/images/multi.png',
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('1'),
                    child: const Text('1', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('2'),
                    child: const Text('2', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('3'),
                    child: const Text('3', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('-'),
                    child: Image.asset(
                      'assets/images/menos.png',
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('0'),
                    child: const Text('0', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular(','),
                    child: const Text(',', style: TextStyle(fontSize: 48))),
                GestureDetector(
                    onTap: () => calcular('='),
                    child: Image.asset(
                      'assets/images/igual.png',
                    )),
                GestureDetector(
                    onTap: () => calcular('+'),
                    child: Image.asset(
                      'assets/images/adicao.png',
                    )),
              ],
            ),
            const Text('======================================'),
          ],
        ),
      ),
    );
  }
}
