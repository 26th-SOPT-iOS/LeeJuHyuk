# 1차 과제 - Navigation Controller 화면전환

- Code로 버튼 생성

```swift
let purpleScreenButton: UIButton = UIButton(type: .system)

purpleScreenButton.setTitle("Purple Screen", for: .normal)
purpleScreenButton.setTitleColor(.black, for: .normal)

```

- addTarget 으로 이벤트 설정

```swift
purpleScreenButton.addTarget(self,action: #selector(self.touchUpButton(_:)),for: .touchUpInside)

@objc func touchUpButton(_ sender: UIButton){
    var identifier: String = ""
    switch sender.titleLabel?.text {
    case "Purple Screen":
        identifier = "purpleVC"
    case "Pink Screen":
        identifier = "pinkVC"
    default:
        identifier = ""
    }

    guard let dvc = self.storyboard?.instantiateViewController(identifier: identifier) else {
        return
    }
    self.navigationController?.pushViewController(dvc, animated: true)
}
```

objc 함수를 선언할때 parameter는

```swift
func doSomething(sender: Any)
func doSomething(sender: Any, forEvent event: UIEvent)
```

다음과 같이 선언해야 한다고 한다.

- stackView 안에 추가

```swift
let stackView: UIStackView = UIStackView(arrangedSubviews: [purpleScreenButton, pinkScreenButton])
stackView.axis = .vertical
stackView.spacing = 10
stackView.distribution = .fillEqually
stackView.translatesAutoresizingMaskIntoConstraints = false

self.view.addSubview(stackView)
```

- 오토레이아웃 지정

```swift
let constraintX: NSLayoutConstraint = NSLayoutConstraint(item: stackView,
                                                         attribute: .centerX,
                                                         relatedBy: .equal,
                                                         toItem: self.view,
                                                         attribute: .centerX,
                                                         multiplier: 1.0,
                                                         constant: 0)
let constraintY: NSLayoutConstraint = NSLayoutConstraint(item: stackView,
                                                         attribute: .centerY,
                                                         relatedBy: .equal,
                                                         toItem: self.view,
                                                         attribute: .centerY,
                                                         multiplier: 1.0,
                                                         constant: 0)
constraintX.isActive = true
constraintY.isActive = true
```

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
