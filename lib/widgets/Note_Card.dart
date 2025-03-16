import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 8),
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                'Flutter tips',
                style: TextStyle(color: Colors.black, fontSize: 27),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'There are some tips and trick for flutter mobile development',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 15, bottom: 10),
              child: Text(
                'Mar 16 2025 ',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
