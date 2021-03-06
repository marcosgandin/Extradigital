program TesteExtradigital;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {frmPrincipal},
  View.Cadastro.Pessoa in 'View.Cadastro.Pessoa.pas' {frmCadPessoa},
  View.Cadastro.Empresa in 'View.Cadastro.Empresa.pas' {frmCadEmpresa},
  View.Cadastro.Endereco in 'View.Cadastro.Endereco.pas' {frmCadEnderecos},
  uDM in 'uDM.pas' {dmPrincipal: TDataModule},
  uUtil in 'uUtil.pas',
  Model.Pessoa in 'Model.Pessoa.pas',
  Controller.Pessoa in 'Controller.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
