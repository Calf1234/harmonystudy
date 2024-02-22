@CustomDialog
export struct CustomDialogExample {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Text('我是内容').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick(() => {
            this.controller.close()
            this.confirm()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
  }
}

@CustomDialog
export struct HobbyDialog {
  controller: CustomDialogController
  hobbies: string[] = ['学习java', '学习kotlin', '学习arkts']
  hobby: string = ''
  confirm: (value: string) => void

  build() {
    List() {
      ForEach(this.hobbies, (item, index) => {
        ListItem() {
          Row() {
            Text(item)
            Blank()
            Toggle({
              type: ToggleType.Switch,
              isOn: (item === this.hobby ? true : false)
            })
              .onChange((isOn) => {
                if (isOn) {
                  // this.hobby = item
                  this.confirm(item)
                  this.controller.close()
                }
              })

            // Radio({
            //   value: item,
            //   group: 'hobbiesRadio'
            // })
            //   .checked(item === this.hobby)
          }.width('66%')
          .height('44vp')
        }
      }, (item) => JSON.stringify(item))
    }
    .alignListItem(ListItemAlign.Center)
  }
}