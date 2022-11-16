import 'package:flutter/material.dart';
import 'package:live_coding/view/utils/constants.dart';
import 'package:live_coding/view/utils/texts.dart';
import 'package:live_coding/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Textos.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: !provider.isloading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    //Image.network(provider.randomJoke!.iconUrl!),
                    Text(
                      provider.randomJoke!.value ?? "",
                      style: const TextStyle(
                        fontSize: Constants.fontSize,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(provider.randomJoke!.createdAt.toString())
                  ])
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: provider.getJoke,
        label: const Text(Textos.mostrarChiste),
      ),
    );
  }
}
