import promptAction from '@ohos.promptAction'
import router from '@ohos.router'
/**
 * 动画
 * 1、属性动画
 * 2、显示动画
 * 3、转场动画
 *  3.1、组件内转场
 *  3.2、页面间转场
 *  3.3、共享元素转场
 * 4、路径动画
 */

@Entry
@Component
struct AnimPage {
  @State widthSize: number = 250
  @State heightSize: number = 100
  @State flag: boolean = true
  @State rotateAngle: number = 0
  @State scale1: number = 1
  @State opacity1: number = 1

  build() {
    Column({ space: 12 }) {
      // Column({ space: 6 }) {
      //   Text('属性动画')
      //
      //   Button('change size')
      //     .width(this.widthSize)
      //     .height(this.heightSize)
      //     .onClick(() => {
      //       if (this.flag) {
      //         this.widthSize = 150
      //         this.heightSize = 60
      //       } else {
      //         this.widthSize = 250
      //         this.heightSize = 100
      //       }
      //       this.flag = !this.flag
      //     })
      //     .animation({
      //       duration: 2000,
      //       tempo: 1, // 动画播放速度。数值越大，动画播放速度越快。值为0时，表示不存在动画。
      //       curve: Curve.Linear, // 设置动画曲线。默认曲线为线性。
      //       delay: 0,
      //       iterations: -1, // 设置播放次数。 -1 无限次播放
      //       playMode: PlayMode.Normal, //设置动画播放模式，默认播放完成后重头开始播放。
      //       onFinish: () => {
      //         promptAction.showToast({ message: 'change size, anim over' })
      //       }
      //     })
      //     .animation({ // 就近，上一个animation生效
      //       duration: 5000
      //     })
      // }

      // Column({ space: 6 }) {
      //   Text('显示动画')
      //
      //   Button('change size')
      //     .width(this.widthSize)
      //     .height(this.heightSize)
      //     .onClick(() => {
      //       if (this.flag) {
      //         animateTo({
      //           duration: 2000,
      //           curve: Curve.Linear,
      //           iterations: 1, // 设置播放次数。 -1 无限次播放
      //           playMode: PlayMode.Normal, //设置动画播放模式，默认播放完成后重头开始播放。
      //           onFinish: () => {
      //             promptAction.showToast({ message: `${this.flag}, change size, anim over` })
      //           }
      //         }, () => {
      //           this.widthSize = 150
      //           this.heightSize = 60
      //         })
      //       } else {
      //         animateTo({
      //           duration: 2000,
      //           curve: Curve.Linear,
      //           iterations: 1, // 设置播放次数。 -1 无限次播放
      //           playMode: PlayMode.Normal, //设置动画播放模式，默认播放完成后重头开始播放。
      //           onFinish: () => {
      //             promptAction.showToast({ message: `${this.flag}, change size, anim over` })
      //           }
      //         }, () => {
      //           this.widthSize = 250
      //           this.heightSize = 100
      //         })
      //       }
      //       this.flag = !this.flag
      //     })
      // }
      // .width('100%')

      // Column({ space: 6 }) {
      //   Text('转场动画 - 组件内转场')
      //   /** 转场动画
      //    * 1、页面间转场
      //    * 2、组件内转场
      //    * 3、共享元素转场
      //    */
      //
      //   Button(this.flag ? 'show' : 'hide')
      //     .onClick(() => {
      //       animateTo({
      //         duration: 2000
      //       }, () => {
      //         this.flag = !this.flag
      //       })
      //     })
      //
      //   if (this.flag) {
      //     Image($r('app.media.app_icon'))
      //       .width(200)
      //       .height(200)
      //       .transition({ type: TransitionType.Insert, scale: { x: 0, y: 1 } })
      //       .transition({ type: TransitionType.Delete, rotate: { angle: 180 } })
      //   }
      // }
      // .width('100%')


      Column({ space: 6 }) {
        // Text('转场动画 - 页面间转场')
        /** 转场动画
         * 1、页面间转场
         * 2、组件内转场
         * 3、共享元素转场
         */

        Image($r('app.media.page1'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
          .onClick(() => {
            router.pushUrl({ url: "pages/anim/AnimPage2" })
          })

      }
      .scale({ x: this.scale1 }).opacity(this.opacity1)
    }
  }

  pageTransition() {
    PageTransitionEnter({ duration: 2000, curve: Curve.Linear })
      .onEnter((type: RouteType, progress: number) => {
        this.scale1 = 1
        // 进场过程中会逐帧触发onEnter回调，入参为动效的归一化进度(0% -- 100%)
        this.opacity1 = progress
      })

    PageTransitionExit({ duration: 2000, curve: Curve.Ease })
      .onExit((type: RouteType, progress: number) => {
        this.scale1 = 1 - progress
        this.opacity1 = 1
      })
  }
}