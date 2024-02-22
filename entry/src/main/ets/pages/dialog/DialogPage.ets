/**
 arkui > 全局UI方法 > 弹窗

 1. 警告弹窗
 2. 列表选择弹窗
 3. 自定义弹窗
 4. 日期滑动选择器弹窗
 5. 时间滑动选择器弹窗
 6. 文本滑动选择器弹窗

 */
import promptAction from '@ohos.promptAction'
import router from '@ohos.router'
import { CustomDialogExample, HobbyDialog } from './MyHobbyDialog'

@Entry
@Component
struct DialogPage {
  @State birth: string = '1995-10-2'
  sexs: string[] = ['男', '女']
  @State sex: string = '男'
  @State hobby: string = ''

  alertDialog() {
    AlertDialog.show({
      title: '推出确认',
      message: '你是否真的要推出',
      autoCancel: true,
      alignment: DialogAlignment.Bottom,
      offset: { dx: 0, dy: -20 },
      primaryButton: {
        value: '取消',
        action: () => {
          promptAction.showToast({ message: '取消推出啦' })
        }
      },
      secondaryButton: {
        value: '推出',
        fontColor: Color.Red,
        action: () => {
          promptAction.showToast({ message: '推出啦' })
          router.back()
        }
      }
    })
  }

  datePickerDialog() {
    DatePickerDialog.show({
      start: new Date('1970-1-1'),
      end: new Date(),
      selected: new Date(this.birth),
      lunar: false,
      onAccept: (value: DatePickerResult) => {
        let birthValue = `${value.year}-${value.month + 1}-${value.day}`
        this.birth = birthValue
      }
    })
  }

  textPickerDialog() {
    TextPickerDialog.show({
      range: this.sexs,
      value: this.sex,
      onAccept: (value: TextPickerResult) => {
        this.sex = value.value
      }
    })
  }

  dialogController: CustomDialogController = new CustomDialogController({
    builder: HobbyDialog({
      hobby: this.hobby,
      confirm: (value: string) => {
        this.hobby = value
      }
    }),
    alignment: DialogAlignment.Default, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  build() {
    Column() {
      Row() {
        Image($r('app.media.back_left'))
          .width('24vp')
          .height('24vp')
          .margin({ left: '32vp', top: '24vp' })
          .onClick(() => {
            this.alertDialog()
          })
      }.width('100%')

      Image($r('app.media.avtor_default'))
        .width('48vp')
        .height('48vp')
        .margin({ top: '20vp', bottom: '8vp' })

      Text('个人信息简介')

      TextInputWidgt({
        icon: $r('app.media.avtor'),
        title: '昵称'
      })

      TextCompWidget({
        icon: $r('app.media.birth'),
        title: '出生日期',
        content: $birth,
        onClickListener: () => {
          this.datePickerDialog()
        }
      })

      TextCompWidget({
        icon: $r('app.media.sex'),
        title: '性别',
        content: $sex,
        onClickListener: () => {
          this.textPickerDialog()
        }
      })

      TextInputWidgt({
        icon: $r('app.media.sign'),
        title: '个性签名'
      })

      TextCompWidget({
        icon: $r('app.media.hobby'),
        title: '爱好',
        content: $hobby,
        onClickListener: () => {
          // this.hobbyDialog.open()
          this.dialogController.open()
        }
      })

    }.width('100%')
    .height('100%')
    .backgroundColor('#10000000')
  }
}

@Component
struct TextCompWidget {
  icon?: Resource
  title: string
  @Link content: string
  onClickListener: () => void

  build() {
    Row() {
      if (this.icon !== undefined) {
        Image(this.icon)
          .width('24vp')
          .height('24vp')
          .margin({
            left: '16vp',
            right: '2vp'
          })
      }

      Text(this.title)
        .margin({ left: '16vp' })

      Text(this.content)
        .textAlign(TextAlign.End)
        .layoutWeight(1)

      Image($r('app.media.arrow_right_short'))
        .width('24vp')
        .height('24vp')
        .margin({
          left: '12vp',
          right: '12vp'
        })
    }
    .height('48vp')
    .width('93%')
    .margin({
      top: '24vp'
    })
    .onClick(this.onClickListener)
    .borderRadius('24vp')
    .backgroundColor(Color.White)
  }
}


@Component
struct TextInputWidgt {
  icon?: Resource
  title: string

  build() {
    Row() {
      if (this.icon !== undefined) {
        Image(this.icon)
          .width('24vp')
          .height('24vp')
          .margin({
            left: '16vp',
            right: '2vp'
          })
      }
      TextInput({
        placeholder: this.title
      })
        .padding({ left: '16vp' })
        .layoutWeight(1)
        .placeholderColor(Color.Gray)
        .fontColor(Color.Black)
    }
    .height('36vp')
    .width('93%')
    .margin({
      top: '16vp'
    })
    .borderRadius('24vp')
    .backgroundColor(Color.White)
  }
}