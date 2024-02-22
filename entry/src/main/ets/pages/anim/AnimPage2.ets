import router from '@ohos.router'

@Entry
@Component
struct AnimPage2 {
  @State scale1: number = 1
  @State opacity1: number = 1

  build() {
    Column() {
      Image($r('app.media.page2'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)
        .onClick(() => {
          router.back()
        })
    }.scale({ x: this.scale1 }).opacity(this.opacity1)
  }

  pageTransition() {
    PageTransitionEnter({ duration: 2000,curve: Curve.Linear })
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