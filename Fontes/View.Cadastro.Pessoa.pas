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
    RadioGroup1: TRadioGroup;
    Label5: TLabel;
    edtTelefone: TMaskEdit;
    dbgPessoas: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoa: TfrmCadPessoa;

implementation

uses
  View.Cadastro.Endereco, uDM;

{$R *.dfm}

procedure TfrmCadPessoa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.


{
procedure TfAcesso.procCadastraCPF(nuCPF: string);
var
  vlcNuCPF: string;
begin
  try
    vlcNuCPF := '';
    if nuCPF = '' then
      vlcNuCPF := InputBox('CPF','Seu cadastro está sem o número do seu CPF, ' +
                           'favor informá-lo. (Digite somente números)','')
    else vlcNuCPF := nuCPF;
    if vlcNuCPF <> '' then
    begin
      if not(TestaCPF(vlcNuCPF)) then
      begin
        MessageDlg('CPF inválido!',mtError,[mbOk],0);
        PostMessage(Self.Handle,WM_CPF,0,0);
        SysUtils.abort;
      end
      else
      begin
        qryValidaCPF.close;
        qryValidaCPF.Parameters.ParamByName('NUCPF').value := vlcNuCPF;
        qryValidaCPF.open;
        if not(qryValidaCPF.IsEmpty) then
        begin
          MessageDlg('CPF já cadasstrado!',mtError,[mbOk],0);
          PostMessage(Self.Handle,WM_CPF,0,0);
          SysUtils.abort;
        end;
        qryAtualizaCPF.Parameters.ParamByName('IDUSUARIO').value := edUsuario.text;
        qryAtualizaCPF.Parameters.ParamByName('NUCPF').value := vlcNuCPF;
        qryAtualizaCPF.ExecSQL;
      end;
    end
    else SysUtils.abort;
  finally
  end;
end;
}