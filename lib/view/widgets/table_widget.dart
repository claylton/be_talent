import 'package:be_talent/extensions/string_extension.dart';
import 'package:be_talent/model/employee_model.dart';
import 'package:be_talent/view/resources/colors.dart';
import 'package:be_talent/view/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TableWidget extends StatelessWidget {
  final List<EmployeeModel> employees;
  const TableWidget({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const _Header(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: employees.length,
            itemBuilder: (context, index) => _Item(employee: employees[index]),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.blue10,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border.all(
          color: AppColors.gray10, // Cor da borda
          width: 1.0, // Espessura da borda
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 100,
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Foto",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const Expanded(
              child: Row(
            children: [
              Text(
                "Nome",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final EmployeeModel employee;
  const _Item({required this.employee});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  late bool isOpen;

  @override
  void initState() {
    super.initState();
    isOpen = false;
  }

  void onOpen() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.gray10, width: 1.0),
          right: BorderSide(color: AppColors.gray10, width: 1.0),
          bottom: BorderSide(color: AppColors.gray10, width: 1.0),
          top: BorderSide.none,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        AvatarWidget(url: widget.employee.image),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        widget.employee.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: onOpen,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Icon(
                          isOpen
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          size: 32,
                          color: AppColors.bluePrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isOpen ? null : 0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 31),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ItemExpandedItem(
                  leftText: "Cargo",
                  rightText: widget.employee.job,
                ),
                const SizedBox(height: 15),
                _ItemExpandedItem(
                  leftText: "Data de admissão",
                  rightText: DateFormat('dd/MM/yyyy')
                      .format(widget.employee.admissionDate),
                ),
                const SizedBox(height: 15),
                _ItemExpandedItem(
                  leftText: "Telefone",
                  rightText: widget.employee.phone.toPhoneFormat(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ItemExpandedItem extends StatelessWidget {
  final String leftText;
  final String rightText;
  const _ItemExpandedItem({required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            Text(
              rightText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 1), // Width of the line
          painter: DottedLinePainter(),
        )
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.gray10
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double dashWidth = 5, dashSpace = 5;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
