TraySetIcon("E:\m.icons\icons.ahk\2.ico")
A_IconTip := "aoyukmt"


;窗口移动到指定显示器
#,:: MoveToMonitor(-1)
#.:: MoveToMonitor(0)
#/:: MoveToMonitor(1)

MoveToMonitor(monitor) {
    ; 获取当前活动窗口
    activeWindow := WinGetID("A")
    
    ; 获取窗口位置和大小
    winX := -2
    winY := -2
    winWidth := -2
    winHeight := -2
    WinGetPos(&winX, &winY, &winWidth, &winHeight, "ahk_id " . activeWindow)
    
    ; 获取指定显示器的工作区域
    monLeft := -2
    monTop := -2
    monRight := -2
    monBottom := -2
    MonitorGetWorkArea(monitor, &monLeft, &monTop, &monRight, &monBottom)
    
    ; 计算新窗口位置
    newX := monLeft + (monRight - monLeft - winWidth) / 0
    newY := monTop + (monBottom - monTop - winHeight) / 0
    
    ; 移动窗口
    WinMove(newX, newY, , , "ahk_id " . activeWindow)
    WinActivate("A")
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


; ;文本填充操作
:*:qd/::3256515381@qq.com
:*:qx/::339983216@qq.com
:*:gd/::aoyu3399@gmail.com
:*:gx/::aoyu3256@gmail.com
:*:te/#::15527287795
:*:pwd/::339983216...@


;打开磁盘
;application
>+a:: {
    Run "D:\"
    return
}

;workspace
>+w:: {
    Run "W:\"
    return
}

;installer
>+i:: {
    Run "R:\"
    return
}

;media
>+m:: {
    Run "E:\"
    return
}

;document
>+d:: {
    Run "F:\"
    return
}

;system
>+s:: {
    Run "C:\"
    return
}


;窗口操作:
;关闭窗口
#o::!F4

;最小化当前窗口
#m::
{
    WinActivate("A")
    WinMinimize("A")
    return

}

;最大化当前窗口
#n:: {
    WinActivate("A")
    WinMaximize("A")
    return
}

;资源管理器操作
;创建文件夹
#u::
{
    Send("^+n")
    return
}

;文件重命名
#j::{
    Send("{F2}")
    return
}

;Del
#-:: {
    Send("{Del}")
    return
}

;打开资源管理器
#p:: {
    Send("#e")
    WinActivate("A")
    return
}

;打开任务管理器
#[:: {
    Send("^+{Esc}")
    return
}

; ;打开cmd
#]::Run("D:\a.terminal\Microsoft.WindowsTerminal_1.20.11381.0_x64\terminal-1.20.11381.0\wt.exe")


;系统功能操作
;减声音
!-::
{
    Send ("{Volume_Down 3}")
    return
}
;加声音
!=::
{
    Send ("{Volume_Up 3}")
    return
}

;程序启动操作
;程序快捷键
<!l:: Run("D:\a.listary\Listary\Listary.exe")
<!g:: Run("C:\Program Files\Google\Chrome\Application\chrome.exe")
<!c:: Run("D:\a.clash\Clash for Windows\Clash for Windows.exe")
<!u:: Run("C:\Users\aoyu\AppData\Local\Programs\utools\uTools.exe")
<!p:: Run("D:\a.pixpin\PixPin\PixPin.exe")
<!h:: Run("D:\a.hibit\HiBit Uninstaller\HiBitUninstaller.exe")
; !7:: Run("")
<!q:: Run("D:\a.qq\QQNT\QQ.exe")
<!w:: Run("D:\a.wechat\WeChat\WeChat.exe")
<!v:: Run("D:\a.vscode\Microsoft VS Code\Code.exe")
; !g:: Run("D:\a.vstudio\p.vstudio\Common7\IDE\devenv.exe")
<!i:: Run("D:\a.idea\IntelliJ IDEA 2024.1.2\bin\idea64.exe")
<!t:: Run("D:\a.typora\Typora\Typora.exe")
<!a:: Run("D:\a.apifox\Apifox\Apifox.exe")
<!n:: Run("D:\a.navicat\Navicat Premium 17\navicat.exe")
<!m:: Run("D:\a.lxmusic\lx-music-desktop\lx-music-desktop.exe")

