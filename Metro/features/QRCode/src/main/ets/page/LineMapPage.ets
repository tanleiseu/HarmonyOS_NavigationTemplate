import { MainEntryVM } from 'commonlib';
import { BaseTitle } from 'componentlib';
import { AtomicServiceWeb, AtomicServiceWebController } from '@kit.ArkUI';


@Builder
export function LineMapPageBuilder(name: string, param: Object) {
  LineMapPage()
}


@Component
export struct LineMapPage {
  @State controller: AtomicServiceWebController = new AtomicServiceWebController();
  @State scaleValue: number = 1
  @State pinchValue: number = 1
  @State pinchX: number = 0
  @State pinchY: number = 0
  vm: MainEntryVM = MainEntryVM.instance;

  @Builder
  LineMapBuilder() {
    Text('线网图')
      .fontSize($r('app.float.title_lg_font_size'))
      .fontWeight(FontWeight.Medium)
  }

  build() {
    NavDestination() {
      BaseTitle({
        customTitle: () => {
          this.LineMapBuilder()
        },
        showBackBtn: true,
        onBack: () => {
          this.vm.navStack.pop()
        },
      });

      AtomicServiceWeb({ src: $rawfile('LineMap.png'), controller: this.controller })
        .width('100%')
        .height('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.background_color'))
    .hideTitleBar(true)
  }
}