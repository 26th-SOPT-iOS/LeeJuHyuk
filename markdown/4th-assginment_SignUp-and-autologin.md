# 4차 과제 - 회원가입 및 자동 로그인

## 목차

- 회원가입
- 자동로그인

## 1. 회원가입

회원가입 결과를 받아오는 모댈

```swift
struct ResponseData: Codable {
    var status: Int
    var success: Bool
    var message: String

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}
```

따로 결과값없이 성공 유무만 받아오는 데이터들도 많기 때문에 이러한 데이터에 함께 쓸 ResponseData 라는 타입을 정의해 주었다.

이러한 인증과 관련된 것에 차리하는 AuthService라는 class를 생성했고, 여기에 로그인과 회원가입 메소드를 만들어 주었다.

회원가입 메소드는 다음과 같이 구현하였다.

```swift
Alamofire.request(APIConstants.signupURL,
                    method: .post,
                    parameters: body,
                    encoding: JSONEncoding.default,
                    headers: header)
    .responseData { response in
        switch response.result {
        case .success:
            guard let statusCode = response.response?.statusCode else {
                return
            }
            guard let value = response.result.value else {
                return
            }
            completion(self.hasSigneUpCorrectly(status: statusCode, data: value))
        case .failure:
            completion(.networkFail)
        }
}
```

status code와 데이터 값을 `hasSignedUpCorrectly` 라는 함수에 인자로 전달하여 NetworkResult 를 return 하도록 하였다.

hasSignedUpCorrectly 함수

```swift
    private func hasSigneUpCorrectly(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(ResponseData.self, from: data)

            switch status { // status code로 분기처리
            case 200:
                if result.success {
                    return .success(result.message)
                }
                else {
                    return .requestErr(result.message)
                }
            case 400:
                return .pathErr
            case 500:
                return .serverErr
            default:
                return .pathErr
            }
        }
        catch{
            return .pathErr
        }
    }
```

> -문제점-  
> 서버와의 통신 결과를 통해 받아오는 statusCode는 완전 raw한 데이터 이다.
>
> 이 코드는 decode하는 데이터와는 별개로 통신 결과에 따라 값을 주기 때문에 회원가입 성공 유무를 구분해 주진 않는다.
>
> 따라서 이러한 구분을 위해 statusCode가 200인 case 안에서 decode한 데이터의 success값으로 회원가입 성공 유무를 따져서 다른 결과값을 리턴하도록 하였다.
>
> 이런 status 값을 '아예 처음부터 statusCode에 줄지, 아니면 디코드한 데이터 안에서 구분할지'의 차이도 서버 개발자마다 다를 수 있다. 따라서 이러한 것을 사전에 잘 이야기하는 것이 중요하다 !

회원가입 메소드 호출부분

```swift
AuthService
    .shared
    .signUp(id: id,
            pw: pw,
            name: name,
            email: email,
            phone: phoneNumber) { result in

                switch result {
                case .success(_):
                    self.navigationController?.popViewController(animated: true)
                case .requestErr(let msg):
                    let alert = UIAlertController(title: "회원가입 실패",
                                                    message: msg as? String ?? "",
                                                    preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인",
                                                style: .default)

                    alert.addAction(action)
                    self.present(alert, animated: true)
                case .pathErr:
                    print("path err")
                case .serverErr:
                    print("server err")
                case .networkFail:
                    print("network err")
                }
}
```

이제 결과에 따라 각 동작을 구현하면 된다.

성공했을 경우, 이 회원가입 화면은 네비게이션에 push된 화면이기때문에 다시 로그인 화면으로 돌아가기 위해선 `self.navigationController.popViewcontroller`를 실행시켜주면 된다.  
실패했을 경우, 그러니까 이미 존재하는 아이디인 경우에는 이제 alert로 서버에서 보낸 메세지를 띄워주도록 하였다.

<p align="center">
    <img src="https://media.giphy.com/media/hWq4niYaHVbWvmhvU6/giphy.gif"/>
</p>

## 2. 자동로그인

자동로그인의 경우 UserDefauts라는 기본적인 유틸리티를 사용하면 편하다.  
이 안에는 스위프트의 기본적인 타입들을 key값과 함께 저장할 수 있다. 그리고 여기에 저장된 데이터는 앱이 꺼져도 앱안에 데이터베이스 처럼 저장이 되어있기 때문에 사용자의 간단한 데이터들(token같은 것)을 저장해 주기 편하다.

따라서 로그인 성공 시 자동로그인 여부 체그가 되어있는 경우 지정한 키 값을 true로 설정하도록 하였다.

```swift
// 임의로 생성한 UserDefault의 Key값을 저장해두는 공간이다.
struct UserDefaultKeys {
    static let autoLoginCheck = "isAutoLoginChecked"
    static let token = "token"
}

case .success(let token):
    if self.autoLoginCheckedButton.isSelected {
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.autoLoginCheck)
    }

    UserDefaults.standard.set(token, forKey: UserDefaultKeys.token)
    if let dvc = self.storyboard?.instantiateViewController(identifier: "TabBarC") as? TabBarC {
        self.present(dvc, animated: true)
    }
// 버튼을 누를때마다 상태를 바꿔주었다.
@IBAction func touchUpAutoLoginCheckedButton(_ sender: UIButton){
    sender.isSelected = !sender.isSelected

    if sender.isSelected {
        sender.tintColor = UIColor.systemBlue
    }
    else {
        sender.tintColor = UIColor.darkGray
    }
}
```

이제 화면이 꺼지고 다시 실행이 되었을 때 자동 로그인 여부를 보고 다음 화면으로 넘어갈지 말지를 설정해 주었다.

```swift
func autoLoginCheck(){
    if UserDefaults.standard.bool(forKey: UserDefaultKeys.autoLoginCheck) {
        print("auto login checked")
        if let dvc = self.storyboard?.instantiateViewController(identifier: "TabBarC") as? TabBarC {
            self.present(dvc, animated: true, completion: nil)
        }
    }
}
```

> 아예 시작화면을 로그인화면이 아닌 홈화면으로 실행 시킬수도 있지만, 로그아웃을 하면 다시 로그인 화면으로 돌아가야 하기 때문에 LoginVC에서 viewDidLoad에서 이러한 작업을 하였다.
>
> 만약 이런 화면이 아니라 앱을 완전 처음 실행시켰을 때 튜토리얼 같은 부분에 관한 처리를 해주기 위해 시작화면을 바꿔줄 수 있을 것이다.

로그아웃은 이제 아주 간단하다. 홈 화면에서 로그아웃 버튼을 누르면 자동로그인 여부를 저장했던 UserDefaults 에 false를 주고 해당 뷰를 dismiss시키면 끝이다.

```swift
@IBAction func touchUpLogoutButton(_ sender: Any) {
    UserDefaults.standard.set(false, forKey: UserDefaultKeys.autoLoginCheck)
    self.dismiss(animated: true, completion: nil)
}
```

<p align="center">
    <img src="https://media.giphy.com/media/gLuysrRVu36RKfoJZg/giphy.gif"/>
    <img src="https://media.giphy.com/media/J0JDzmFuSuZbvyM09Y/giphy.gif"/>
</p>
