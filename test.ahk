; ; #1:: MoveToMonitor(1)
; ; #2:: MoveToMonitor(2)
; ; #3:: MoveToMonitor(3)

; ; MoveToMonitor(monitor) {
; ;     ; 获取当前活动窗口
; ;     activeWindow := WinGetID("A")

; ;     ; 获取窗口位置和大小
; ;     winX := 0
; ;     winY := 0
; ;     winWidth := 0
; ;     winHeight := 0
; ;     WinGetPos(&winX, &winY, &winWidth, &winHeight, "ahk_id " . activeWindow)

; ;     ; 获取指定显示器的工作区域
; ;     monLeft := 0
; ;     monTop := 0
; ;     monRight := 0
; ;     monBottom := 0
; ;     MonitorGetWorkArea(monitor, &monLeft, &monTop, &monRight, &monBottom)

; ;     ; 计算新窗口位置
; ;     newX := monLeft + (monRight - monLeft - winWidth) / 2
; ;     newY := monTop + (monBottom - monTop - winHeight) / 2

; ;     ; 移动窗口
; ;     WinMove(newX, newY, , , "ahk_id " . activeWindow)
; ; }

; ; 按下 Space + i 组合键
; Space & i:: {
;     ; 获取当前输入法状态
;     ; GetKeyboardLayout() 返回输入法的句柄，根据不同的语言和区域返回不同的值
;     InputMethod := GetInputMethod()

;     ; 显示一个消息框，指示当前输入法是中文还是英文
;     if (InputMethod = "CH")
;     {
;         Tooltip("CN")
;     }
;     else if (InputMethod = "EN")
;     {
;         ToolTip("EN")
;     }

;     ; 设置1秒后关闭提示框
;     ; SetTimer Tooltip, -1000
;     return
; }
; ; 获取输入法函数，返回 "CH" 或 "EN"
; GetInputMethod() {
;     ; 获取当前窗口的输入法
;     ActiveWindow := WinActive("A")
;     layout := DllCall("GetKeyboardLayout", "uint", ActiveWindow, "UInt")

;     ; 中文输入法的 Layout 通常以 0x0804 结尾 (简体中文)
;     ; 英文输入法通常以 0x0409 结尾 (美式英文)
;     if (layout = 0x08040804 or layout = 0x00000804)
;         return "CH"
;     else if (layout = 0x04090409 or layout = 0x00000409)
;         return "EN"
;     else
;         return "未知"
; }

