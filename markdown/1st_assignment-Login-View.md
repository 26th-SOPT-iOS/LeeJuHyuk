# 1차 과제 - Login View

- 화면을 present한 후에 navigation controller 스택에 있는 모든 뷰를 제거 

```swift
// 내비게이션 스택에서 루트 뷰 컨트롤러를 제외한 모든 뷰 컨트롤러를 팝한다.
// 루트 뷰 컨트롤러가 최상위 뷰 컨트롤러가 된다.
// 삭제된 모든 뷰 컨트롤러의 배열이 반환된다.
self.present(dvc, animated: true, completion: {
    self.navigationController?.popToRootViewController(animated: true)
})

```
