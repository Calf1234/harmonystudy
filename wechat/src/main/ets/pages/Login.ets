import { navigationBar } from '../component/navigationBar'
import router from '@ohos.router'

@Extend(Text) function text_style() {
  .width('25%')
  .fontSize(15)
  .maxLines(1)
}

@Extend(TextInput) function input_style() {
  .width('75%')
  .fontSize(15)
  .placeholderColor($r('app.color.grey3'))
  .caretColor($r('app.color.green0')) // 光标颜色
  .backgroundColor(Color.White)
}

@Extend(Divider) function divider_style() {
  .width('90%')
  .color($r('app.color.grey2'))
  .strokeWidth(0.8)
}

@Extend(Text) function link_text_style(fontSize: number) {
  .fontSize(fontSize)
  .fontColor($r('app.color.blue_link'))
  .maxLines(1)
}

@Entry
@Component
struct Login {
  @State message: string = 'Hello World'

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Start,
      //
      // Flex主轴方向均匀分配弹性元素，相邻元素之间距离相同。第一个元素与行首对齐，最后一个元素与行尾对齐。
      justifyContent: FlexAlign.SpaceBetween
    }) {
      navigationBar({
        isBack: false,
        isClose: true,
        isMenu: false,
        isSearch: false,
        isMore: false
      })

      Column() {
        Text('手机号登录')
          .textAlign(TextAlign.Center)
          .fontSize(22)
      }
      .width('100%')
      .height(90)
      .padding({ top: 55 })

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        Row() {
          Text('国家/地区')
            .text_style()

          TextInput({ placeholder: '中国大陆（+86）' })
            .input_style()
        }
        .width('90%')
        .height(60)
        .margin({ top: 4, bottom: 4 })

        Divider().divider_style()

        Row() {
          Text('手机号')
            .text_style()

          TextInput({ placeholder: '请填写手机号' })
            .input_style()
            .type(InputType.Number)
        }
        .width('90%')
        .height(60)
        .margin({ bottom: 4 })

        Divider().divider_style()

        Row() {
          Text('用微信号/QQ号/邮箱登录')
            .link_text_style(15)
        }
        .width('90%')
        .height(50)
        .margin({ left: 2, top: 10 })

      }.width('100%')
      .height(400)
      .padding({ top: 20 })

      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.End, alignItems: ItemAlign.Center }) {
        Text("上述手机号仅用于登陆验证")
          .fontColor($r('app.color.grey3'))
          .maxLines(1)
          .fontSize(15)

        Button("同意并继续", { type: ButtonType.Normal })
          .width(170)
          .height(50)
          .backgroundColor($r("app.color.green0")) // 使用微信的独有绿色
          .fontSize(18)
          .fontColor($r("app.color.white")) // 白色文字
          .borderRadius(8) // 圆角效果
          .margin({ top: 30 })
          .onClick(() => {
            router.pushUrl({ url: 'pages/Main' }) // 跳转到微信主页
          })

        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.End, justifyContent: FlexAlign.Center }) {
          Text("找回密码")
            .link_text_style(12)
            .margin({ right: 5 })
          Text('|')
            .link_text_style(12)
            .margin({ right: 5 })
          Text("紧急冻结")
            .link_text_style(12)
            .margin({ right: 5 })
          Text('|')
            .link_text_style(12)
            .margin({ right: 5 })
          Text("安全中心")
            .link_text_style(12)
        }.width('100%')
        .padding({ bottom: 30, top: 60 })
      }.width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.grey0'))
  }
}