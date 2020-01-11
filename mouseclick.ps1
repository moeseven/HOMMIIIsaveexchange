$cSource = @'
using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;
public class Clicker
{
//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646270(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct INPUT
{ 
    public int        type; // 0 = INPUT_MOUSE,
                            // 1 = INPUT_KEYBOARD
                            // 2 = INPUT_HARDWARE
    public MOUSEINPUT mi;
}

//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646273(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct MOUSEINPUT
{
    public int    dx ;
    public int    dy ;
    public int    mouseData ;
    public int    dwFlags;
    public int    time;
    public IntPtr dwExtraInfo;
}

//This covers most use cases although complex mice may have additional buttons
//There are additional constants you can use for those cases, see the msdn page
const int MOUSEEVENTF_MOVED      = 0x0001 ;
const int MOUSEEVENTF_LEFTDOWN   = 0x0002 ;
const int MOUSEEVENTF_LEFTUP     = 0x0004 ;
const int MOUSEEVENTF_RIGHTDOWN  = 0x0008 ;
const int MOUSEEVENTF_RIGHTUP    = 0x0010 ;
const int MOUSEEVENTF_MIDDLEDOWN = 0x0020 ;
const int MOUSEEVENTF_MIDDLEUP   = 0x0040 ;
const int MOUSEEVENTF_WHEEL      = 0x0080 ;
const int MOUSEEVENTF_XDOWN      = 0x0100 ;
const int MOUSEEVENTF_XUP        = 0x0200 ;
const int MOUSEEVENTF_ABSOLUTE   = 0x8000 ;

const int screen_length = 0x10000 ;

//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646310(v=vs.85).aspx
[System.Runtime.InteropServices.DllImport("user32.dll")]
extern static uint SendInput(uint nInputs, INPUT[] pInputs, int cbSize);

public static void LeftClickAtPoint(int x, int y)
{
    //Move the mouse
    INPUT[] input = new INPUT[3];
    input[0].mi.dx = x*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width);
    input[0].mi.dy = y*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height);
    input[0].mi.dwFlags = MOUSEEVENTF_MOVED | MOUSEEVENTF_ABSOLUTE;
    //Left mouse button down
    input[1].mi.dwFlags = MOUSEEVENTF_LEFTDOWN;
    //Left mouse button up
    input[2].mi.dwFlags = MOUSEEVENTF_LEFTUP;
    SendInput(3, input, Marshal.SizeOf(input[0]));
}
}
'@
Add-Type -TypeDefinition $cSource -ReferencedAssemblies System.Windows.Forms,System.Drawing
#Send a click at a specified point
$basic_sleep = 0.55
$short_sleep = 0.2
$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Heroes of Might and Magic III')
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(500,500) #skip intro
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(1360,321) #load game
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(1360,321) #multiplayer
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(1230,300) #select hot seat
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(875,800) #confirm hot seat player1 player2 ...
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(520,240) #sort save list
Sleep $short_sleep
[Clicker]::LeftClickAtPoint(520,240) #sort save list 2
Sleep $short_sleep
[Clicker]::LeftClickAtPoint(570,260) #select save witch is last in alphabetic order (the save in question has to be here)
Sleep $short_sleep
[Clicker]::LeftClickAtPoint(1075,970) #load selected save
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(920,660) #click away ready screen
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(1790,700) #end turn
Sleep $basic_sleep
[Clicker]::LeftClickAtPoint(890,620) # confirm end if heroes can move 
#Sleep $basic_sleep
#[Clicker]::LeftClickAtPoint(940,670) # click away ready screen