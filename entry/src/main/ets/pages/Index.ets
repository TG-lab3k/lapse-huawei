import reminderAgentManager from '@ohos.reminderAgentManager';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Row() {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)

          Button('定时提醒').onClick((event?: ClickEvent) => {
            console.log("点击定时提醒");
            //https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-reminderagentmanager-0000001477981405-V3
            let timer = {
              reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
              hour: 17,
              minute: 10
            }

            try {
              reminderAgentManager.publishReminder(timer, (err, reminderId) => {
                if (err) {
                  console.log("callback err code:" + err.code + " message:" + err.message);
                } else {
                  console.log("callback, reminderId = " + reminderId);
                }
              });
            } catch (error) {
              console.log("publishReminder code:" + error.code + " message:" + error.message);
            }
            ;
          })
        }
      }.width('100%')
    }
    .height('100%')
  }
}