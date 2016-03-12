VERSION 5.00
Begin VB.Form frmPlay 
   Caption         =   "Form1"
   ClientHeight    =   8220
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10650
   LinkTopic       =   "Form1"
   ScaleHeight     =   8220
   ScaleWidth      =   10650
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer TimerGame 
      Interval        =   1000
      Left            =   5160
      Top             =   1800
   End
   Begin VB.Label Time 
      BackStyle       =   0  'Transparent
      Caption         =   "90"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5040
      TabIndex        =   2
      Top             =   1680
      Width           =   735
   End
   Begin VB.Image Messi 
      Height          =   1215
      Left            =   9480
      Picture         =   "Soccer1v1.frx":0000
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image Ronaldo 
      Height          =   1245
      Left            =   120
      Picture         =   "Soccer1v1.frx":33FA
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   795
   End
   Begin VB.Image Image1 
      Height          =   465
      Left            =   7080
      Picture         =   "Soccer1v1.frx":57E9
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   450
   End
   Begin VB.Shape Shape9 
      BorderColor     =   &H80000005&
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   255
      Left            =   5160
      Shape           =   3  'Circle
      Top             =   4560
      Width           =   255
   End
   Begin VB.Shape Shape8 
      BorderColor     =   &H80000005&
      Height          =   2775
      Left            =   3960
      Shape           =   3  'Circle
      Top             =   3240
      Width           =   2655
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000005&
      X1              =   5280
      X2              =   5280
      Y1              =   1560
      Y2              =   7680
   End
   Begin VB.Shape Shape7 
      BorderColor     =   &H80000005&
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   255
      Left            =   9480
      Shape           =   3  'Circle
      Top             =   4560
      Width           =   135
   End
   Begin VB.Shape Shape6 
      BorderColor     =   &H80000005&
      Height          =   2655
      Left            =   10080
      Top             =   3360
      Width           =   735
   End
   Begin VB.Shape Shape5 
      BackColor       =   &H00FFFFFF&
      BorderColor     =   &H80000009&
      FillColor       =   &H00FFFFFF&
      Height          =   4575
      Left            =   8880
      Top             =   2400
      Width           =   1935
   End
   Begin VB.Shape Shape4 
      BorderColor     =   &H80000005&
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   255
      Left            =   1320
      Shape           =   3  'Circle
      Top             =   4560
      Width           =   135
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H80000005&
      Height          =   2655
      Left            =   120
      Top             =   3360
      Width           =   615
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H00FFFFFF&
      BorderColor     =   &H80000009&
      FillColor       =   &H00FFFFFF&
      Height          =   4575
      Left            =   120
      Top             =   2400
      Width           =   2055
   End
   Begin VB.Label ScoreRonaldo 
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   975
      Left            =   240
      TabIndex        =   1
      Top             =   1680
      Width           =   375
   End
   Begin VB.Label ScoreMessi 
      BackColor       =   &H0000FF00&
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   735
      Left            =   9960
      TabIndex        =   0
      Top             =   1680
      Width           =   855
   End
   Begin VB.Shape Pitch 
      BorderColor     =   &H80000005&
      FillColor       =   &H0000FF00&
      FillStyle       =   0  'Solid
      Height          =   6135
      Left            =   120
      Top             =   1560
      Width           =   10695
   End
End
Attribute VB_Name = "frmPlay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
Case vbKeyUp
Messi.Top = Messi.Top - 300
Case vbKeyLeft
Messi.Left = Messi.Left - 300
Case vbKeyDown
Messi.Top = Messi.Top + 300
Case vbKeyRight
Messi.Left = Messi.Left + 300
Case vbKeyW
Ronaldo.Top = Ronaldo.Top - 300
Case vbKeyA
Ronaldo.Left = Ronaldo.Left - 300
Case vbKeyS
Ronaldo.Top = Ronaldo.Top + 300
Case vbKeyD
Ronaldo.Left = Ronaldo.Left + 300

End Select
PlayerWallCollision
End Sub

Private Sub TimerGame_Timer()
Time.Caption = Time.Caption - 1

If Time.Caption = 0 Then
   MsgBox "Time Up!"
   TimerGame.Enabled = False
End If
End Sub
Private Sub PlayerWallCollision()
If Pitch.Left > Ronaldo.Left + 100 Then
Ronaldo.Left = Ronaldo.Left + 300
End If
If Pitch.Top > Ronaldo.Top Then
Ronaldo.Top = Ronaldo.Top + 300
End If
If Pitch.Width < Ronaldo.Left + 500 Then
Ronaldo.Left = Ronaldo.Left - 300
End If
If Pitch.Height < Ronaldo.Top - 450 Then
Ronaldo.Top = Ronaldo.Top - 300
End If
If Pitch.Left > Messi.Left Then
Messi.Left = Messi.Left + 300
End If
If Pitch.Top > Messi.Top Then
Messi.Top = Messi.Top + 300
End If
If Pitch.Width < Messi.Left + 400 Then
Messi.Left = Messi.Left - 300
End If
If Pitch.Height < Messi.Top - 450 Then
Messi.Top = Messi.Top - 300
End If


End Sub
