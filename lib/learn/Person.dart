class Person {
  void say() {
    print('say');
  }
}


mixin Eat {
  void eat() {
    print('Eat eat');
  }
}
mixin Walk {
  walk() {
    print('walk');
  }
}

mixin Code {
  code() {
    print('key');
    Future.delayed(const Duration(seconds: 2), () {
      // throw AssertionError("error");
      return "hello word";
    })
        .then((value) => {print('success $value')})
        .catchError((e) {
      print('$e');
    });
  }

//先分别定义各个异步任务
  Future<String> login(String userName, String pwd) {
    return Future.value("login");
  }

  Future<String> getUserInfo(String id) {
    return Future.value("getUserInfo");
  }

  Future saveUserInfo(String userInfo) {
    // 保存用户信息
    return Future.value("saveUserInfo");
  }

  task() async {
    try {
      var logResult = await login("userName", "pwd");
      print('$logResult');
      var userInfo = await getUserInfo(logResult);
      print('$userInfo');
      await saveUserInfo(userInfo);
    } catch (e) {
      print('$e');
    }
  }
}

class Dog with Eat, Walk {}

class Man extends Person with Eat, Walk, Code {}

class Perso extends Object{
  String name = "";
  num age = 18;
  String sex = '男';

  String aa = "";
  Perso(this.name, this.age, this.sex);

  List a = [];

  // 打印个人信息（对象方法）
  void printPersonInfo(){
    print("名字=$name  年龄=$age  性别=$sex");
  }

}


class XiaoMing extends Perso {
  XiaoMing(String name, num age, String sex) : super(name, age, sex);

  // XiaoMing(String name, num age, String sex) : super(name, age, sex);
}

void enableFlags({bool? bold = true, bool? hidden}) {

}
void main(){
  enableFlags();
}