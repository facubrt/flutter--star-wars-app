import 'package:flutter/material.dart';
import 'package:starwapp/models/vehicle.dart';
import 'package:starwapp/views/pages/detail/widgets/item_widget.dart';

class VehiclesListWidget extends StatelessWidget {
  final List<Vehicle> vehicles;
  const VehiclesListWidget({Key? key, required this.vehicles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          return ItemWidget(title: vehicles[index].model!, subtitle: vehicles[index].name!);
        },
        separatorBuilder: (context, index) {
          return Divider(
          height: 0,
          thickness: 1,
          color: Colors.teal.withOpacity(0.2),
        );
        },
    );
  }
}
