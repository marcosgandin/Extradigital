object frmCadEnderecos: TfrmCadEnderecos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Endere'#231'os'
  ClientHeight = 340
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 290
    Width = 619
    Height = 50
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 596
    object btnNovo: TBitBtn
      Left = 24
      Top = 12
      Width = 74
      Height = 25
      Caption = '&Novo'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnSalvar: TBitBtn
      Left = 104
      Top = 12
      Width = 72
      Height = 25
      Caption = '&Salvar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnExcluir: TBitBtn
      Left = 182
      Top = 12
      Width = 82
      Height = 25
      Caption = '&Excluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 2
    end
    object btnFechar: TBitBtn
      Left = 510
      Top = 12
      Width = 82
      Height = 25
      Caption = '&Fechar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnFecharClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 290
    Align = alClient
    TabOrder = 1
    ExplicitTop = 6
    ExplicitWidth = 596
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 24
      Top = 43
      Width = 59
      Height = 13
      Caption = 'Logradouro:'
    end
    object Label3: TLabel
      Left = 24
      Top = 70
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object Label4: TLabel
      Left = 152
      Top = 70
      Width = 69
      Height = 13
      Caption = 'Complemento:'
    end
    object Label5: TLabel
      Left = 24
      Top = 97
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object Label6: TLabel
      Left = 24
      Top = 123
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object Label7: TLabel
      Left = 173
      Top = 123
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object Label8: TLabel
      Left = 513
      Top = 123
      Width = 17
      Height = 13
      Caption = 'UF:'
    end
    object edtCodigo: TEdit
      Left = 87
      Top = 13
      Width = 78
      Height = 21
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtLogradouro: TEdit
      Left = 87
      Top = 40
      Width = 505
      Height = 21
      TabOrder = 1
    end
    object edtNumero: TEdit
      Left = 87
      Top = 67
      Width = 58
      Height = 21
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 223
      Top = 67
      Width = 369
      Height = 21
      TabOrder = 3
    end
    object edtBairro: TEdit
      Left = 87
      Top = 94
      Width = 505
      Height = 21
      TabOrder = 4
    end
    object edtCEP: TMaskEdit
      Left = 87
      Top = 120
      Width = 78
      Height = 21
      EditMask = '00.000\-999;1;_'
      MaxLength = 10
      TabOrder = 5
      Text = '  .   -   '
    end
    object edtCidade: TEdit
      Left = 214
      Top = 120
      Width = 291
      Height = 21
      TabOrder = 6
    end
    object cbxUF: TComboBox
      Left = 536
      Top = 120
      Width = 56
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
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
    end
    object chbPrincipal: TCheckBox
      Left = 508
      Top = 17
      Width = 84
      Height = 17
      Caption = 'End. Principal'
      TabOrder = 8
    end
    object dbgPessoas: TDBGrid
      Left = 8
      Top = 151
      Width = 600
      Height = 129
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
