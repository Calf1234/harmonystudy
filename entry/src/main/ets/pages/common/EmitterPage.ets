import { MyListItem } from './MyListItem'
import emitter from "@ohos.events.emitter";


@Entry
@Component
struct EmitterPage {
  @State message: string = 'Hello World'
  arr: string[] = ['kotlin', 'java', 'arks']
  event: emitter.InnerEvent = {
    eventId: 1,
    priority: emitter.EventPriority.LOW
  }
  eventData: emitter.EventData = {
    data: {
      content: 'content',
      id: 1,
      title: 'title'
    }
  }

  build() {
    Row() {
      Column() {
        Button('发送event事件')
          .onClick(() => {
            emitter.emit(this.event, this.eventData)
          })

        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              MyListItem({
                name: item
              })
            }
          })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}