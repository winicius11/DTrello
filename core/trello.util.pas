unit trello.util;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client,
  REST.Client, REST.Response.Adapter;

type
  TTFDMemTableHelper = class helper for TFDMemTable
    procedure DataInJson(const Value: TRESTResponse; const AOpen: Boolean = True; RootElement: string = '');
  end;

implementation

{ TTFDMemTableHelper }

procedure TTFDMemTableHelper.DataInJson(const Value: TRESTResponse; const AOpen: Boolean = True; RootElement: string = '');
var
  loRESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
begin
  Self.Close;
  if Value.content = '[]' then
    Exit;

  loRESTResponseDataSetAdapter:= TRESTResponseDataSetAdapter.Create(nil);
  try
    loRESTResponseDataSetAdapter.StringFieldSize := 5000;
    loRESTResponseDataSetAdapter.RootElement    := RootElement;
    loRESTResponseDataSetAdapter.NestedElements := true;
    loRESTResponseDataSetAdapter.NestedElementsDepth := 5;
    loRESTResponseDataSetAdapter.Dataset:= Self;
    loRESTResponseDataSetAdapter.Response:= Value;
    if AOpen then
    Self.Open;
  finally
    FreeAndNil(loRESTResponseDataSetAdapter);
  end;
end;

end.
