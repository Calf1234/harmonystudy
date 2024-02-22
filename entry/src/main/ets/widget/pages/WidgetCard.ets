@Entry
@Component
struct WidgetCard {
  /*
   * The title.
   */
  readonly TITLE: string = 'Hello World';

  /*
   * The action type.
   */
  readonly ACTION_TYPE: string = 'router';

  /*
   * The ability name.
   */
  readonly ABILITY_NAME: string = 'EntryAbility';

  /*
   * The message.
   */
  readonly MESSAGE: string = 'add detail';

  /*
   * The with percentage setting.
   */
  readonly FULL_WIDTH_PERCENT: string = '100%';

  /*
   * The height percentage setting.
   */
  readonly FULL_HEIGHT_PERCENT: string = '100%';
  data: Array<{
    id: number,
    name: string,
    path: string,
    color: Color
  }> = [
    { id: 0, name: '主页面', path: 'pages/card/Page11', color: Color.Orange },
    { id: 1, name: '详情页面', path: 'pages/card/Page22', color: Color.Yellow },
    { id: 2, name: '个人页面', path: 'pages/card/Page33', color: Color.Pink }
  ]

  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.data, (item) => {
            ListItem() {
              Text(item.name)
                .width('100%')
                .height(30)
                .borderRadius(12)
                .backgroundColor(item.color)
                .textAlign(TextAlign.Center)
            }.onClick(() => {
              postCardAction(this, {
                "action": this.ACTION_TYPE,
                "abilityName": this.ABILITY_NAME,
                "params": {
                  "targetPath": item.path
                }
              });
            })
          }, (item) => JSON.stringify(item))
        }
        .padding(10)
      }
      .width(this.FULL_WIDTH_PERCENT)
    }
    .height(this.FULL_HEIGHT_PERCENT)
  }
}