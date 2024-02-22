import notificationManager from '@ohos.notificationManager';
import Notification from '@system.notification';
import image from '@ohos.multimedia.image';
import promptAction from '@ohos.promptAction';

/**
 arkts api > 公共事件与通知 > notificationManager

 @ohos.notification (Notification模块)
 本模块提供通知管理的能力，包括发布、取消发布通知，创建、获取、移除通知通道，
 订阅、取消订阅通知，获取通知的使能状态、角标使能状态，获取通知的相关信息等。

 @ohos.notificationManager (NotificationManager模块)
 本模块提供通知管理的能力，包括发布、取消发布通知，创建、获取、移除通知通道，
 获取通知的使能状态、角标使能状态，获取通知的相关信息等。

 @ohos.multimedia.image (图片处理)
 本模块提供图片处理效果，包括通过属性创建PixelMap、
 读取图像像素数据、读取区域内的图片数据等。
 */

let NotificationID = 0;

@Entry
@Component
struct NotificationPage {
  // 通知请求的 对象
  publishNotif() {
    let notif: notificationManager.NotificationRequest = {
      id: ++NotificationID,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '测试通知的标题',
          text: `测试通知的内容 ${NotificationID}`,
          additionalText: '测试通知的附加内容'
        }
      }
    }
    notificationManager.publish(notif).then(() => {
      console.log('notification publish success')
    }).catch((err) => {
      console.log(`notification publish failed, ${JSON.stringify(err)}}`)
    })
  }

  async publishNotif2() {
    let resourceManager = getContext(this).resourceManager
    let imageArray = await resourceManager.getMediaContent($r('app.media.bg').id)
    let imageSource = image.createImageSource(imageArray.buffer)
    let imagePixelMap = await imageSource.createPixelMap()

    let notif: notificationManager.NotificationRequest = {
      id: ++NotificationID,
      content: {
        // 图文通知
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: '图文通知的标题',
          text: `图文通知的内容 ${NotificationID}`,
          picture: imagePixelMap,
          briefText: '通知的概要内容',
          expandedTitle: '通知的展开内容'
        }
      }
    }
    notificationManager.publish(notif).then(() => {
      console.log('图文notification publish success')
    }).catch((err) => {
      console.log(`图文notification publish failed, ${JSON.stringify(err)}}`)
    })
  }

  publishNotif3() {
    let template = {
      name: 'downloadTemplate',
      data: {
        progressValue: 67, // 当前的进度值
        progressMaxValue: 100 // 最大的进度值
      }
    }


    let notif: notificationManager.NotificationRequest = {
      id: ++NotificationID,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '文件下载 xxx.mp4',
          text: `文件下载中`,
          additionalText: '66%'
        }
      },
      template: template
    }
    notificationManager.publish(notif).then(() => {
      console.log('notification publish success')
    }).catch((err) => {
      console.log(`notification publish failed, ${JSON.stringify(err)}}`)
    })
  }

  /**
   *
   * @param slotType
   UNKNOWN_TYPE           0         未知类型。
   SOCIAL_COMMUNICATION   1         社交类型。   状态栏显示通知、有横幅和提示音
   SERVICE_INFORMATION    2         服务类型。   状态栏显示通知、没有横幅但有提示音
   CONTENT_INFORMATION    3         内容类型。   状态栏显示通知、没有横幅或提示音
   OTHER_TYPES            0xFFFF    其他类型。   状态栏不显示通知、没有横幅或提示音
   */
  publishNotif4(slotType: notificationManager.SlotType) {
    let notif: notificationManager.NotificationRequest = {
      id: ++NotificationID,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '测试通知的标题',
          text: `测试通知的内容 ${NotificationID}`,
          additionalText: '测试通知的附加内容'
        }
      },
      slotType: slotType
    }
    notificationManager.publish(notif).then(() => {
      console.log('notification publish success')
    }).catch((err) => {
      console.log(`notification publish failed, ${JSON.stringify(err)}}`)
    })
  }

  build() {
    Column({ space: 12 }) {
      Button('发送一个简单的通知')
        .onClick(() => {
          this.publishNotif()
        })

      Button('发送一个图文通知')
        .onClick(() => {
          this.publishNotif2()
        })

      Button('发送一个进度条类型通知')
        .onClick(() => {
          this.publishNotif3()
        })

      // 应用 设置通知 打开横幅
      Button('发送一个通知，slotType：SOCIAL_COMMUNICATION')
        .onClick(() => {
          this.publishNotif4(notificationManager.SlotType.SOCIAL_COMMUNICATION)
        })

      Button('发送一个通知，slotType：SERVICE_INFORMATION')
        .onClick(() => {
          this.publishNotif4(notificationManager.SlotType.SERVICE_INFORMATION)
        })

      Button('发送一个通知，slotType：CONTENT_INFORMATION')
        .onClick(() => {
          this.publishNotif4(notificationManager.SlotType.CONTENT_INFORMATION)
        })

      Button('发送一个通知，slotType：OTHER_TYPES')
        .onClick(() => {
          this.publishNotif4(notificationManager.SlotType.OTHER_TYPES)
        })

      Button(`取消单个通知`)
        .onClick(() => {
          notificationManager.cancel(NotificationID).then(() => {
            promptAction.showToast({
              message:`通知 ${NotificationID}, 被移除`
            })
          }).catch((err) => {

          })
        })

      Button('取消应用所有通知')
        .onClick(() => {
          notificationManager.cancelAll().then(() => {
          }).catch((err) => {

          })
        })
    }
    .padding({
      top: 24
    })
    .width('100%')
    .height('100%')
  }
}