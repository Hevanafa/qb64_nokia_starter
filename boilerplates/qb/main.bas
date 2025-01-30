$Debug
Option Base 0
DefInt A-Z

_Title "QB64 + Nokia 3310 Template"

Const TARGET_FPS = 15
Const K_ESC = 27

' init screen
Dim Shared buffer As Long, scaled As Long
buffer = _NewImage(84, 48, 32)
scaled = _NewImage(84 * 3, 48 * 3, 32)

Screen scaled: _Dest buffer: _Delay 0.1: _Display

' init palette
Dim Shared pal(1) As Long
pal(0) = _RGB32(&HC7, &HF0, &HD8)
pal(1) = _RGB32(&H43, &H52, &H3D)

Dim Shared font_chars As String: font_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 $€LY¤+-*/=%" + Chr$(34) + "'#@&_(),.;:?!\|{}<>[]'^~"
' Char size: 7x8
Dim Shared font_img As Long
font_img = _LoadImage("images\fonts\classic_dark.png")
Dim Shared print_x As Integer, print_y As Integer


Dim Shared frames As Long: frames = 0

' Game loop
Do
  _Limit TARGET_FPS
  NUpdate
  NDraw
Loop Until _KeyDown(K_ESC)

' Skip "Press any key to continue"
System



' Implementation

Sub NUpdate
  frames = frames + 1
End Sub

Sub DrawText (text As String)
  Dim left As Integer, char_idx As Integer

  '_PutImage (7, 0), font_img, buffer, (0, 0)-(7, 8)
  'Locate 2, 1
  'char_idx = InStr(, font_chars, Mid$(text, 2, 1))
  'Print char_idx; Mid$(text, 2, 1);
  'if char_idx > 0 then _
  '  _PutImage (left, 0), font_img, buffer, ((char_idx-1) * 7, 0)-(char_idx * 7, 8)

  For a = 1 To Len(text)
    ' starts at 1
    char_idx = InStr(, font_chars, Mid$(text, a, 1))
    _PutImage (print_x + left, print_y), font_img, buffer, ((char_idx - 1) * 7, 0)-(char_idx * 7 - 1, 7)

    left = left + 7
  Next
End Sub

' Because DRAW is already in use
Sub NDraw
  Cls , pal(0)

  ' Print Str$(InStr(, font_chars, "A"))
  ' Locate 2, 1
  NLocate 7, 8
  DrawText "Hello QB64"
  NLocate 7, 16
  DrawText "+ Nokia!"

  NLocate 7, 40
  DrawText "Frame:" + LTrim$(Str$(frames))

  _PutImage , buffer, scaled
  _Display
End Sub

Sub NLocate (x%, y%)
  print_x = x%
  print_y = y%
End Sub

