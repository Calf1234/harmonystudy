/**
 * Emitter 主线程之间的 事件同步，以及 主线程和工作线程之间的 事件同步
 *
 * Emitter主要提供线程间发送和处理事件的能力，
 * 包括对持续订阅事件或单次订阅事件的处理、取消订阅事件、发送事件到事件队列等。
 */


import emitter from "@ohos.events.emitter";


@Component
export struct MyListItem {
  @State name: string = ''
  @State eventStr: string = ''
  event: emitter.InnerEvent = {
    eventId: 1
  }
  callback = (eventData: emitter.EventData) => {
    this.eventStr = JSON.stringify(eventData)
  }

  aboutToAppear() {
    emitter.on(this.event, this.callback)
  }

  build() {
    Row() {
      Text(this.name).margin({ left: '12vp' })

      Text(`event事件：${this.eventStr}`)
    }
    .height('44vp')
    .width('80%')
  }
}