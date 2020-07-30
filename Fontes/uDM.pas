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
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    function GeneratorID (aName: string; Connection: TFDConnection): integer;
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

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

end.