import 'package:flutter/material.dart';
import 'package:national_id_extractor_app/id_extractor.dart';

class NationalIDExtractorScreen extends StatefulWidget {
  const NationalIDExtractorScreen({Key? key}) : super(key: key);

  @override
  _NationalIDExtractorScreenState createState() =>
      _NationalIDExtractorScreenState();
}

class _NationalIDExtractorScreenState extends State<NationalIDExtractorScreen> {
  final IDExtractor extractor = IDExtractor();
  final TextEditingController controller = TextEditingController();
  final int maxLength = 14;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('National ID Extractor'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 40),
          children: [
            Card(
              color: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  ListTile(
                    enabled: extractor.getDate() != null,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: const Icon(Icons.date_range_outlined),
                    title: const Text('DOB'),
                    subtitle: extractor.getDate() != null
                        ? Text(extractor.getDate()!)
                        : null,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    enabled: extractor.getGov() != null,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text('Gov'),
                    subtitle: extractor.getGov() != null
                        ? Text(extractor.getGov()!)
                        : null,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    enabled: extractor.getGender() != null,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: const Icon(Icons.category_outlined),
                    title: const Text('Gender'),
                    subtitle: extractor.getGender() != null
                        ? Text(extractor.getGender()!)
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Expanded(
                    child: Divider(
                  thickness: 1,
                  endIndent: 15,
                )),
                Text(
                  'ID',
                  style: TextStyle(color: Colors.grey),
                ),
                Expanded(
                    child: Divider(
                  thickness: 1,
                  indent: 15,
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: TextFormField(
                maxLength: maxLength,
                controller: controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                validator: (id) => extractor.validator(id),
                onChanged: (s) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.perm_identity),
                  suffixIcon: controller.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              controller.clear();
                              extractor.clearAll();
                            });
                          },
                          icon: const Icon(Icons.clear),
                        ),
                  label: const Text('Enter national id'),
                  border: OutlineInputBorder(
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).appBarTheme.backgroundColor!,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).appBarTheme.backgroundColor,
                elevation: 1.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
              ),
              onPressed: controller.text.length < 14
                  ? null
                  : () {
                      setState(() {
                        extractor.extractInfo(controller.text);
                      });
                    },
              child: const Text('Extract'),
            ),
          ],
        ),
      ),
    );
  }
}
