TraySetIcon(".\img\tray-a.ico")
A_IconTip := "aoyukmt"

;按键功能提示
ShowHotkeyAction(action, isShow) {
    if (isShow) {
        ToolTip(action, 0, 0)
        SetTimer () => ToolTip(), -1000  ; 3秒后移除ToolTip
    }

    return
}

;托盘图标操作
#u::  ; Win + U
{
    ; 发送 Win + B 来选择系统托盘
    ShowHotkeyAction("操作托盘图标", 1)
    Send("#b")
    Send("{Enter}")
    Return
}


;防止影响原来的功能
$Space::Space
{
    return
}
$Tab::Tab
{
    return
}
$Ctrl::Ctrl
{
    return
}
$#::#
{
    return
}

;切换窗口焦点
#Space::
{
    thisWinIndex := 1
    winList := []
    thisWin := WinGetTitle("A")
    allWindows := WinGetList(, , ,)
    winStr := ""
    ShowHotkeyAction("切换窗口焦点", 1)
    for index, value in allWindows {
        if (
            WinGetTitle(value) != "" and
            WinGetTitle(value) != "桌面歌词-洛雪音乐助手"
        ) {
            winStr .= "第" index "个窗口：" WinGetTitle(value) . "`n"
            winList.Push(WinGetTitle(value))
        }
    }
    for index, value in winList {
        if (thisWin = value) {
            thisWinIndex := index
        }
    }

    if (thisWinIndex != winList.Length) {
        WinActivate(WinGetTitle(winList[thisWinIndex + 1]))
        if (WinExist(thisWin)) {
            WinMoveBottom(WinGetTitle(thisWin))
        }
    } else {
        WinActivate(WinGetTitle(winList[1]))
    }
}


;打开磁盘
;c disk
>+c:: {
    ShowHotkeyAction("打开C盘", 1)
    Run "C:\"
    return
}


;d disk
>+d:: {
    ShowHotkeyAction("打开D盘", 1)
    Run "D:\"
    return
}


;窗口操作:
;关闭窗口
#o:: {
    ShowHotkeyAction("关闭当前窗口", 1)
    Send("!{F4}")
    return
}

;最小化当前窗口
#m::
{
    ShowHotkeyAction("最小化当前窗口", 1)
    WinActivate("A")
    WinMinimize("A")
    return

}

;最大化当前窗口
#n:: {
    ShowHotkeyAction("最大化当前窗口", 1)
    WinActivate("A")
    WinMaximize("A")
    return
}

;资源管理器操作
;创建文件夹
#=::
{
    ShowHotkeyAction("创建新文件夹", 1)
    Send("^+n")
    return
}

;文件重命名
#j:: {
    ShowHotkeyAction("文件重命名", 1)
    Send("{F2}")
    return
}

;Del
#-:: {
    ShowHotkeyAction("删除文件/文件夹", 1)
    Send("{Del}")
    return
}

;打开资源管理器
#p:: {
    ShowHotkeyAction("打开资源管理器", 1)
    Send("#e")
    return
}

;打开任务管理器
#[:: {
    ShowHotkeyAction("打开任务管理器", 1)
    Send("^+{Esc}")
    return
}

; ;打开cmd
#]::
{
    ShowHotkeyAction("打开PowerShell", 1)
    Run("cmd.exe")
    return
}


;系统功能操作
;应用任务列表
space & ]:: {
    ShowHotkeyAction("打开任务列表", 1)
    Send("#{Tab}")
    return
}
;剪切板映射
Space & m:: {
    Send("#v")
    return
}


;减声音
!-::
{
    ShowHotkeyAction("系统声音减3", 1)
    Send ("{Volume_Down 3}")
    return
}
;加声音
!=::
{
    ShowHotkeyAction("系统声音加3", 1)
    Send ("{Volume_Up 3}")
    return
}

;关机
#0:: {
    ShowHotkeyAction("关闭计算机", 1)
    Shutdown(1)
    return
}

;重启
#1:: {
    ShowHotkeyAction("重启计算机", 1)
    Shutdown(2)
    return
}


StartApplication(path, action) {
    ShowHotkeyAction(action, 1)
    Run(path)
}


;SPACE组合键

