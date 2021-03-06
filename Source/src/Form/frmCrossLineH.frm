VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmCrossLineH 
   Caption         =   "frmCrossLineH"
   ClientHeight    =   1095
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5415
   OleObjectBlob   =   "frmCrossLineH.frx":0000
   ShowModal       =   0   'False
End
Attribute VB_Name = "frmCrossLineH"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

#If VBA7 And Win64 Then
    Public hWnd As LongPtr
#Else
    Public hWnd As Long
#End If
Public Transparency As Double

Public Sub Run()

    hWnd = FindWindow("ThunderDFrame", Me.Caption)
    
    If hWnd <> 0& Then
        SetWindowLong hWnd, GWL_EXSTYLE, GetWindowLong(hWnd, GWL_EXSTYLE) Or WS_EX_LAYERED Or &H20
        
        'フレーム無
        SetWindowLong hWnd, GWL_EXSTYLE, GetWindowLong(hWnd, GWL_EXSTYLE) And Not WS_EX_DLGMODALFRAME
        
        'キャプションなし
        SetWindowLong hWnd, GWL_STYLE, GetWindowLong(hWnd, GWL_STYLE) And Not WS_CAPTION
        
        '半透明化
        SetLayeredWindowAttributes hWnd, 0, Transparency * 0.01 * 255, LWA_ALPHA
        
    End If
    
    Me.Show

End Sub




