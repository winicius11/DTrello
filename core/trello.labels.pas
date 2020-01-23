unit trello.labels;

interface

uses
  {Winapi.Windows, Winapi.Messages, }System.SysUtils, System.Variants, System.Classes,
  trello.core, System.JSON, REST.Client, IPPeerCommon, dtrello.authenticator;

type
  Ttrello_labels = class(Ttrello_base)
  private
    FIdBoard: string;
    procedure SetIdBoard(const Value: string);
  public
    constructor Create(const AIdBoard: string; const AAuthenticator: TAuthenticator);
    destructor Destroy; override;

    function Get(const AParams: array of TJSONPair): TRESTResponse;
    function Post(const AParams: array of string): TRESTResponse;
    function Put(const Value: string;
                 const FieldName: string;
                 const AParams: string): TRESTResponse;
    function Delete(const Value: string): TRESTResponse;

    property IdBoard: string read FIdBoard write SetIdBoard;
  end;

implementation
  uses System.StrUtils, REST.Authenticator.OAuth,
       System.Threading, REST.Types, trello.authenticator, trello.constants;

resourcestring
  StrLabels = 'labels';

constructor Ttrello_labels.Create(const AIdBoard: string; const AAuthenticator: TAuthenticator);
begin
  inherited Create(AAuthenticator);
  FIdBoard := AIdBoard;
  EndPoint:= StrLabels;
end;

function Ttrello_labels.Delete(const Value: string): TRESTResponse;
begin
  Exit;
  try
    Result:= Request(TRESTRequestMethod.rmDELETE,
      Format('%s/%s/%s', [TDTrelloContants.BaseUrl, EndPoint, Value]), []);
  except
    raise;
  end;
end;

destructor Ttrello_labels.Destroy;
begin
  //
  inherited;
end;

function Ttrello_labels.Get(
  const AParams: array of TJSONPair): TRESTResponse;
begin
  try
    Result:= Request(TRESTRequestMethod.rmGET,
      Format('%s/boards/%s/%s', [TDTrelloContants.BaseUrl, FIdBoard, EndPoint]), []);
  except
    raise;
  end;
end;

function Ttrello_labels.Post(const AParams: array of string): TRESTResponse;
begin
  Exit;
  try
    Result:= Request(TRESTRequestMethod.rmPOST,
      Format('%s/%s', [TDTrelloContants.BaseUrl, EndPoint]),
      [TJSONPair.Create('name', AParams[0]),
       TJSONPair.Create('displayName', AParams[1]),
       TJSONPair.Create('desc', AParams[2]),
       TJSONPair.Create('website', AParams[3])]);
  except
    raise;
  end;
end;

function Ttrello_labels.Put(const Value: string;
                 const FieldName: string;
                 const AParams: string): TRESTResponse;
begin
  Exit;
  try
    Result:= Request(TRESTRequestMethod.rmPUT,
      Format('%s/%s/%s/%s', [TDTrelloContants.BaseUrl, EndPoint, Value, FieldName]),
      [TJSONPair.Create('value', AParams)]);
  except
    raise;
  end;
end;

procedure Ttrello_labels.SetIdBoard(const Value: string);
begin
  FIdBoard := Value;
end;

end.
