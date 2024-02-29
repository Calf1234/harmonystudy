import router from '@ohos.router'

@Component
export struct navigationBar {
  @State title: string = ''
  @State isBack: boolean = true
  @State isMenu: boolean = true
  @State isSearch: boolean = true
  @State isMore: boolean = false
  @State isClose: boolean = false
  @State bgColor: Resource = $r('app.color.grey0')

  build() {
    Row() {
      Column() {
        if (this.isBack == true) {
          Image($r('app.media.ic_back'))
            .width(26)
            .height(26)
            .onClick(() => {
              router.back()
            })
        }

        if (this.isClose == true) {
          Image($r('app.media.ic_close'))
            .width(26)
            .height(26)
            .onClick(() => {
              router.back()
            })
        }
      }
      .width(50)

      Column() {
        Text(this.title)
          .fontSize(18)
          .maxLines(1)
            // 文本超长时显示不下的文本用省略号代替。
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .layoutWeight(1)
      .padding({ left: 20 })

      Column() {
        if (this.isSearch == true) {
          Image($r('app.media.ic_search'))
            .width(26)
            .height(26)
        }
      }
      .width(30)

      Column() {
        if (this.isMenu == true) {
          Image($r('app.media.ic_add'))
            .width(26)
            .height(26)
        }

        if (this.isMore == true) {
          Image($r('app.media.ic_more'))
            .width(26)
            .height(26)
        }
      }
      .width(50)
    }
    .width('100%')
    .height(60)
    .backgroundColor(this.bgColor)
  }
}