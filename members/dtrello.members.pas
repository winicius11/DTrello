unit dtrello.members;

interface

uses
  System.SysUtils, System.Classes, dtrello.authenticator,
  FireDAC.Comp.Client, Data.DB;

type
  TMembers = class(TComponent)
  private
    FAuthenticator: TAuthenticator;
    FDataSet: TFDMemTable;
    FActive: Boolean;
    FIdBoard: string;
    FOnActive: TNotifyEvent;
    procedure SetActive(const Value: Boolean);
    procedure SetAuthenticator(const Value: TAuthenticator);
    procedure SetDataSet(const Value: TFDMemTable);
    procedure SetIdBoard(const Value: string);
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
    property IdBoard: string read FIdBoard write SetIdBoard;

    // Events
    property OnActive: TNotifyEvent read FOnActive write FOnActive;
  end;

procedure Register;

implementation
  uses System.Threading, trello.util, REST.Client, trello.members;

resourcestring
  StrInformeOIdentifica = 'Informe o identificador da lista.';
  StrComponentAuthentica = 'Component Authenticator não encontrado.';

{$R ..\Organizations.dcr}

procedure Register;
begin
  RegisterComponents('DTrello', [TMembers]);
end;

function TMembers.Delete(const AId: string): Boolean;
begin

end;

function TMembers.Delete: Boolean;
begin

end;

function TMembers.Edit(FieldName, Value: string): Boolean;
begin

end;

function TMembers.Edit(const AId, FieldName, Value: string): Boolean;
begin

end;

function TMembers.Insert(const AName: string): Boolean;
begin

end;

procedure TMembers.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FAuthenticator)
    then FAuthenticator := nil;
  if (Operation = opRemove) and (AComponent = FDataSet)
    then FDataSet := nil;
end;

procedure TMembers.Refresh;
begin

end;

procedure TMembers.SetActive(const Value: Boolean);
var
  loTask: ITask;
begin
  FActive := Value;
  if FActive then
  begin
    if FAuthenticator = nil then
      raise Exception.Create(StrComponentAuthentica);

    if Trim(FIdBoard) = EmptyStr then
      raise Exception.Create(StrInformeOIdentifica);

    loTask:= TTask.Create(
      procedure ()
      begin
        TThread.Synchronize(nil,
        procedure
        begin
          with Ttrello_members.Create(FIdBoard, FAuthenticator) do
          begin
            if FDataSet <> nil then
              FDataSet.DisableControls;
            try
              FDataSet.DataInJson(Get([]));
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

procedure TMembers.SetAuthenticator(const Value: TAuthenticator);
begin
  FAuthenticator := Value;
end;

procedure TMembers.SetDataSet(const Value: TFDMemTable);
begin
  FDataSet := Value;
end;

procedure TMembers.SetIdBoard(const Value: string);
begin
  FIdBoard := Value;
end;

end.
