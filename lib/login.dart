import 'package:flutter/material.dart';
import 'package:flutter_application_api1/mainTab.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 400),
          child: Column(
            children: [
              Card(
            child: Center(
              child:Image.network('https://static.vecteezy.com/system/resources/thumbnails/007/407/996/small/user-icon-person-icon-client-symbol-login-head-sign-icon-design-vector.jpg', height: 200
              ,)
              ,
            ),
          ),
          const SizedBox(height: 16),
              TextFormField(
      autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        hintText: 'Nombre del usuario',
        labelText: 'Nombre',
        suffixIcon: Icon(Icons.group_outlined),
        icon: Icon(Icons.assignment_ind_outlined),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),
    const SizedBox(height: 16),
                TextFormField(
      autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.group_outlined),
        icon: Icon(Icons.password),
      ),
      onChanged: (value) {
        print('value: $value');
      },
    ),
    const SizedBox(height: 16),

      ElevatedButton(
      onPressed: () {
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainApp()),
          );
      },
      child: const SizedBox(
        width: 100,
        child: Center(
          child: Text('Ingresar'),
        ),
        ),
    ),

                
            ],)
      ),
      ),
    );
  }
}