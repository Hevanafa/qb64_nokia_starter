$ExeIcon:'./gx/resource/gx.ico'
'$Include:'gx/gx.bi'

DefInt A-Z
_Title "QB64 + Nokia 3310 Template"

' GXHardwareAcceleration GX_TRUE
GXSceneCreate 84, 48
GXFrameRate 60

' Initialisation
Dim Shared pal(1) As Long
pal(0) = _RGB32(&HC7, &HF0, &HD8)
pal(1) = _RGB32(&H43, &H52, &H3D)

Dim Shared game_font: game_font = GXFontCreate( _
  "images/fonts/classic_dark.png", _
  7, 8, _
  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 $?LY?+-*/=%" + Chr$(34) + "'#@&_(),.;:?!\|{}<>[]'^~")

GXSceneScale 3
GXSceneStart
System 0

' Event loop
Sub GXOnGameEvent (e As GXEvent)
  Select Case e.event
    Case GXEVENT_UPDATE
      NUpdate

    Case GXEVENT_DRAWSCREEN
      NDraw
  End Select
End Sub

Sub NUpdate
  If GXKeyDown(GXKEY_ESC) Then _
    GXSceneStop
End Sub

Sub NDraw
  Line (0, 0)-(84, 48), pal(0), BF

  GXDrawText game_font, 20, 20, _
            "Hello QB64 + Nokia!"
End Sub

'$Include:'gx/gx.bm'

