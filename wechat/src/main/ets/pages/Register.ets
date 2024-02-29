import { navigationBar } from '../component/navigationBar'
import router from '@ohos.router'

@Extend(Text) function text_style() { // Text样式的统一样式
  .width('25%')
  .fontSize(15)
  .maxLines(1)
}

@Extend(TextInput) function input_style() { // TextInput输入框 编辑框 样式的统一样式
  .width('75%')
  .fontSize(15)
  .placeholderColor($r('app.color.grey3')) // 灰色
  .caretColor($r('app.color.green0')) // 当设置插入光标的颜色时调用。
  .backgroundColor(Color.White) // 背景是白色
}

@Extend(Divider) function divider_style() { // 下划线的统一样式
  .width('90%')
  .color($r('app.color.grey2'))
  .strokeWidth(0.8)
}

@Entry
@Component
struct Register {
  @State message: string = 'Hello World'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      // 导航栏 - 详见navigationBar.ets
      navigationBar({
        isBack: false,
        isClose: true,
        isMenu: false,
        isSearch: false,
        isMore: false
      })

      Flex({ justifyContent: FlexAlign.Center }) {
        Text($r('app.string.register_title'))
          .textAlign(TextAlign.Center)
          .fontSize(22)
      }.width('100%')
      .height(90)
      .padding({ top: 35 })

      Flex({ justifyContent: FlexAlign.Center }) {
        Image($r('app.media.ic_head'))
          .height(80)
          .width(80)
      }.width('100%').height(110)

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Row() {
          Text('昵称')
            .text_style()
          TextInput({ placeholder: '例如：huanghaihua' })
            .input_style()
        }.width('90%').height(60).margin({ bottom: 4, top: 4 })

        Divider().divider_style()

        Row() {
          Text('国家/地区')
            .text_style()
          TextInput({ placeholder: "中国大陆（+86）" })
            .input_style()
        }.width('90%').height(60).margin({ bottom: 4 })

        Divider().divider_style()

        Row() {
          Text("手机号")
            .text_style()
          TextInput({ placeholder: "请填写手机号" })
            .input_style()
            .type(InputType.Number)
        }.width('90%').height(60).margin({ bottom: 4 })

        Divider().divider_style()

        Row() {
          Text("手机号")
            .text_style()
          TextInput({ placeholder: "请填写手机号" })
            .input_style()
            .type(InputType.Number)
        }.width('90%').height(60).margin({ bottom: 4 })

        Divider().divider_style()
      }.width('100%').height(200)

      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.End, alignItems: ItemAlign.Center }) {
        Text() {
          Span("我已阅读并同意")
            .fontColor($r('app.color.grey3'))
            .fontSize(15)
          Span("《软件许可及服务协议》")
            .fontSize(15)
            .fontColor($r('app.color.blue_link')) // "《软件许可及服务协议》" 的定制颜色
        }

        Text("页面搜集的信息仅用于注册账号")
          .fontColor($r('app.color.grey3'))
          .maxLines(1)
          .fontSize(15)

        Button("同意并继续", { type: ButtonType.Normal })
          .width(170)
          .height(50)
          .backgroundColor($r("app.color.green0"))
          .fontSize(18)
          .fontColor($r("app.color.white"))
          .borderRadius(8)
          .margin({ top: 30, bottom: 100 })
          .onClick(() => {
            router.pushUrl({ url: 'pages/Main' }) // 跳转到微信主页
          })
      }.width('100%').layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.grey0'))
  }
}