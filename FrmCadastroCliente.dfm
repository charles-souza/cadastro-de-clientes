object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 203
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    463
    203)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label5: TLabel
    Left = 16
    Top = 95
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label2: TLabel
    Left = 81
    Top = 13
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 16
    Top = 53
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label6: TLabel
    Left = 255
    Top = 95
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label4: TLabel
    Left = 144
    Top = 55
    Width = 96
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object Label7: TLabel
    Left = 255
    Top = 53
    Width = 80
    Height = 13
    Caption = 'Limite de Cr'#233'dito'
  end
  object SpeedButton5: TSpeedButton
    Left = 345
    Top = 152
    Width = 97
    Height = 34
    Anchors = [akRight]
    Caption = 'Cancelar'
    OnClick = SpeedButton5Click
  end
  object btnGravar: TSpeedButton
    Left = 242
    Top = 152
    Width = 97
    Height = 34
    Anchors = [akRight]
    Caption = 'Gravar'
    OnClick = btnGravarClick
  end
  object Label8: TLabel
    Left = 380
    Top = 97
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 32
    Width = 57
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
  end
  object edtEndereco: TEdit
    Left = 16
    Top = 111
    Width = 225
    Height = 21
    TabOrder = 5
  end
  object edtNome: TEdit
    Left = 81
    Top = 32
    Width = 360
    Height = 21
    TabOrder = 1
  end
  object edtCPF: TMaskEdit
    Left = 16
    Top = 68
    Width = 121
    Height = 21
    EditMask = '000-000-000-00;0;_'
    MaxLength = 14
    TabOrder = 2
    Text = ''
  end
  object edtCidade: TEdit
    Left = 255
    Top = 111
    Width = 120
    Height = 21
    TabOrder = 6
  end
  object edtDataNascimento: TDateTimePicker
    Left = 144
    Top = 68
    Width = 98
    Height = 21
    Date = 43802.000000000000000000
    Time = 0.452586134262674000
    TabOrder = 3
  end
  object edtLimiteCredito: TEdit
    Left = 256
    Top = 68
    Width = 186
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object cbUF: TComboBox
    Left = 377
    Top = 111
    Width = 65
    Height = 21
    TabOrder = 7
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SE'
      'SP'
      'TO')
  end
end
