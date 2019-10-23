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
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent;
                            Operation: TOperation); override;
  public
    { Public declarations }
    function Insert(const AName: string): Boolean;
    procedure Refresh;
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
  uses System.Threading, trello.util, REST.Client, trello.Actions;

resourcestring
  StrInformeOIdentifica = 'Informe o identificador da lista.';
  StrComponentAuthentica = 'Component Authenticator não encontrado.';

{$R ..\Organizations.dcr}

procedure Register;
begin
  RegisterComponents('DTrello', [TActions]);
end;

function TActions.Delete(const AId: string): Boolean;
begin

end;

function TActions.Delete: Boolean;
begin

end;

function TActions.Edit(FieldName, Value: string): Boolean;
begin

end;

function TActions.Edit(const AId, FieldName, Value: string): Boolean;
begin

end;

function TActions.Insert(const AName: string): Boolean;
begin

end;

procedure TActions.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FAuthenticator)
    then FAuthenticator := nil;
  if (Operation = opRemove) and (AComponent = FDataSet)
    then FDataSet := nil;
end;

procedure TActions.Refresh;
begin

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
        TThread.Synchronize(nil,
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
                if Assigned(FOnActive) then
                  FOnActive(Self);
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
