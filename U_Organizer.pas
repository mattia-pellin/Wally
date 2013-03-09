unit U_Organizer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBGrids, Data.DB, Data.SqlExpr, Data.DbxSqlite, Vcl.Menus;

type
  TF_Organizer = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBConnection: TSQLConnection;
    DBGrid1: TDBGrid;
    Menu: TMainMenu;
    M_Database: TMenuItem;
    M_NewCustomer: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  //  procedure ShowCustomers();
  end;

  TDatabase = class
  private
    Connector: TSQLConnection;
    function IsNumeric(Value: string; const AllowFloat: Boolean;
                       const TrimWhiteSpace: Boolean = True): Boolean;
  public
    Constructor Create(DBConn : TSQLConnection);

    procedure Connect(DBFile: String);
    procedure Disconnect;
    procedure RebuildStructure;
    procedure Query(QString: String);
    procedure AddCustomer(name, address, address_city, address_province, contact_phone,
                          contact_fax, contact_mail, tax_code, iban_code, deadline, notes: String;
                          address_number, address_zip: Word);

    function QueryRes(QString: String): TDataSet;
    function CheckStructure: Boolean;
    function FieldValueExists(field, value: String): Boolean;
  end;

var
  Database:     TDatabase;
  F_Organizer:  TF_Organizer;

implementation

uses
  U_Customer;

{$R *.dfm}

// Implementation of TDatabase Class
//------------------------------------------------------------------------------

constructor TDatabase.Create(DBConn : TSQLConnection);
begin
  Self.Connector := DBConn;
end;

function TDatabase.IsNumeric(Value: string; const AllowFloat: Boolean;
                             const TrimWhiteSpace: Boolean = True): Boolean;
var
  ValueInt: Int64;      // dummy integer value
  ValueFloat: Extended; // dummy float value
begin
  if TrimWhiteSpace then
    Value := Trim(Value);

  // Check for valid integer
  Result := TryStrToInt64(Value, ValueInt);

  if not Result and AllowFloat then
    // Wasn't valid as integer, try float
    Result := TryStrToFloat(Value, ValueFloat);
end;

procedure TDatabase.Connect(DBFile: String);
begin
  try
    Self.Connector.Params.Add('Database=' + DBFile);
    Self.Connector.Connected := True;
  except
    on E: EDatabaseError do
      begin
        MessageDlg('Impossibile aprire il Database (' + E.Message +')', mtError, [mbOK], 0);
        Application.Terminate;
      end;
  end;
end;

procedure TDatabase.Disconnect;
begin
  Self.Connector.Connected:= False;
end;

procedure TDatabase.Query(QString: String);
begin
 try
   Self.Connector.Execute(QString, nil, nil);
 except
   on E: Exception do
     MessageDlg('Impossibile eseguire la Query (' + E.Message +')', mtError, [mbOK], 0);
 end;
end;

function TDatabase.QueryRes(QString: String): TDataSet;
begin
 try
   Self.Connector.Execute(QString, nil, Result);
 except
   on E: Exception do
     MessageDlg('Impossibile eseguire la Query (' + E.Message +')', mtError, [mbOK], 0);
 end;
end;

function TDatabase.CheckStructure: Boolean;
var
  Query:    String;
  QueryRes: TDataSet;
begin
  Query:= 'SELECT COUNT(*) FROM sqlite_master WHERE type=''table'' AND (name = ''customers'' OR name = ''customer_history'');';
  QueryRes:= Self.QueryRes(Query);

  if (QueryRes.Fields[0].AsInteger >= 2) then
    Result:= True
  else
    Result:= False;
end;

function TDatabase.FieldValueExists(Field, Value: String): Boolean;
var
  Query:    String;
  QueryRes: TDataSet;
