$Debug
$ExeIcon:'./gx/resource/gx.ico'
'$Include:'gx/gx.bi'

DefInt A-Z
_Title "QB64 + Nokia 3310 Template"

Const False = 0, True = Not False

' GXDebug GX_TRUE
' GXHardwareAcceleration GX_TRUE
GXSceneCreate 84, 48
GXFrameRate 60
GXSceneScale 3

' Initialisation
Dim Shared pal(1) As Long
pal(0) = _RGB32(&HC7, &HF0, &HD8)
pal(1) = _RGB32(&H43, &H52, &H3D)

Dim Shared game_font: game_font = GXFontCreate( _
  "images/fonts/classic_dark.png", _
  7, 8, _
  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 $?LY?+-*/=%" + Chr$(34) + "'#@&_(),.;:?!\|{}<>[]'^~")

Dim Shared qb_logo, bg
qb_logo = GXScreenEntityCreate("images/qb_logo.png", 20, 20, 1)
GXEntityPos qb_logo, _
  (GXSceneWidth - GXEntityWidth(qb_logo)) \ 2, _
  (gxsceneheight - gxentityheight(qb_logo)) \ 2
' GXEntityVisible qb_logo, GX_TRUE

bg = GXBackgroundAdd("images/bg.png", GXBG_STRETCH)

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
  ' this hides the Entities (sprites)
  'Line (0, 0)-(84, 48), pal(0), BF

  GXDrawText game_font, 3, 8, "Hello QB64!"
  'GXDrawText game_font, 7, 16, " + Nokia!"
End Sub

'$Include:'gx/gx.bm'

