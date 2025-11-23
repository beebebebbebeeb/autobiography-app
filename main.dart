import 'dart:io';

class Profile {
  final String name;
  final int age;
  final String department;
  final List<String> skills;
  final String goal;
  final List<String> experiences;

  Profile({
    required this.name,
    required this.age,
    required this.department,
    required this.skills,
    required this.goal,
    required this.experiences,
  });

  @override
  String toString() {
    final exp = experiences.asMap().entries
      .map((e) => "  ${e.key + 1}. ${e.value}")
      .join("\n");
    final skl = skills.join(", ");
    return """
==== 自傳 APP 簡易版 ====
姓名：$name
年齡：$age
科系：$department

技能：$skl

目標：$goal

經歷：
$exp
=======================
""";
  }
}

void main(List<String> args) {
  final me = Profile(
    name: "徐慶峰",
    age: 20,
    department: "資工三甲",
    skills: ["html", "Java", "Python"],
    goal: "好好畢業",
    experiences: [
      "參與系上專題：即時影像處理",
      "社團幹部：資訊社教學組",
      "暑期實習：後端開發"
    ],
  );

  stdout.write(me.toString());

  if (args.contains("--json")) {
    final data = {
      "name": me.name,
      "age": me.age,
      "department": me.department,
      "skills": me.skills,
      "goal": me.goal,
      "experiences": me.experiences,
    };
    print("\nJSON:");
    print(data);
  }
}