object Form1: TForm1
  Left = 281
  Top = 141
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Chat'
  ClientHeight = 258
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000FFFFFFFFFFFFFF00F000000000000F00F0FFFFFFFFFF0F00F0F
    00000000F0F00F0F0FFFFFF0F0F00F0F0FCCCCF0F0F00F0F0FCCCCF0F0F00F0F
    0FCCCCF0F0F00F0F0FCCCCF0F0F00F0F0FFFFFF0F0F00F0F00000000F0F00F0F
    FFFFFFFFF0F00F000000000000F00FFFFFFFFFFFFFF000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 136
    Top = 104
    Width = 146
    Height = 20
    Caption = 'Warte auf Client...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 120
    Top = 104
    Width = 169
    Height = 20
    Caption = 'Verbinde zu Server...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 417
    Height = 241
    TabOrder = 0
    object ausgabe: TMemo
      Left = 8
      Top = 8
      Width = 401
      Height = 193
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object send: TButton
      Left = 336
      Top = 208
      Width = 75
      Height = 25
      Caption = 'send'
      TabOrder = 1
      OnClick = sendClick
    end
    object eingabe: TEdit
      Left = 8
      Top = 208
      Width = 321
      Height = 21
      TabOrder = 2
      OnKeyPress = eingabeKeyPress
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 8
    Width = 417
    Height = 241
    TabOrder = 1
    object Label1: TLabel
      Left = 184
      Top = 88
      Width = 75
      Height = 20
      Caption = 'Server IP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 168
      Top = 120
      Width = 91
      Height = 20
      Caption = 'Server Port'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 216
      Top = 16
      Width = 39
      Height = 20
      Caption = 'User'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object verbinde: TButton
      Left = 24
      Top = 56
      Width = 137
      Height = 57
      Caption = 'Verbinden'
      TabOrder = 0
      OnClick = verbindeClick
    end
    object serve: TButton
      Left = 24
      Top = 120
      Width = 137
      Height = 57
      Caption = 'Server erstellen'
      TabOrder = 1
      OnClick = serveClick
    end
    object IP: TEdit
      Left = 264
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '10.207.164.28'
    end
    object PORT: TEdit
      Left = 264
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '5000'
    end
    object Name: TEdit
      Left = 264
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 4
      OnChange = NameChange
    end
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 56
    Top = 24
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnAccept = ServerSocket1Accept
    OnClientRead = ServerSocket1ClientRead
    OnClientError = ServerSocket1ClientError
    Left = 24
    Top = 24
  end
end
