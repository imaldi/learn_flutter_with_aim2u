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
                    child: Text('Form Pendaftaran ${nama ?? ""}'),
                  ),
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text('Nama Lengkap'),
                      hintText: 'Nama Lengkap Elu',
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Nama Tidak Boleh Kosong!';
                      }
                      return null;
                    },
                    onSaved: (value){
                      nama = value;
                    },
                  ),

                  ElevatedButton(onPressed: (){
                    checkForm();
                  }, child: Text('Simpan'))
                ],
              )),
        )));
  }
}