begin
  if not( IsNumeric(Value, False, True) ) then
    Query:= 'SELECT COUNT(*) FROM customers WHERE ' + Field +  ' = ''' + Value + ''';'
  else
    Query:= 'SELECT COUNT(*) FROM customers WHERE ' + Field +  ' = ' + Value + ';';

  QueryRes:= Self.QueryRes(Query);

  if (QueryRes.Fields[0].AsInteger >= 1) then
    Result:= True
  else
    Result:= False;
end;

procedure TDatabase.RebuildStructure;
var
  Query : String;
begin
  // Eventually rebuild Customers Table
  Query:= 'CREATE TABLE IF NOT EXISTS customers ( '
  + 'id INTEGER AUTO_INCREMENT, '
  + 'name varchar(50) NOT NULL, '
  + 'address varchar(50) NOT NULL, '
  + 'address_number int(4) NOT NULL, '
  + 'address_zip int(5) NOT NULL, '
  + 'address_city varchar(25) NOT NULL, '
  + 'address_province char(2) NOT NULL, '
  + 'contact_phone varchar(15) NOT NULL, '
  + 'contact_fax varchar(15) DEFAULT NULL, '
  + 'contact_mail varchar(50) DEFAULT NULL, '
  + 'tax_code varchar(16) DEFAULT NULL, '
  + 'iban_code char(27) DEFAULT NULL, '
  + 'deadline date DEFAULT NULL, '
  + 'notes text, '
  + 'PRIMARY KEY (id), '
  + 'UNIQUE (name), '
  + 'UNIQUE (address,address_number,address_zip,address_city,address_province) '
  + ');';
  Self.Query(Query);

  // Eventually rebuild Customer History Table
  Query:= 'CREATE TABLE IF NOT EXISTS customer_history ( '
  + 'cid INTEGER AUTO_INCREMENT, '
  + 'work_date date NOT NULL, '
  + 'work_notes text, '
  + 'PRIMARY KEY (cid), '
  + 'FOREIGN KEY (cid) REFERENCES customers (id) ON DELETE CASCADE ON UPDATE CASCADE '
  + ');';
  Self.Query(Query);
end;

procedure TDatabase.AddCustomer(name, address, address_city, address_province, contact_phone,
                                contact_fax, contact_mail, tax_code, iban_code, deadline, notes: String;
                                address_number, address_zip: Word);
var
  Query : String;
begin
  // Insert new Customer
  Query:= 'INSERT INTO customers ( '
  + 'name, address, address_number, address_zip, address_city, address_province, '
  + 'contact_phone, contact_fax, contact_mail, tax_code, iban_code, deadline, notes ) '
  + 'VALUES ( '
  + '''' + Trim(name) + ''', '
  + '''' + Trim(address) + ''', '
  + '''' + IntToStr(address_number) + ''', '
  + '''' + IntToStr(address_zip) + ''', '
  + '''' + Trim(address_city) + ''', '
  + '''' + Trim(address_province) + ''', '
  + '''' + Trim(contact_phone) + ''', '
  + '''' + Trim(contact_fax) + ''', '
  + '''' + Trim(contact_mail) + ''', '
  + '''' + Trim(tax_code) + ''', '
  + '''' + Trim(iban_code) + ''', '
  + '''' + Trim(deadline) + ''', '
  + '''' + Trim(notes) + ''' '
  + ' );';
  Self.Query(Query);
  MessageDlg('Il nuovo cliente è stato inserito correttamente', mtInformation, [mbOK], 0);
end;

//------------------------------------------------------------------------------

procedure ShowCustomers();
begin

end;

procedure TF_Organizer.BitBtn1Click(Sender: TObject);
begin
  F_Customer.Show;
end;

procedure TF_Organizer.FormCreate(Sender: TObject);
var
  ProgramDataFolder:   String;
begin
  ProgramDataFolder:= GetEnvironmentVariable('PROGRAMDATA');

  // Verifica struttura directory dati programma
  if not( DirectoryExists(ProgramDataFolder + '\Wally') ) then
    CreateDir(ProgramDataFolder + '\Wally\');

  // Verifica esistenza file Database
  if not( FileExists(ProgramDataFolder + '\Wally\Wally.db') ) then
    MessageDlg('Database non trovato, ne verrà creato uno di nuovo', mtWarning, [mbOK], 0);

  Database:= TDatabase.Create(DBConnection);
  Database.Connect(ProgramDataFolder + '\Wally\Wally.db');

  // Verifica struttura Database
  if not(Database.CheckStructure) then
    begin
      MessageDlg('Database vuoto o corrotto, la struttura verrà rispristinata', mtWarning, [mbOK], 0);
      Database.RebuildStructure;
    end;

  //Center application on screen
  F_Organizer.Left:= (Screen.Width - F_Organizer.Width) div 2;
  F_Organizer.Top:= (Screen.Height - F_Organizer.Height) div 2;
end;

procedure TF_Organizer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Database.Disconnect;
end;

end.
