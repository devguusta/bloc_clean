import 'package:estudo_bloc/app/app_controller.dart';
import 'package:estudo_bloc/app/login/presenter/login_controller.dart';
import 'package:estudo_bloc/app/login/presenter/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final controller = Modular.get<LoginController>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.title),
        ),
        body: BlocBuilder(
            bloc: controller,
            builder: ((context, state) {
              return LayoutBuilder(
                builder: ((context, constraints) {
                  if (constraints.maxWidth > 1000) {
                    return Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.red,
                            height: constraints.maxHeight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.blueGrey,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                      ),
                                      onChanged: (value) {
                                        if (value.length > 8) {
                                          controller.emailValid = true;
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    color: Colors.blueGrey,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Senha',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      controller.add(LoginFetchListUser());
                                    },
                                    child: Icon(
                                      controller.emailValid
                                          ? Icons.search
                                          : Icons.error,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            width: constraints.maxWidth,
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state is LoginStateEmpty) ...[
                                  const Text('Nada de novo'),
                                ] else if (state is LoginStateLoading) ...[
                                  const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.orange,
                                    ),
                                  ),
                                ] else if (state is LoginStateFailure) ...[
                                  const Text('Erro'),
                                ] else if (state is LoginStateSuccess) ...[
                                  SizedBox(
                                    height: 500,
                                    child: ListView.builder(
                                        itemCount: state.users.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(state.users[index].email),
                                                Text(state.users[index].name)
                                              ],
                                            ),
                                          );
                                        }),
                                  )
                                ]
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Modular.get<AppController>().isDark = true;
                                },
                                child: const Icon(
                                  Icons.h_mobiledata,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }),
              );
            })));
  }
}
