unit trello.constants;

interface

uses
  {Winapi.Windows, Winapi.Messages, }System.SysUtils, System.Classes;

type
  TDTrelloContants = class
  public
    const
//      wm_deletecard = WM_USER + 1;
      BaseUrl = 'https://api.trello.com/1';
  end;

implementation

end.
