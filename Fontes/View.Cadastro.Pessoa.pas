unit View.Cadastro.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadPessoa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnEnderecos: TBitBtn;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtCPF: TMaskEdit;
    Label4: TLabel;
    edtNascimento: TDateTimePicker;
    rgpSexo: TRadioGroup;
    Label5: TLabel;
    edtTelefone: TMaskEdit;
    dbgPessoas: TDBGrid;
    btnEditar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure btnEnderecosClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaCampos(Status: Boolean);
  public
    { Public declarations }
  end;

type
  TStatus = (Incluir, Editar);

var
  frmCadPessoa: TfrmCadPessoa;

implementation

uses
  View.Cadastro.Endereco, Controller.Pessoa, Model.Pessoa, uDM;

{$R *.dfm}

procedure TfrmCadPessoa.btnEditarClick(Sender: TObject);
var
  Status: TStatus;
begin
  Status := Editar;
  HabilitaCampos(False);
end;

procedure TfrmCadPessoa.btnEnderecosClick(Sender: TObject);
begin
  frmCadEnderecos := TfrmCadEnderecos.Create(Application);
  frmCadEnderecos.ShowModal;
  if frmCadEnderecos <> nil then
    frmCadEnderecos.Free;
end;

procedure TfrmCadPessoa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPessoa.btnNovoClick(Sender: TObject);
var
  objetoPessoa: TPessoa;
  Status: TStatus;
begin
  objetoPessoa := TPessoa.Create;

  try
    HabilitaCampos(False);
    Status := Incluir;
    btnNovo.Enabled := False;
    btnEditar.Enabled := False;
    edtCodigo.Text := IntToStr(dmPrincipal.GeneratorID('GEN_PESSOA_ID',dmPrincipal.FDConnection));
    edtNome.Text := objetoPessoa.NomePessoa;
    edtCPF.Text := objetoPessoa.CPF;
    edtTelefone.Text := objetoPessoa.Telefone;
    rgpSexo.ItemIndex := -1;

    edtNome.SetFocus;
  finally
    FreeAndNil(objetoPessoa);
  end;
end;

procedure TfrmCadPessoa.btnSalvarClick(Sender: TObject);
var
  objetoPessoa: TPessoa;
  objetoControle: TControllerPessoa;
  Status: TStatus;
begin
  objetoPessoa := TPessoa.Create;
  objetoControle := TControllerPessoa.Create;

  try
    objetoPessoa.IdPessoa := StrToInt(edtCodigo.Text);
    objetoPessoa.NomePessoa := Trim(edtNome.Text);
    objetoPessoa.CPF := edtCPF.Text;
    objetoPessoa.Telefone := edtTelefone.Text;
    objetoPessoa.DataNascimento := edtNascimento.Date;
    case rgpSexo.ItemIndex of
      0 : objetoPessoa.Sexo := 'M';
      1 : objetoPessoa.Sexo := 'F';
    end;

    case Status of
      Incluir : objetoControle.Salvar(objetoPessoa);
      Editar : objetoControle.Atualizar(objetoPessoa);
    end;

    HabilitaCampos(True);
    btnNovo.Enabled := True;
    btnEditar.Enabled := True;
  finally
    FreeAndNil(objetoPessoa);
    FreeAndNil(objetoControle);
  end;
end;

procedure TfrmCadPessoa.FormShow(Sender: TObject);
begin
  dmPrincipal.MostraDadosPessoas;
  HabilitaCampos(True);
end;

procedure TfrmCadPessoa.HabilitaCampos(Status: Boolean);
begin
  edtNome.ReadOnly := Status;
  edtCPF.ReadOnly := Status;
  edtNascimento.Enabled := Status;
  edtTelefone.ReadOnly := Status;
  rgpSexo.Enabled := Status;
end;

end.
