# LeeJuHyuk

이주혁

## 1차 과제 - Navigation Controller 화면전환

---

- Code로 버튼 생성
  - addTarget 으로 이벤트 설정
  - stackView 안에 추가
  - 오토레이아웃 지정

문제점 : navigation controller도 코드로 설정하려 했지만 잘 안됨
AppDelegate에 다음의 코드를 추가하면 된다는데 안된당..

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 생성
        let rootViewController = ViewController(nibName: nil, bundle: nil)

        // 위에서 생성한 뷰 컨트롤러로 내비게이션 컨트롤러를 생성
        let navigationController = UINavigationController(rootViewController: rootViewController)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        // 윈도우의 루트 뷰 컨트롤러로 내비게이션 컨트롤러를 설정

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
    ...
}
```