Space & [::
{
    ShowHotkeyAction("返回上一级文件夹", 1)
    if WinActive("ahk_class CabinetWClass")
    {
        Send("!{Up}")
    }
}


Space & Enter:: {
    ShowHotkeyAction("选中当前行", 1)
    Send("{Home}{Shift Down}{End}{Shift Up}")
    return
}

;右键菜单
Space & r:: {
    ShowHotkeyAction("显示右键菜单", 1)
    Send("{AppsKey}")
    return
}

Space & o:: {
    ShowHotkeyAction("光标移动到行首", 1)
    Send("{Home}")
    return
}

Space & p:: {
    ShowHotkeyAction("光标移动到行尾", 1)
    Send("{End}")
    return
}

Space & q:: {
    ShowHotkeyAction("全选", 1)
    Send("^a")
    return
}

Space & z:: {
    ShowHotkeyAction("撤销", 1)
    Send("^z")
    return
}

Space & x:: {
    ShowHotkeyAction("剪切", 1)
    Send("^x")
    return
}

Space & c:: {
    ShowHotkeyAction("复制", 1)
    Send("^c")
    return
}

Space & v:: {
    ShowHotkeyAction("粘贴", 1)
    Send("^v")
    return
}

;Delete键
Space & j::
{
    ShowHotkeyAction("退格", 1)
    Send("{BackSpace}")
    return
}

;Esc键
Space & e::
{
    ShowHotkeyAction("取消(ESC)", 1)
    Send("{Esc}")
    return
}

Space & 1:: {
    ShowHotkeyAction("输入字符--(!/！)", 1)
    Send("{!}")
    return
}

Space & 2:: {
    ShowHotkeyAction("输入字符--(@)", 1)
    Send("@")
    return
}

Space & 3:: {
    ShowHotkeyAction("输入字符--(#)", 1)
    Send("{#}")
    return
}

Space & 5:: {
    ShowHotkeyAction("输入字符--(%)", 1)
    Send("{%}")
    return
}

Space & 4:: {
    ShowHotkeyAction("输入字符--($/￥)", 1)
    Send("$")
    return
}

Space & 8:: {
    ShowHotkeyAction("输入字符--(*)", 1)
    Send("{*}")
    return
}

Space & 7:: {
    ShowHotkeyAction("输入字符--(&)", 1)
    Send("&")
    return
}

Space & 6:: {
    ShowHotkeyAction("输入字符--(^/……)", 1)
    Send("{^}")
    return
}

Space & t:: {
    ShowHotkeyAction("输入字符--(+)", 1)
    Send("{+}")
    return
}

Space & u:: {
    ShowHotkeyAction("输入字符--(-)", 1)
    Send("-")
    return
}

Space & \:: {
    ShowHotkeyAction("输入字符--(|)", 1)
    Send("|")
    return
}

Space & b:: {
    ShowHotkeyAction("输入字符--(~)", 1)
    Send("~")
    return
}

;()
Space & g:: {
    ShowHotkeyAction("输入小括号", 1)
    Send("()")
    return
}

Space & n:: {
    ShowHotkeyAction("输入字符--(_)", 1)
    Send("_")
    return
}

Space & y:: {
    ShowHotkeyAction("输入字符--(=)", 1)
    Send("=")
    return
}
;{}
Space & h:: {
    ShowHotkeyAction("输入大括号", 1)
    Send("{{}}")
    return
}

;[]
Space & f:: {
    ShowHotkeyAction("输入中括号", 1)
    Send("[]")
    return
}

;:
Space & `;:: {
    ShowHotkeyAction("输入字符--(:)", 1)
    Send(":")
    return
}

;""
Space & '::
{
    ShowHotkeyAction("输入双引号", 1)
    Send("{`"}")
    return
}

Space & ,:: {
    ShowHotkeyAction("输入尖括号", 1)
    Send("<>")
    return
}

Space & .:: {
    ShowHotkeyAction("输入尖括号", 1)
    Send("<>")
    return
}

Space & /:: {
    ShowHotkeyAction("输入字符--(?)", 1)
    Send("?")
    return
}

space & k:: {
    ShowHotkeyAction("输入英文逗号--(.)", 1)
    Send("{U+002E}")
    return
}
Space & l:: {
    ShowHotkeyAction("输入英文逗号--(,)", 1)
    Send("{U+002C}")
    return
}

; 按下 Space + i 显示当前窗口的输入法状态
Space & i::
{
    Send("{Shift}")
    static isEN := true
    if (isEN = true) {
        ShowHotkeyAction("切换输入法00", 1)
        isEN := false
    } else {
        ShowHotkeyAction("切换输入法01", 1)
        isEN := true
    }
    return

}

;向上滑动
Space & 9::
{
    ShowHotkeyAction("向上滑动", 0)
    Send("{WheelUp}")
    return
}

;向下滑动
Space & 0::
{
    ShowHotkeyAction("向下滑动", 0)
    Send("{WheelDown}")
    return
}

;方向键
;左
Space & a::
{
    ShowHotkeyAction("方向键--左", 0)
    Send("{Left}")
    return
}
;右
Space & d::
{
    ShowHotkeyAction("方向键--右", 0)
    Send("{Right}")
    return
}
;上
Space & w::
{
    ShowHotkeyAction("方向键--上", 0)
    Send("{Up}")
    return
}
;下
Space & s::
{
    ShowHotkeyAction("方向键--下", 0)
    Send("{Down}")
    return
}


; 定义热键 Win+F
; 定义热键 Win+F
#f:: {
    ShowHotkeyAction("在D盘创建文件夹", 0)

    ; 弹出输入框
    userInput := InputBox("创建文件夹", "aoyukmt-mkdir", "w260 h90")

    ; 如果用户取消了输入，则退出
    if userInput.Result == "Cancel"
        return

    ; 提取文件名
    folderName := StrReplace(userInput.Value, "'", "")  ; 移除引号

    ; 构建完整路径
    fullPath := "D:\" folderName

    ; 创建文件夹
    try {
        DirCreate(fullPath)
        ToolTip(folderName " 创建成功")
        SetTimer(() => ToolTip(), -1000)  ; 3秒后移除ToolTip
    } catch as err {
        ToolTip("创建文件夹时出错: " err.Message)
        SetTimer(() => ToolTip(), -1000)  ; 3秒后移除ToolTip
    }
}