import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Image($r('app.media.splash'))
        .objectFit(ImageFit.Cover)
        .width('100%')
        .height('100%')

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Button('登录', { type: ButtonType.Normal })
          .width(120)
          .height(50)
          .backgroundColor($r('app.color.green0'))
          .fontColor(Color.White)
          .fontSize(10)
          .borderRadius(10)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Login'
            })
          })

        Button('注册', { type: ButtonType.Normal })
          .width(120)
          .height(50)
          .backgroundColor(Color.White)
          .fontColor($r('app.color.green0'))
          .fontSize(10)
          .borderRadius(10)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Register'
            })
          })
      }
      .width('100%')
      .height(90)
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }
}