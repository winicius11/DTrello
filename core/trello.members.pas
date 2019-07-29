unit trello.members;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  trello.core, System.JSON, REST.Client, IPPeerCommon, dtrello.authenticator;

type
  Ttrello_members = class(Ttrello_base)
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
  StrMembers = 'members';

constructor Ttrello_members.Create(const AIdBoard: string; const AAuthenticator: TAuthenticator);
begin
  inherited Create(AAuthenticator);
  EndPoint:= StrMembers;
  FIdBoard:= AIdBoard;
end;

function Ttrello_members.Delete(const Value: string): TRESTResponse;
begin
  try
    Result:= Request(TRESTRequestMethod.rmDELETE,
      Format('%s/%s/%s', [TDTrelloContants.BaseUrl, EndPoint, Value]), []);
  except
    raise;
  end;
end;

destructor Ttrello_members.Destroy;
begin
//
  inherited;
end;

function Ttrello_members.Get(const AParams: array of TJSONPair): TRESTResponse;
begin
  try
    Result:= Request(TRESTRequestMethod.rmGET,
      Format('%s/members/%s/%s', [TDTrelloContants.BaseUrl, IdBoard, EndPoint]), []);
  except
    raise;
  end;
end;

function Ttrello_members.Post(const AParams: array of string): TRESTResponse;
begin
  try
    Result:= Request(TRESTRequestMethod.rmPOST,
      Format('%s/%s', [TDTrelloContants.BaseUrl, EndPoint]),
      [TJSONPair.Create('name', AParams[0]),
       TJSONPair.Create('idMembers', Authenticator.Id),
       TJSONPair.Create('idList', AParams[1])]);
  except
    raise;
  end;
end;

function Ttrello_members.Put(const Value, FieldName,
  AParams: string): TRESTResponse;
begin
  try
    Result:= Request(TRESTRequestMethod.rmPUT,
      Format('%s/%s/%s/%s', [TDTrelloContants.BaseUrl, EndPoint, Value, FieldName]),
      [TJSONPair.Create('value', AParams)]);
  except
    raise;
  end;
end;

procedure Ttrello_members.SetIdBoard(const Value: string);
begin
  FIdBoard := Value;
end;

end.
