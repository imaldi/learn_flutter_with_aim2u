import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _keyForm = GlobalKey<FormState>();
  String? nama;
  String? password;
  bool obscurePasswordText = true;

  checkForm() {
    final form = _keyForm.currentState;
    if (form!.validate()) {
      setState(() {
        form.save();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Screen'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(

              /// Form perlu key untuk dipakai ketika validasi isi seluruh form
              key: _keyForm,
              child: Column(
                children: [
                  Container(
                    child: Text('Form Pendaftaran ${nama ?? ""}',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text('Nama Lengkap'),
                      hintText: 'Nama Lengkap Elu',
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                      if(RegExp(r'[^a-zA-Z\s]+').hasMatch(text)) {
                        return 'Nama hanya boleh berisi huruf';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nama = value;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      return (text!.length < 8) ? "Password minimal 8 karakter" : null;
                    },
                    onChanged: (text){
                      setState(() {
                        password = text;
                      });
                    },
                    decoration: InputDecoration(
                      label: Text('Password'),
                      hintText: 'Password Anda',
                      suffixIcon: InkWell(
                        child: obscurePasswordText
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined),
                        onTap: () {
                          setState(() {
                            obscurePasswordText = !obscurePasswordText;
                          });
                        },
                      ),
                    ),
                    obscureText: obscurePasswordText,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      return text == password ? null : "Password tidak cocok";
                    },
                    decoration: InputDecoration(
                      label: const Text('Password Confirmation'),
                      hintText: 'Ketik Ulang Password',
                      suffixIcon: InkWell(
                        child: obscurePasswordText
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined),
                        onTap: () {
                          setState(() {
                            obscurePasswordText = !obscurePasswordText;
                          });
                        },
                      ),
                    ),
                    obscureText: obscurePasswordText,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        checkForm();
                      },
                      child: Text('Simpan'))
                ],
              )),
        )));
  }
}
