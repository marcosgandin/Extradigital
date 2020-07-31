unit View.Cadastro.Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadEmpresa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnEnderecos: TBitBtn;
    btnFechar: TBitBtn;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtCNPJ: TMaskEdit;
    Label5: TLabel;
    edtTelefone: TMaskEdit;
    dbgPessoas: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure btnEnderecosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

uses
  View.Cadastro.Endereco, uDM;

{$R *.dfm}

procedure TfrmCadEmpresa.btnEnderecosClick(Sender: TObject);
begin
  frmCadEnderecos := TfrmCadEnderecos.Create(Application);
  frmCadEnderecos.ShowModal;
  if frmCadEnderecos <> nil then
    frmCadEnderecos.Free;
end;

procedure TfrmCadEmpresa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.

{
          if not(TestaCgc(qryCadastroNU_CNPJ_CPF.AsString)) and ((not(btnRestaurar.Focused))) then
          begin
            MessageDlg('CNPJ inválido!',mtError,[mbOk],0);
            edtFornecedor.SetFocus;
            abort;
          end;
}