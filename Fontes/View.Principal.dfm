object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Teste Conhecimentos Delphi  - Extradigital'
  ClientHeight = 467
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mnuPrincipal
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mnuPrincipal: TMainMenu
    Left = 160
    Top = 24
    object mniCadastros: TMenuItem
      Caption = '&Cadastros'
      object mniPessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = mniPessoaClick
      end
      object mniEmpresa: TMenuItem
        Caption = 'Empresa'
        OnClick = mniEmpresaClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mniSair1: TMenuItem
        Caption = 'Sair'
        OnClick = mniSairClick
      end
    end
    object mniConsulta: TMenuItem
      Caption = 'C&onsulta'
      object mniFuncionrios: TMenuItem
        Caption = 'Funcion'#225'rios'
      end
    end
    object mniSair: TMenuItem
      Caption = '&Sair'
      OnClick = mniSairClick
    end
  end
end