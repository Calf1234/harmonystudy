@Component
struct Item {
  private date: Date
  @State value: Data1 = new Data1(1, '1')

  aboutToAppear() {
    this.date = new Date()
    console.log(`Item aboutToAppear, ${this.date}, ${JSON.stringify(this.value)}}`)
  }

  aboutToDisappear() {
    console.log(`Item aboutToDisappear, ${this.date}, ${JSON.stringify(this.value)}}`)
  }

  build() {
    Row() {
      Text(`item: ${this.value}`)
    }.width('100%')
    .height('44vp')
  }
}

class Data1 {
  id: number
  name: string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }
}

@Component
struct Child {
  @Link items: Data1[]
  private date: Date

  aboutToAppear() {
    this.date = new Date()
    console.log(`aboutToAppear, ${this.date}, ${JSON.stringify(this.items)}}`)
  }

  aboutToDisappear() {
    console.log(`aboutToDisappear, ${this.date}, ${JSON.stringify(this.items)}}`)
  }

  build() {
    Column() {
      List({ space: '12vp' }) {
        ForEach(this.items, (item: Data1, index) => {
          ListItem() {
            Item({ value: item })
          }
        }, (item) => JSON.stringify(item))
      }
    }
    .width('100%')
    .height('100%')
  }
}

@Entry
@Component
struct LinkPage {
  data11:Data1 = new Data1(1, '1')
  data22:Data1 = new Data1(2, '2')
  data33:Data1 = new Data1(3, '3')
  @State arr: Data1[] = [this.data11, this.data22, this.data33]

  build() {
    Column({ space: 12 }) {
      Button('change arr=[2,3,4]')
        .onClick(() => {
          this.arr.push(new Data1(4, '4'))
        })
      Child({ items: $arr })
    }
    .width('100%')
    .height('100%')
  }
}