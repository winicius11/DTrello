unit trello.organizations;

interface

uses
  {Winapi.Windows, Winapi.Messages, }System.SysUtils, System.Variants, System.Classes,
  trello.core, System.JSON, REST.Client, IPPeerCommon, dtrello.authenticator;

type
  Ttrello_organizations = class(Ttrello_base)
  public
    constructor Create(const AAuthenticator: TAuthenticator); override;
    destructor Destroy; override;

    function Get(const AParams: array of TJSONPair): TRESTResponse;
    function Post(const AParams: array of string): TRESTResponse;
    function Put(const Value: string;
                 const FieldName: string;
                 const AParams: string): TRESTResponse;
    function Delete(const Value: string): TRESTResponse;
  end;

implementation
  uses System.StrUtils, REST.Authenticator.OAuth,
       System.Threading, REST.Types, trello.authenticator, trello.constants;

resourcestring
  StrOrganizations = 'organizations';

constructor Ttrello_organizations.Create(const AAuthenticator: TAuthenticator);
begin
  inherited Create(AAuthenticator);
  EndPoint:= StrOrganizations;
end;

function Ttrello_organizations.Delete(const Value: string): TRESTResponse;
begin
  Exit;
  try
    Result:= Request(TRESTRequestMethod.rmDELETE,
      Format('%s/%s/%s', [TDTrelloContants.BaseUrl, EndPoint, Value]), []);
  except
    raise;
  end;
end;

destructor Ttrello_organizations.Destroy;
begin
  //
  inherited;
end;

function Ttrello_organizations.Get(
  const AParams: array of TJSONPair): TRESTResponse;
begin
  try
    Result:= Request(TRESTRequestMethod.rmGET,
      Format('%s/members/%s/%s', [TDTrelloContants.BaseUrl, Authenticator.User, EndPoint]), []);
  except
    raise;
  end;
end;

function Ttrello_organizations.Post(const AParams: array of string): TRESTResponse;
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

function Ttrello_organizations.Put(const Value: string;
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

end.
