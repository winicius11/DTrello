unit trello.actions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  trello.core, System.JSON, REST.Client, IPPeerCommon, dtrello.authenticator;

type
  Ttrello_actions = class(Ttrello_base)
  private
    FIdCard: string;
    procedure SetIdCard(const Value: string);
  public
    constructor Create(const AIdCard: string; const AAuthenticator: TAuthenticator);
    destructor Destroy; override;

    function Get(const AParams: array of TJSONPair): TRESTResponse;
    function Post(const AParams: array of string): TRESTResponse;
    function Put(const Value: string;
                 const FieldName: string;
                 const AParams: string): TRESTResponse;
    function Delete(const Value: string): TRESTResponse;

    property IdCard: string read FIdCard write SetIdCard;
  end;

implementation
  uses System.StrUtils, REST.Authenticator.OAuth,
       System.Threading, REST.Types, trello.authenticator, trello.constants;

resourcestring
  StrActions = 'actions';

{ Ttrello_boards }

constructor Ttrello_actions.Create(const AIdCard: string; const AAuthenticator: TAuthenticator);
begin
  inherited Create(AAuthenticator);
  EndPoint:= StrActions;
  FIdCard:= AIdCard;
end;

function Ttrello_actions.Delete(const Value: string): TRESTResponse;
begin
  Exit;
  try
    Result:= Request(TRESTRequestMethod.rmDELETE,
      Format('%s/%s/%s', [TDTrelloContants.BaseUrl, EndPoint, Value]), []);
  except
    raise;
  end;
end;

destructor Ttrello_actions.Destroy;
begin
//
  inherited;
end;

function Ttrello_actions.Get(const AParams: array of TJSONPair): TRESTResponse;
begin
  try
    Result:= Request(TRESTRequestMethod.rmGET,
      Format('%s/cards/%s/%s', [TDTrelloContants.BaseUrl, IdCard, EndPoint]), []);
  except
    raise;
  end;
end;

function Ttrello_actions.Post(const AParams: array of string): TRESTResponse;
begin
  Exit;
  try
    Result:= Request(TRESTRequestMethod.rmPOST,
      Format('%s/%s', [TDTrelloContants.BaseUrl, EndPoint]),
      [TJSONPair.Create('name', AParams[0]),
       TJSONPair.Create('idBoard', AParams[1])]);
  except
    raise;
  end;
end;

function Ttrello_actions.Put(const Value, FieldName,
  AParams: string): TRESTResponse;
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

procedure Ttrello_actions.SetIdCard(const Value: string);
begin
  FIdCard := Value;
end;

end.
