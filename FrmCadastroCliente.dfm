object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 238
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    547
    238)
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
    Left = 16
    Top = 55
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 343
    Top = 55
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label6: TLabel
    Left = 16
    Top = 143
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label4: TLabel
    Left = 342
    Top = 92
    Width = 96
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object Label7: TLabel
    Left = 343
    Top = 13
    Width = 80
    Height = 13
    Caption = 'Limite de Cr'#233'dito'
  end
  object SpeedButton5: TSpeedButton
    Left = 303
    Top = 178
    Width = 97
    Height = 34
    Anchors = [akRight]
    Caption = 'Cancelar'
  end
  object btnGravar: TSpeedButton
    Left = 406
    Top = 178
    Width = 97
    Height = 34
    Anchors = [akRight]
    Caption = 'Gravar'
    OnClick = btnGravarClick
  end
  object Label8: TLabel
    Left = 152
    Top = 145
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 32
    Width = 71
    Height = 21
    TabOrder = 0
  end
  object edtEndereco: TEdit
    Left = 16
    Top = 111
    Width = 321
    Height = 21
    TabOrder = 1
  end
  object edtNome: TEdit
    Left = 16
    Top = 71
    Width = 321
    Height = 21
    TabOrder = 2
  end
  object edtCPF: TMaskEdit
    Left = 343
    Top = 71
    Width = 116
    Height = 21
    EditMask = '000-000-000-00;0;_'
    MaxLength = 14
    TabOrder = 3
    Text = ''
  end
  object edtCidade: TEdit
    Left = 16
    Top = 159
    Width = 120
    Height = 21
    TabOrder = 4
  end
  object edtDataNascimento: TMaskEdit
    Left = 343
    Top = 111
    Width = 120
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  object cbUF: TDBComboBox
    Left = 152
    Top = 159
    Width = 65
    Height = 21
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
    TabOrder = 6
  end
  object edtLimiteCredito: TMaskEdit
    Left = 343
    Top = 32
    Width = 111
    Height = 21
    TabOrder = 7
    Text = ''
  end
end
