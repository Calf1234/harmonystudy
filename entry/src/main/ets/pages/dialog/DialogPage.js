/**
 arkui > 全局UI方法 > 弹窗

 1. 警告弹窗
 2. 列表选择弹窗
 3. 自定义弹窗
 4. 日期滑动选择器弹窗
 5. 时间滑动选择器弹窗
 6. 文本滑动选择器弹窗

 */
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
struct HobbyDialog extends   {
    constructor( /**
     arkui > 全局UI方法 > 弹窗
    
     1. 警告弹窗
     2. 列表选择弹窗
     3. 自定义弹窗
     4. 日期滑动选择器弹窗
     5. 时间滑动选择器弹窗
     6. 文本滑动选择器弹窗
    
     *//**
     arkui > 全局UI方法 > 弹窗
    
     1. 警告弹窗
     2. 列表选择弹窗
     3. 自定义弹窗
     4. 日期滑动选择器弹窗
     5. 时间滑动选择器弹窗
     6. 文本滑动选择器弹窗
    
     */
    ) {
        /**
         arkui > 全局UI方法 > 弹窗
        
         1. 警告弹窗
         2. 列表选择弹窗
         3. 自定义弹窗
         4. 日期滑动选择器弹窗
         5. 时间滑动选择器弹窗
         6. 文本滑动选择器弹窗
        
         */
    }
    build() {
    }
}
struct DialogPage extends   {
    constructor(/**
     arkui > 全局UI方法 > 弹窗
    
     1. 警告弹窗
     2. 列表选择弹窗
     3. 自定义弹窗
     4. 日期滑动选择器弹窗
     5. 时间滑动选择器弹窗
     6. 文本滑动选择器弹窗
    
     */ /**
 arkui > 全局UI方法 > 弹窗

 1. 警告弹窗
 2. 列表选择弹窗
 3. 自定义弹窗
 4. 日期滑动选择器弹窗
 5. 时间滑动选择器弹窗
 6. 文本滑动选择器弹窗

 */
    /**
     arkui > 全局UI方法 > 弹窗
    
     1. 警告弹窗
     2. 列表选择弹窗
     3. 自定义弹窗
     4. 日期滑动选择器弹窗
     5. 时间滑动选择器弹窗
     6. 文本滑动选择器弹窗
    
     */
    ) {
        /**
         arkui > 全局UI方法 > 弹窗
        
         1. 警告弹窗
         2. 列表选择弹窗
         3. 自定义弹窗
         4. 日期滑动选择器弹窗
         5. 时间滑动选择器弹窗
         6. 文本滑动选择器弹窗
        
         */
    }
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
                    promptAction.showToast({ message: '取消推出啦' });
                }
            },
            secondaryButton: {
                value: '推出',
                fontColor: Color.Red,
                action: () => {
                    promptAction.showToast({ message: '推出啦' });
                    router.back();
                }
            }
        });
    }
    datePickerDialog() {
        DatePickerDialog.show({
            start: new Date('1970-1-1'),
            end: new Date(),
            selected: new Date(this.birth),
            lunar: false,
            onAccept: (value) => {
                let birthValue = `${value.year}-${value.month + 1}-${value.day}`;
                this.birth = birthValue;
            }
        });
    }
    textPickerDialog() {
        TextPickerDialog.show({
            range: this.sexs,
            value: this.sex,
            onAccept: (value) => {
                this.sex = value.value;
            }
        });
    }
    build() {
        .width('100%')
            .height('100%')
            .backgroundColor('#10000000');
    }
}
struct TextCompWidget extends   {
    constructor(/**
     arkui > 全局UI方法 > 弹窗
    
     1. 警告弹窗
     2. 列表选择弹窗
     3. 自定义弹窗
     4. 日期滑动选择器弹窗
     5. 时间滑动选择器弹窗
     6. 文本滑动选择器弹窗
    
     */ /**
 arkui > 全局UI方法 > 弹窗

 1. 警告弹窗
 2. 列表选择弹窗
 3. 自定义弹窗
 4. 日期滑动选择器弹窗
 5. 时间滑动选择器弹窗
 6. 文本滑动选择器弹窗

 */
    /**
     arkui > 全局UI方法 > 弹窗
    
     1. 警告弹窗
     2. 列表选择弹窗
     3. 自定义弹窗
     4. 日期滑动选择器弹窗
     5. 时间滑动选择器弹窗
     6. 文本滑动选择器弹窗
    
     */
    ) {
        /**
         arkui > 全局UI方法 > 弹窗
        
         1. 警告弹窗
         2. 列表选择弹窗
         3. 自定义弹窗
         4. 日期滑动选择器弹窗
         5. 时间滑动选择器弹窗
         6. 文本滑动选择器弹窗
        
         */
    }
    build() {
            .height('48vp')
            .width('93%')
            .margin({
            top: '24vp'
        })
            .onClick(this.onClickListener)
            .borderRadius('24vp')
            .backgroundColor(Color.White);
    }
}
struct TextInputWidgt extends   {
    constructor(/**
     arkui > 全局UI方法 > 弹窗
    
     1. 警告弹窗
     2. 列表选择弹窗
     3. 自定义弹窗
     4. 日期滑动选择器弹窗
     5. 时间滑动选择器弹窗
     6. 文本滑动选择器弹窗
    
     */ /**
 arkui > 全局UI方法 > 弹窗

 1. 警告弹窗
 2. 列表选择弹窗
 3. 自定义弹窗
 4. 日期滑动选择器弹窗
 5. 时间滑动选择器弹窗
 6. 文本滑动选择器弹窗

 */
    /**
     arkui > 全局UI方法 > 弹窗
    
     1. 警告弹窗
     2. 列表选择弹窗
     3. 自定义弹窗
     4. 日期滑动选择器弹窗
     5. 时间滑动选择器弹窗
     6. 文本滑动选择器弹窗
    
     */
    ) {
        /**
         arkui > 全局UI方法 > 弹窗
        
         1. 警告弹窗
         2. 列表选择弹窗
         3. 自定义弹窗
         4. 日期滑动选择器弹窗
         5. 时间滑动选择器弹窗
         6. 文本滑动选择器弹窗
        
         */
    }
    build() {
            .height('36vp')
            .width('93%')
            .margin({
            top: '16vp'
        })
            .borderRadius('24vp')
            .backgroundColor(Color.White);
    }
}
//# sourceMappingURL=DialogPage.js.map