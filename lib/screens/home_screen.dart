import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup/cubit/auth_cubit.dart';
import 'package:login_signup/screens/login_screen.dart';
import 'package:login_signup/theme.dart';
import 'package:login_signup/widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Text(
                    'Hello ${state.user.name}, Welcome',
                    style: heading2,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthInitial) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red.shade700,
                      content: Text(
                        state.error,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Container(
                  width: 220,
                  child: CustomPrimaryButton(
                    buttonColor: Colors.red.shade700,
                    textValue: 'Log Out',
                    textColor: Colors.white,
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
