unit uUtil;

interface

uses
  SysUtils, StdCtrls, Controls;

  function TestaCpf( xCPF:String ):Boolean;
  function TestaCgc(xCGC: String):Boolean;

implementation

function TestaCpf( xCPF:String ):Boolean;
var
  d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
  Check : String;
  I: integer;
begin
  I := 1;
  Check := '';
  while I < (Length(xCPF) + 1) do
  begin
    if xCPF[I] in ['0'..'9'] then
      Check := Check + xCPF[I];
    inc(I);
  end;
  xCPF := Check;
  Check := '';

  if ((xCPF = '')  or
     (xCPF = '00000000000')  or
     (xCPF = '11111111111')  or
     (xCPF = '22222222222')  or
     (xCPF = '33333333333')  or
     (xCPF = '44444444444')  or
     (xCPF = '55555555555')  or
     (xCPF = '66666666666')  or
     (xCPF = '77777777777')  or
     (xCPF = '88888888888')  or
     (xCPF = '99999999999') or
     (Length(xCPF) <> 11)) then
  begin
    Result := False;
    Exit;
  end;

  d1 := 0; d4 := 0; xx := 1;
  for nCount := 1 to Length( xCPF )-2 do
  begin
    if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
    begin
      d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
      d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
      xx := xx+1;
    end;
  end;

  resto := (d1 mod 11);
  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;

  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;

  Check := IntToStr(Digito1) + IntToStr(Digito2);
  if Check <> copy(xCPF,succ(length(xCPF)-2),2) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

function TestaCgc(xCGC: String):Boolean;
var
  d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
  Check : String;
  I: integer;
begin
  I := 1;
  Check := '';
  while I < (Length(xCGC) + 1) do
  begin
    if xCGC[I] in ['0'..'9'] then
      Check := Check + xCGC[I];
    inc(I);
  end;
  xCGC := Check;
  Check := '';

  if ((xCGC = '')  or
     (xCGC = '00000000000000')  or
     (xCGC = '11111111111111')  or
     (xCGC = '22222222222222')  or
     (xCGC = '33333333333333')  or
     (xCGC = '44444444444444')  or
     (xCGC = '55555555555555')  or
     (xCGC = '66666666666666')  or
     (xCGC = '77777777777777')  or
     (xCGC = '88888888888888')  or
     (xCGC = '99999999999999') or
     (Length(xCGC) <> 14)) then
  begin
    Result := False;
    Exit;
  end;

  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to Length( xCGC )-2 do
  begin
    if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
    begin
      if xx < 5 then
      begin
        fator := 6 - xx;
      end
      else
      begin
        fator := 14 - xx;
      end;

      d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
      if xx < 6 then
      begin
        fator := 7 - xx;
      end
      else
      begin
        fator := 15 - xx;
      end;
      d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
      xx := xx+1;
    end;
  end;

  resto := (d1 mod 11);
  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;

  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;

  Check := IntToStr(Digito1) + IntToStr(Digito2);
  if Check <> copy(xCGC,succ(length(xCGC)-2),2) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

end.
