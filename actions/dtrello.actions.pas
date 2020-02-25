//Jucelio Moura - juceliusdevelop@gmail.com
//https://www.youtube.com/channel/UCMDXBe5-lrP-T-molp2cSBg/videos
unit dtrello.actions;

interface

uses
  System.SysUtils, System.Classes, dtrello.authenticator,
  FireDAC.Comp.Client, Data.DB;

type
  TActions = class(TComponent)
  private
    FAuthenticator: TAuthenticator;
    FDataSet: TFDMemTable;
    FActive: Boolean;
    FIdCard: string;
    FOnActive: TNotifyEvent;
    FRootElement: string;
    procedure SetActive(const Value: Boolean);
    procedure SetAuthenticator(const Value: TAuthenticator);
    procedure SetDataSet(const Value: TFDMemTable);
    procedure SetIdCard(const Value: string);
    { Private declarations }
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent;
                            Operation: TOperation); override;
  public
    { Public declarations }
    function Insert(const AName: string): Boolean;
    function Edit(const AId, FieldName, Value: string): Boolean; overload;
    function Edit(FieldName, Value: string): Boolean; overload;
    function Delete: Boolean; overload;
    function Delete(const AId: string): Boolean; overload;
  published
    { Published declarations }
    property Authenticator: TAuthenticator read FAuthenticator write SetAuthenticator;
    property DataSet: TFDMemTable read FDataSet write SetDataSet;
    property Active: Boolean read FActive write SetActive default False;
    property IdCard: string read FIdCard write SetIdCard;
    property RootElement: string read FRootElement write FRootElement;

    // Events
    property OnActive: TNotifyEvent read FOnActive write FOnActive;
  end;

procedure Register;

implementation

uses System.Threading, trello.util, REST.Client, trello.actions;

{$R ..\Organizations.dcr}

resourcestring
  StrInformeOIdentifica = 'Informe o identificador da lista.';
  StrComponentAuthentica = 'Component Authenticator não encontrado.';

procedure Register;
begin
  RegisterComponents('DTrello', [TActions]);
end;

function TActions.Delete: Boolean;
begin
  Result:= FDataSet <> nil;
  if Result then
    Result:= Self.Delete(FDataSet.FieldByName('id').AsString);
end;

function TActions.Delete(const AId: string): Boolean;
begin
  Result:= False;
  with Ttrello_actions.Create(FIdCard, FAuthenticator) do
  begin
    try
      Result:= Delete(AId).StatusCode = 200;
    finally
      Free;
    end;
  end;
end;

function TActions.Edit(const AId, FieldName, Value: string): Boolean;
begin
  Result:= False;
  if FAuthenticator = nil then
    raise Exception.Create(StrComponentAuthentica);

  if Trim(FIdCard) = EmptyStr then
    raise Exception.Create(StrInformeOIdentifica);

  with Ttrello_actions.Create(FIdCard, FAuthenticator) do
  begin
    try
      Result:= Put(AId, FieldName, Value).StatusCode = 200;
    finally
      Free;
    end;
  end;
end;

function TActions.Edit(FieldName, Value: string): Boolean;
begin
  Result:= FDataSet <> nil;
  if Result then
    Result:= Self.Edit(FDataSet.FieldByName('id').AsString, FieldName, Value);
end;

function TActions.Insert(const AName: string): Boolean;
begin
  Result:= False;
  if FAuthenticator = nil then
    raise Exception.Create(StrComponentAuthentica);

  if Trim(FIdCard) = EmptyStr then
    raise Exception.Create(StrInformeOIdentifica);

  with Ttrello_actions.Create(FIdCard, FAuthenticator) do
  begin
    try
      Result:= Post([AName, FIdCard]).StatusCode = 200;
    finally
      Free;
    end;
  end;
end;

procedure TActions.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FAuthenticator)
    then FAuthenticator := nil;
  if (Operation = opRemove) and (AComponent = FDataSet)
    then FDataSet := nil;
end;

procedure TActions.SetActive(const Value: Boolean);
var
  loTask: ITask;
begin
  FActive := Value;
  if FActive then
  begin
    if FAuthenticator = nil then
      raise Exception.Create(StrComponentAuthentica);

    if Trim(FIdCard) = EmptyStr then
      raise Exception.Create(StrInformeOIdentifica);

    loTask:= TTask.Create(
      procedure ()
      begin
        TThread.Queue(nil,
        procedure
        begin
          with Ttrello_Actions.Create(FIdCard, FAuthenticator) do
          begin
            if FDataSet <> nil then
              FDataSet.DisableControls;
            try
              FDataSet.DataInJson(Get([]), true, RootElement);
            finally
              if FDataSet <> nil then
              begin
                if FDataSet.Active then
                FDataSet.First;
                FDataSet.EnableControls;

//                TThread.Queue(nil,
//                procedure
//                begin
                  if Assigned(FOnActive) then
                    FOnActive(Self);
//                end);
              end;
              Free;
            end;
          end;
        end);
      end
    );
    loTask.Start;
  end else
  begin
    if FDataSet <> nil then
      FDataSet.Close;
  end;
end;

procedure TActions.SetAuthenticator(const Value: TAuthenticator);
begin
  FAuthenticator := Value;
end;

procedure TActions.SetDataSet(const Value: TFDMemTable);
begin
  FDataSet := Value;
end;

procedure TActions.SetIdCard(const Value: string);
begin
  FIdCard := Value;
end;

end.
