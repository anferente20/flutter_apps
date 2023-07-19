import 'package:flutter/material.dart';
import 'package:widgets_app/config/constants/enums.dart';
import 'package:widgets_app/presentation/widgets/tiles/custom_expansion_tile.dart';

class UIControlScreen extends StatelessWidget {
  const UIControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI Controls'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {},
        ),
        body: const UIControlsView());
  }
}

class UIControlsView extends StatefulWidget {
  const UIControlsView({
    super.key,
  });

  @override
  State<UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<UIControlsView> {
  bool isDevelopper = true;
  Transportation selectedTransport = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDiner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Modo desarrollador'),
          subtitle: const Text('Controles adicionales.'),
          value: isDevelopper,
          onChanged: (value) {
            setState(() {
              isDevelopper = !isDevelopper;
            });
          },
        ),
        CustomExpansionTile(
            title: 'Medio de Transporte',
            subtitle: '$selectedTransport',
            information: [
              RadioListTile(
                value: Transportation.car,
                title: const Text('Carro'),
                subtitle: const Text('Viajar por carro'),
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = value!;
                  });
                },
              ),
              RadioListTile(
                value: Transportation.plane,
                title: const Text('Avión'),
                subtitle: const Text('Viajar por avión'),
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = value!;
                  });
                },
              ),
              RadioListTile(
                value: Transportation.boat,
                title: const Text('Barco'),
                subtitle: const Text('Viajar por barco'),
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = value!;
                  });
                },
              ),
              RadioListTile(
                value: Transportation.submarine,
                title: const Text('Submarino'),
                subtitle: const Text('Viajar por submarino'),
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = value!;
                  });
                },
              ),
            ]),
        CustomExpansionTile(
            title: 'Preferencias de comida',
            subtitle: 'Selecciona tus comidas',
            information: [
              CheckboxListTile(
                value: wantsBreakfast,
                title: const Text('Incluir desayuno'),
                onChanged: (value) {
                  setState(() {
                    wantsBreakfast = !wantsBreakfast;
                  });
                },
              ),
              CheckboxListTile(
                value: wantsLunch,
                title: const Text('Incluir desayuno'),
                onChanged: (value) {
                  setState(() {
                    wantsLunch = !wantsLunch;
                  });
                },
              ),
              CheckboxListTile(
                value: wantsDiner,
                title: const Text('Incluir desayuno'),
                onChanged: (value) {
                  setState(() {
                    wantsDiner = !wantsDiner;
                  });
                },
              ),
            ])
      ],
    );
  }
}
