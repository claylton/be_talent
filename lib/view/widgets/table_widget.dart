import 'package:be_talent/model/employee_model.dart';
import 'package:be_talent/view/resources/colors.dart';
import 'package:be_talent/view/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

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

class _Item extends StatelessWidget {
  final EmployeeModel employee;
  const _Item({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.gray10, width: 1.0),
          right: BorderSide(color: AppColors.gray10, width: 1.0),
          bottom: BorderSide(color: AppColors.gray10, width: 1.0),
          top: BorderSide.none,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  AvatarWidget(url: employee.image),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  employee.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 32,
                  color: AppColors.bluePrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
