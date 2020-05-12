import 'package:bipolar_test/views/initializeAnotherProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bipolar_test/providers/imageProvider.dart';
import 'package:bipolar_test/models/list_model.dart';

class InitializeProviderData extends StatefulWidget { 

  _InitializeProviderData createState() => _InitializeProviderData();
}

class _InitializeProviderData extends State<InitializeProviderData> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _loadImageList());
  }

  Widget _loadImageList() {
    return FutureBuilder<ImageList>(
      future: Provider.of<MyImageProvider>(context, listen: false).fetchImages(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text(
              'Fetch opportunity data',
              textAlign: TextAlign.center,
            );
          case ConnectionState.active:
            return Text('');
          case ConnectionState.waiting:
            return Center(child: Text("Fetching Images..."));
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return InitializeAnotherProviderData();
            }
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}