unit Model.Pessoa;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uDM;

type
  TPessoa = class
  private
    FIdPessoa: Integer;
    FNomePessoa: string;
    FCPF: string;
    FDataNascimento: TDate;
    FSexo: string;
    FTelefone: string;
    FDataCadastro: TDateTime;
  public
    constructor Create;
    procedure Salvar(const objetoCliente: TPessoa);
    procedure Atualizar(const objetoCliente: TPessoa);

    property IdPessoa: integer read FIdPessoa write FIdPessoa;
    property NomePessoa: string read FNomePessoa write FNomePessoa;
    property CPF: string read FCPF write FCPF;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
    property Sexo: string read FSexo write FSexo;
    property Telefone: string read FTelefone write FTelefone;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
  end;

implementation

{ TPessoa }

procedure TPessoa.Atualizar(const objetoCliente: TPessoa);
begin
  dmPrincipal.qryGeral.Close;
  dmPrincipal.qryGeral.SQL.Clear;
  dmPrincipal.qryGeral.SQL.Add('UPDATE PESSOA SET ');
  dmPrincipal.qryGeral.SQL.Add('  NomePessoa = :NomePessoa, ');
  dmPrincipal.qryGeral.SQL.Add('  CPF = :CPF, ');
  dmPrincipal.qryGeral.SQL.Add('  DataNascimento = :DataNascimento, ');
  dmPrincipal.qryGeral.SQL.Add('  Sexo = :Sexo, ');
  dmPrincipal.qryGeral.SQL.Add('  Telefone = :Telefone, ');
  dmPrincipal.qryGeral.SQL.Add('  DataCadastro = :DataCadastro ');
  dmPrincipal.qryGeral.SQL.Add('WHERE IdPessoa = :IdPessoa ');

  dmPrincipal.qryGeral.ParamByName('IdPessoa').AsInteger := Self.FIdPessoa;
  dmPrincipal.qryGeral.ParamByName('NomePessoa').AsString := Self.NomePessoa;
  dmPrincipal.qryGeral.ParamByName('CPF').AsString := Self.FCPF;
  dmPrincipal.qryGeral.ParamByName('DataNascimento').AsDate := Self.FDataNascimento;
  dmPrincipal.qryGeral.ParamByName('Sexo').AsString := Self.FSexo;
  dmPrincipal.qryGeral.ParamByName('Telefone').AsString := Self.FTelefone;
  dmPrincipal.qryGeral.ParamByName('DataCadastro').AsDateTime := Now;

  try
    dmPrincipal.qryGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao atualizar dados na tabela de Pessoas. Verifique!');
  end;
end;

constructor TPessoa.Create;
begin
  FNomePessoa := '';
  FCPF := '';
  FSexo := '';
  FTelefone := '';
  FDataCadastro := Now;
end;

procedure TPessoa.Salvar(const objetoCliente: TPessoa);
begin
  dmPrincipal.qryGeral.Close;
  dmPrincipal.qryGeral.SQL.Clear;
  dmPrincipal.qryGeral.SQL.Add('INSERT INTO PESSOA ');
  dmPrincipal.qryGeral.SQL.Add('  (IdPessoa, NomePessoa, CPF, DataNascimento, ');
  dmPrincipal.qryGeral.SQL.Add('   Sexo, Telefone, DataCadastro) ');
  dmPrincipal.qryGeral.SQL.Add('VALUES ');
  dmPrincipal.qryGeral.SQL.Add('  (:IdPessoa, :NomePessoa, :CPF, :DataNascimento, ');
  dmPrincipal.qryGeral.SQL.Add('   :Sexo, :Telefone, :DataCadastro) ');

  dmPrincipal.qryGeral.ParamByName('IdPessoa').AsInteger := Self.FIdPessoa;
  dmPrincipal.qryGeral.ParamByName('NomePessoa').AsString := Self.NomePessoa;
  dmPrincipal.qryGeral.ParamByName('CPF').AsString := Self.FCPF;
  dmPrincipal.qryGeral.ParamByName('DataNascimento').AsDate := Self.FDataNascimento;
  dmPrincipal.qryGeral.ParamByName('Sexo').AsString := Self.FSexo;
  dmPrincipal.qryGeral.ParamByName('Telefone').AsString := Self.FTelefone;
  dmPrincipal.qryGeral.ParamByName('DataCadastro').AsDateTime := Now;

  try
    dmPrincipal.qryGeral.ExecSQL;
  except
    raise Exception.Create('Erro ao incluir dados na tabela de Pessoas. Verifique!');
  end;
end;

end.
