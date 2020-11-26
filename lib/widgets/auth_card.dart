import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit(){

  }

  @override
  Widget build(BuildContext context) {
    final deviceScreen = MediaQuery.of(context).size;
    return Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            height: 320,
            width: deviceScreen.width * 0.75,
            padding: EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return "Informe um e-mail válido";
                      }
                      return null;
                    },
                    onSaved: (value) => _authData['email'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length > 5) {
                        return "Informe um senha válido";
                      }
                      return null;
                    },
                    onSaved: (value) => _authData['password'] = value,
                  ),
                  if (_authMode == AuthMode.Signup)
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Confirmar senha'),
                      controller: _passwordController,
                      obscureText: true,
                      validator: _authMode == AuthMode.Signup
                          ? (value) {
                              if (value != _passwordController.text) {
                                return "Senhas são diferentes!";
                              }
                              return null;
                            }
                          : null,
                      onSaved: (value) => _authData['password'] = value,
                    ),
                  SizedBox(height: 20),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryTextTheme.button.color,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                        _authMode == AuthMode.Login ? 'ENTRAR' : 'REGISTRAR'),
                      onPressed: _submit,
                  ),

                ],
              ),
            )));
  }
}