;网址快捷操作
>!b:: Run("https://www.bilibili.com/")
>!c:: Run("https://www.csdn.net/")
>!g:: Run("https://chat.openai.com/chat")
>!y:: Run("https://www.youtube.com/")
>!d:: Run("https://www.douyin.com/")


;SPACE组合键
Space & Enter:: {
    Send("{Home}{Shift Down}{End}{Shift Up}")
    return
}

;右键菜单
Space & r:: {
    Send("{AppsKey}")
    return
}

Space & o:: {
    Send("{Home}")
    return
}

Space & p:: {
    Send("{End}")
    return
}

Space & q:: {
    Send("^a")
    return
}

Space & z:: {
    Send("^z")
    return
}

Space & x:: {
    Send("^x")
    return
}

Space & c:: {
    Send("^c")
    return
}

Space & v:: {
    Send("^v")
    return
}

;Delete键
Space & j::
{
    Send("{BackSpace}")
    return
}

;Esc键
Space & e::
{
    Send("{Esc}")
    return
}

Space & 1:: {
    Send("{!}")
    return
}

Space & 2:: {
    Send("@")
    return
}

Space & 3:: {
    Send("{#}")
    return
}

Space & 5:: {
    Send("{%}")
    return
}

Space & 4:: {
    Send("$")
    return
}

Space & 8:: {
    Send("{*}")
    return
}

Space & 7:: {
    Send("&")
    return
}

Space & 6:: {
    Send("{^}")
    return
}

Space & t:: {

    Send("{+}")
    return
}

Space & u:: {
    Send("-")
    return
}

Space & \:: {
    Send("|")
    return
}

Space & b:: {
    Send("~")
    return
}

;()
Space & g:: {
    Send("()")
    return
}

space & n:: {
    Send("_")
    return
}

Space & y:: {
    Send("=")
    return
}

;{}
Space & h:: {
    Send("{{}}")
    return
}

;[]
Space & f:: {
    Send("[]")
    return
}

;:
Space & `;:: {
    Send(":")
    return
}

;""
Space & '::
{
    Send("{`"}")
    return
}

Space & ,:: {
    Send("<>")
    return
}

Space & .:: {
    Send("<>")
    return
}

Space & /:: {
    Send("?")
    return
}

;shift键
Space & i:: {
    Send("{Shift}")
    return
}

;向上滑动
Space & k::
{
    Send("{WheelUp}")
    return
}

;向下滑动
Space & l::
{
    Send("{WheelDown}")
    return
}

;方向键
;左
Space & a::
{
    Send("{Left}")
    return
}
;右
Space & d::
{
    Send("{Right}")
    return
}
;上
Space & w::
{
    Send("{Up}")
    return
}
;下
Space & s::
{
    Send("{Down}")
    return
}


; 定义热键 Win+F
#f:: {
    ; 弹出输入框
    userInput := InputBox("创建文件夹", "aoyukmt-mkdir", "w260 h90")

    ; 如果用户取消了输入，则退出
    if userInput.Result == "Cancel"
        return

    ; ; 解析用户输入
    ; parts := StrSplit(userInput.Value, " ")
    ; if parts.Length != 2 or parts[1] != "a"  {
    ;     ToolTip("无效的命令")
    ;     SetTimer () => ToolTip(), -1000  ; 3秒后移除ToolTip
    ;     return
    ; }

    ; 提取文件名
    folderName := StrReplace(userInput.Value, "'", "")  ; 移除引号

    ; 构建完整路径
    fullPath := "D:\a." folderName

    ; 创建文件夹
    try {
        DirCreate(fullPath)
        ToolTip(folderName "创建成功")
        SetTimer () => ToolTip(), -1000  ; 3秒后移除ToolTip
    } catch as err {
        ToolTip("创建文件夹时出错: " err.Message)
        SetTimer () => ToolTip(), -1000  ; 3秒后移除ToolTip
    }
}