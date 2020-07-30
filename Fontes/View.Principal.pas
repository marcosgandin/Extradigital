unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    mniCadastros: TMenuItem;
    mniConsulta: TMenuItem;
    mniSair: TMenuItem;
    mniPessoa: TMenuItem;
    mniEmpresa: TMenuItem;
    N1: TMenuItem;
    mniSair1: TMenuItem;
    mniFuncionrios: TMenuItem;
    procedure mniSairClick(Sender: TObject);
    procedure mniPessoaClick(Sender: TObject);
    procedure mniEmpresaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  View.Cadastro.Pessoa, View.Cadastro.Empresa, uDM;

{$R *.dfm}

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dmPrincipal := TdmPrincipal.Create(Self);
end;

procedure TfrmPrincipal.mniEmpresaClick(Sender: TObject);
begin
  frmCadEmpresa := TfrmCadEmpresa.Create(Application);
  frmCadEmpresa.ShowModal;
  if frmCadEmpresa <> nil then
    frmCadEmpresa.Free;
end;

procedure TfrmPrincipal.mniPessoaClick(Sender: TObject);
begin
  frmCadPessoa := TfrmCadPessoa.Create(Application);
  frmCadPessoa.ShowModal;
  if frmCadPessoa <> nil then
    frmCadPessoa.Free;
end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
  Close;
end;

end.
