import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwapp/src/provider/sw_provider.dart';
import 'package:starwapp/src/views/pages/detail/widgets/item_widget.dart';
import 'package:starwapp/src/views/pages/detail/widgets/skeleton_property_list_widget.dart';

class VehiclesListWidget extends StatelessWidget {
  final List<String> vehicles;
  const VehiclesListWidget({Key? key, required this.vehicles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final swProvider = Provider.of<SWProvider>(context);
    return FutureBuilder(
      future: swProvider.getVehicles(vehicles: vehicles),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                  title: snapshot.data[index].model,
                  subtitle: snapshot.data[index].name);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 0,
                thickness: 1,
                color: Colors.teal.withOpacity(0.2),
              );
            },
          );
        } else {
          return const SkeletonPropertyListWidget();
        }
      },
    );
  }
}
