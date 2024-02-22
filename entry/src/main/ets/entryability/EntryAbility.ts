import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

let selectPage: string = 'pages/Index'
let currentWindowState: window.WindowStage = null
export default class EntryAbility extends UIAbility {

  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    if (want.parameters.params !== undefined) {
      let param = JSON.parse(want.parameters.params)
      console.log(`EntryAbility#onCreate, ${param}`)
      selectPage = param?.targetPath
    }
  }

  onNewWant(want, launchParams) {
    if (want.parameters.params !== undefined) {
      let param = JSON.parse(want.parameters.params)
      console.log(`EntryAbility#onNewWant, ${param}`)
      selectPage = param?.targetPath
    }

    if (currentWindowState !== null) {
      this.onWindowStageCreate(currentWindowState)
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    if (currentWindowState === null) {
      currentWindowState = windowStage
    }

    windowStage.loadContent(selectPage, (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
