unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Forms;

type
  TdmPrincipal = class(TDataModule)
    FDConnection: TFDConnection;
    qryGeral: TFDQuery;
    dtsGeral: TDataSource;
    qryMostraDadosPessoas: TFDQuery;
    dtsMostraDadosPessoas: TDataSource;
    qryMostraDadosPessoasIDPESSOA: TIntegerField;
    qryMostraDadosPessoasNOMEPESSOA: TStringField;
    qryMostraDadosPessoasCPF: TStringField;
    qryMostraDadosPessoasDATANASCIMENTO: TDateField;
    qryMostraDadosPessoasSEXO: TStringField;
    qryMostraDadosPessoasTELEFONE: TStringField;
    qryMostraDadosPessoasDATACADASTRO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryMostraDadosPessoasSEXOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryMostraDadosPessoasAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function GeneratorID (aName: string; Connection: TFDConnection): integer;
    procedure MostraDadosPessoas;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses
  View.Cadastro.Pessoa;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  try
    FDConnection.Connected := True;
  except
    Application.MessageBox('Houve Problemas ao conectar a base de dados!','CONEX�O FALHOU');
  end;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  FDConnection.Connected := False;
end;

function TdmPrincipal.GeneratorID(aName: string;
  Connection: TFDConnection): integer;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := Connection;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT GEN_ID('+aName+', 1) FROM RDB$DATABASE');
    Qry.Open;

    Result := Qry.Fields[0].AsInteger;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TdmPrincipal.MostraDadosPessoas;
begin
  qryMostraDadosPessoas.Close;
  qryMostraDadosPessoas.SQL.Clear;
  qryMostraDadosPessoas.SQL.Add('select * from pessoa');
  qryMostraDadosPessoas.Open;
end;

procedure TdmPrincipal.qryMostraDadosPessoasAfterScroll(DataSet: TDataSet);
begin
  frmCadPessoa.edtCodigo.Text := IntToStr(qryMostraDadosPessoasIDPESSOA.AsInteger);
  frmCadPessoa.edtNome.Text := qryMostraDadosPessoasNOMEPESSOA.AsString;
  frmCadPessoa.edtCPF.Text := qryMostraDadosPessoasCPF.AsString;
  frmCadPessoa.edtNascimento.DateTime := qryMostraDadosPessoasDATANASCIMENTO.AsDateTime;
  frmCadPessoa.edtTelefone.Text := qryMostraDadosPessoasTELEFONE.AsString;
  if qryMostraDadosPessoasSEXO.AsString = 'M' then
    frmCadPessoa.rgpSexo.ItemIndex := 0
  else if qryMostraDadosPessoasSEXO.AsString = 'F' then
    frmCadPessoa.rgpSexo.ItemIndex := 1
  else
    frmCadPessoa.rgpSexo.ItemIndex := -1;
end;

procedure TdmPrincipal.qryMostraDadosPessoasSEXOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if qryMostraDadosPessoasSEXO.AsString = 'M' then
    Text := 'Masculino'
  else
    Text := 'Feminino';
end;

end.
