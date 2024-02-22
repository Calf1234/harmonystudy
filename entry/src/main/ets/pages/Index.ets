import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import common from '@ohos.app.ability.common';

class PageItem {
  name: string
  page: string

  constructor(name: string, page: string) {
    this.name = name
    this.page = page
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  pages: PageItem[] = [
    new PageItem('通知', "pages/notification/NotificationPage"),
    new PageItem('弹窗', "pages/dialog/DialogPage"),
    new PageItem('List', "pages/comp/ListPage"),
  ]

  goPage() {
    let context = getContext(this) as common.UIAbilityContext
    context.startAbility({})
  }

  build() {
    Row() {
      Column() {
        Button('click me')
          .onClick(() => {
            router.pushUrl({
              url:      "pages/anim/AnimPage"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}


