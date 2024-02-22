@Component
struct MyListItem {
  @Prop item: number
  index: number = 0

  aboutToAppear() {
    console.log(`item: ${this.index}-${this.item}, aboutToAppear`)
  }

  aboutToDisappear() {
    console.log(`item: ${this.index}-${this.item}, aboutToDisappear`)
  }

  build() {
    Row() {
      Text(`item: ${this.item}`)
        .fontColor(Color.Black)
    }
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('24vp')
  }
}

@Entry
@Component
struct ListPage {
  @State arr: number[] = [1, 2, 3]

  build() {
    Column({ space: 12 }) {
      Button('arr[0]++')
        .onClick(() => {
          this.arr[0] += 1
        })

      List() {
        ForEach(this.arr, (item) => {
          ListItem() {
            MyListItem({
              item: item,
              index: item
            })
          }
          // }, (item, index) => `${index}:` + JSON.stringify(item))
          // }, (item, index) => `${index}`)
        })
      }

      Button('arr reset')
        .onClick(() => {
          this.arr = [1, 2, 3]
        })

      Button('arr insert a[1]=5')
        .onClick(() => {
          // index 作为 key键值，出现 渲染结果非预期的情况，
          // 使用默认key，渲染性能降低：下标1开始 组件都新建
          this.arr.splice(1, 0, 5)
        })
    }
    .width('100%')
    .height('100%')
  }
}