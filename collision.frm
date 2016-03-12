VERSION 5.00
Begin VB.Form frmcol 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   6780
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9930
   Enabled         =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6780
   ScaleWidth      =   9930
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   45
      Left            =   2520
      Top             =   4320
   End
   Begin VB.Timer movingtimer 
      Interval        =   45
      Left            =   3000
      Top             =   1680
   End
   Begin VB.Timer bouncetimer 
      Interval        =   45
      Left            =   1080
      Top             =   3360
   End
   Begin VB.Image player 
      Height          =   690
      Left            =   1560
      Picture         =   "collision.frx":0000
      Stretch         =   -1  'True
      Top             =   960
      Width           =   435
   End
   Begin VB.Shape Shape1 
      Height          =   3375
      Left            =   480
      Top             =   600
      Width           =   7095
   End
   Begin VB.Image ball 
      DragIcon        =   "collision.frx":23EF
      Height          =   480
      Left            =   3240
      Picture         =   "collision.frx":26F9
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   465
   End
End
Attribute VB_Name = "frmcol"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim x As Integer
Dim y As Integer
Dim a As String
Dim b As String
Dim c As String
Dim number As Integer

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
Case vbKeyUp
player.Top = player.Top - 200

Case vbKeyLeft
player.Left = player.Left - 200

Case vbKeyDown
player.Top = player.Top + 200

Case vbKeyRight
player.Left = player.Left + 200

End Select
col

End Sub

Private Sub col()
If Shape1.Left > player.Left Then
player.Left = player.Left + 400
End If

If Shape1.Top > player.Top Then
player.Top = player.Top + 400
End If

If Shape1.Width < player.Left Then
player.Left = player.Left - 400
End If

If Shape1.Height < player.Top Then
player.Top = player.Top - 400
End If

End Sub



Private Sub movingtimer_Timer()
If ball.Top >= 3412 Then
    a = "down"
    c = "down"
    
ElseIf Shape1.Top - ball.Top >= 10 Then
    a = "top"
    c = "top"
ElseIf ball.Left <= 480 Then
    a = "left"
ElseIf Shape1.Width - ball.Left <= 200 Then
    a = "right"
End If

If ball.Left - player.Left <= 300 And player.Top - ball.Top <= 200 And player.Top - ball.Top >= 100 Then
    b = "bounce"
End If

If a = "" Or a = "down" Then ' if ball is startng
'or ball bounces of down
    ball.Top = ball.Top - 150

ElseIf a = "right" Then

    ball.Left = ball.Left - 100
ElseIf a = "top" Then
    ball.Top = ball.Top + 150
       
ElseIf a = "left" Then

    ball.Left = ball.Left + 100
End If

If b = "bounce" Then

    If a = "right" And c = "down" Then
    
        b = "bouncerightup"
    
    ElseIf a = "right" And c = "top" Then
    
        b = "bouncerightdown"
        
    End If
    
    
    ball.Left = ball.Left + 100
    
End If
If b = "bouncerightup" Then
    If a = "top" Then
    b = "bouncetop"
    End If

    ball.Top = ball.Top - 100

ElseIf b = "bouncerightdown" Then
    If a = "down" Then
    b = "bouncedown"
    End If
    

    ball.Top = ball.Top + 100

End If
If b = "bouncetop" Then

    ball.Left = ball.Left - 100

End If
If b = "bouncedown" Then
    ball.Left = ball.Left - 100

End If
End Sub

  

