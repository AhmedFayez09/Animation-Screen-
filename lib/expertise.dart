import 'package:animated_login/animation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class AxpertiseScreen extends StatefulWidget {
  const AxpertiseScreen({super.key});

  @override
  State<AxpertiseScreen> createState() => _AxpertiseScreenState();
}

class _AxpertiseScreenState extends State<AxpertiseScreen> {
  Artboard? experinesArtboard;
  late RiveAnimationController controllerBeginner;
  late RiveAnimationController controllerIntermediate;
  late RiveAnimationController controllerExpert;
  void removeAllControllers() {
    experinesArtboard?.artboard.removeController(controllerBeginner);
    experinesArtboard?.artboard.removeController(controllerIntermediate);
    experinesArtboard?.artboard.removeController(controllerExpert);
  }

  void addBeginnerController() {
    removeAllControllers();
    experinesArtboard?.artboard.addController(controllerBeginner);
  }

  void addIntermediateController() {
    removeAllControllers();
    experinesArtboard?.artboard.addController(controllerIntermediate);
  }

  void addExpertController() {
    removeAllControllers();
    experinesArtboard?.artboard.addController(controllerExpert);
  }

  @override
  void initState() {
    super.initState();

    controllerBeginner = SimpleAnimation(ExperinceEnum.Beginner.name);
    controllerExpert = SimpleAnimation(ExperinceEnum.Expert.name);
    controllerIntermediate = SimpleAnimation(ExperinceEnum.Intermediate.name);

    rootBundle.load('assets/mixing_animations.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerBeginner);

      setState(() {
        experinesArtboard = artboard;
      });
    });
  }

  Color primColor = Color(0xFFEA026B);

  bool Be_isSelected = true;
  bool In_isSelected = false;
  bool Ex_isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF390A3B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Expertise'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 600,
              width: 400,
              // color: Colors.amber,
              child: experinesArtboard == null
                  ? const SizedBox.shrink()
                  : Rive(artboard: experinesArtboard!),
            ),
            SizedBox(
              height: 20,
            ),
            /**
 *  Beginner,
  Intermediate,
  Expert
 */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: Be_isSelected
                        ? MaterialStateProperty.all(const Color(0xFFEA026B))
                        : MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                    shape: Be_isSelected
                        ? MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ))
                        : MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: primColor),
                            ),
                          ),
                  ),
                  onPressed: () {
                    addBeginnerController();
                    setState(() {});
                    Be_isSelected = true;
                    In_isSelected = false;
                    Ex_isSelected = false;
                  },
                  child: Text(
                    'Beginner',
                    style: TextStyle(
                        color: Be_isSelected ? Colors.white : primColor),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: In_isSelected
                        ? MaterialStateProperty.all(const Color(0xFFEA026B))
                        : MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                    shape: In_isSelected
                        ? MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ))
                        : MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: primColor),
                            ),
                          ),
                  ),
                  onPressed: () {
                    addIntermediateController();
                    setState(() {});
                    Be_isSelected = false;
                    In_isSelected = true;
                    Ex_isSelected = false;
                  },
                  child: Text(
                    'Intermediate',
                    style: TextStyle(
                        color: In_isSelected ? Colors.white : primColor),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: Ex_isSelected
                        ? MaterialStateProperty.all(const Color(0xFFEA026B))
                        : MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                    shape: Ex_isSelected
                        ? MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ))
                        : MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: primColor),
                            ),
                          ),
                  ),
                  onPressed: () {
                    setState(() {});
                    addExpertController();
                    Be_isSelected = false;
                    In_isSelected = false;
                    Ex_isSelected = true;
                  },
                  child: Text(
                    'Expert',
                    style: TextStyle(
                        color: Ex_isSelected ? Colors.white : primColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
