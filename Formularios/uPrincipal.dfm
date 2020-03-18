object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ActiveControl = edtNome
  Caption = 'Cadastro de Clientes'
  ClientHeight = 466
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 113
    Width = 129
    Height = 353
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object btnIncluir: TSpeedButton
      Left = 4
      Top = 0
      Width = 123
      Height = 40
      Caption = 'Incluir'
      OnClick = btnIncluirClick
    end
    object btnEditar: TSpeedButton
      Left = 3
      Top = 43
      Width = 123
      Height = 40
      Caption = 'Editar'
      OnClick = btnEditarClick
    end
    object btnExcluir: TSpeedButton
      Left = 4
      Top = 85
      Width = 123
      Height = 40
      Caption = 'Excluir'
      OnClick = btnExcluirClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 113
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      756
      113)
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 95
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 320
      Top = 16
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label4: TLabel
      Left = 447
      Top = 13
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label5: TLabel
      Left = 16
      Top = 55
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label6: TLabel
      Left = 320
      Top = 55
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label7: TLabel
      Left = 631
      Top = 13
      Width = 80
      Height = 13
      Caption = 'Limite de Cr'#233'dito'
    end
    object btnLimpar: TSpeedButton
      Left = 541
      Top = 68
      Width = 97
      Height = 34
      Anchors = [akRight]
      Caption = 'Limpar'
      OnClick = btnLimparClick
      ExplicitLeft = 542
    end
    object btnPesquisar: TSpeedButton
      Left = 644
      Top = 68
      Width = 97
      Height = 34
      Anchors = [akRight]
      Caption = 'Pesquisar'
      OnClick = btnPesquisarClick
      ExplicitLeft = 645
    end
    object Label8: TLabel
      Left = 449
      Top = 55
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object edtCodigo: TEdit
      Left = 16
      Top = 32
      Width = 73
      Height = 21
      TabStop = False
      Color = clWhite
      TabOrder = 0
    end
    object edtEndereco: TEdit
      Left = 16
      Top = 71
      Width = 298
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object edtCidade: TEdit
      Left = 320
      Top = 71
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object edtNome: TEdit
      Left = 95
      Top = 32
      Width = 219
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edtCPF: TMaskEdit
      Left = 320
      Top = 32
      Width = 117
      Height = 21
      EditMask = '000-000-000-00;0;_'
      MaxLength = 14
      TabOrder = 2
      Text = ''
      OnClick = edtCPFClick
    end
    object edtLimiteCredito: TMaskEdit
      Left = 631
      Top = 32
      Width = 111
      Height = 21
      TabOrder = 4
      Text = ''
    end
    object cboUF: TComboBox
      Left = 447
      Top = 71
      Width = 62
      Height = 21
      Style = csDropDownList
      TabOrder = 7
    end
    object edtDataNascimento: TMaskEdit
      Left = 449
      Top = 32
      Width = 119
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
  end
  object Panel3: TPanel
    Left = 129
    Top = 113
    Width = 627
    Height = 353
    Align = alClient
    TabOrder = 2
    DesignSize = (
      627
      353)
    object dbGridListagem: TDBGrid
      Left = 6
      Top = 6
      Width = 612
      Height = 340
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBtnFace
      DataSource = Tabela.dsCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbGridListagemDblClick
    end
  end
end