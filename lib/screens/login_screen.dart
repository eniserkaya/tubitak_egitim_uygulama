import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? kullaniciAdi;
  String? parola;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Login Ekranı')),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            logo(),
            _form(),
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 90),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  width: 150,
                  height: 150,
                ),
                alignment: Alignment.center,
              ),
              height: 154,
            )),
            Positioned(
              child: Container(
                  height: 154,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )),
            ),
            Positioned(
              width: 60,
              height: 60,
              top: 140,
              left: 260,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            Positioned(
              width: 30,
              height: 30,
              top: 200,
              left: 230,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _kullanciAdiTextFormField(),
            _parolaTextFormField(),
            _girisYapButton()
          ],
        ),
      ),
    );
  }

  _kullanciAdiTextFormField() {
    return TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.name,
      maxLength: 50,
      decoration: _myInputDecoration(),
      onSaved: (value) {
        kullaniciAdi = value!.trim();
      },
      validator: (value) {
        if (value != null) {
          return value.trim().isEmpty || value.trim().length < 3
              ? 'Lütfen eksiksiz bir şekilde doldurunuz'
              : null;
        } else {
          return "Lütfen eksiksiz bir şekilde doldurunuz";
        }
      },
    );
  }

  _parolaTextFormField() {
    return TextFormField(
      textAlign: TextAlign.center,
      obscureText: true,
      keyboardType: TextInputType.name,
      maxLength: 50,
      decoration: _myInputDecoration(),
      onSaved: (value) {
        parola = value!.trim();
      },
      validator: (value) {
        if (value != null) {
          return value.trim().isEmpty || value.trim().length < 3
              ? 'Lütfen eksiksiz bir şekilde doldurunuz'
              : null;
        } else {
          return "Lütfen eksiksiz bir şekilde doldurunuz";
        }
      },
    );
  }

  _girisYapButton() {
    return ElevatedButton(
      onPressed: _girisYap,
      child: Text('Giriş Yap'),
      style: ElevatedButton.styleFrom(
          primary: Colors.amber[900], minimumSize: Size(double.infinity, 40)),
    );
  }

  _myInputDecoration() {
    return InputDecoration(
      counterStyle: TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(1),
      ),
      filled: true,
      fillColor: Colors.white70,
      contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
    );
  }

  void _girisYap() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      _formSubmit();
      print(kullaniciAdi);
      print(parola);
    }
  }

  void _formSubmit() {
    //HTTP ISTEGI YAPILACAK
  }
}
