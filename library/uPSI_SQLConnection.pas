unit uPSI_SQLConnection;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface
 

 
uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;
 
type 
(*----------------------------------------------------------------------------*)
  TPSImport_SQLConnection = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TSQLQuery(CL: TPSPascalCompiler);
procedure SIRegister_TSQLConnection(CL: TPSPascalCompiler);
procedure SIRegister_SQLConnection(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TSQLQuery(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSQLConnection(CL: TPSRuntimeClassImporter);
procedure RIRegister_SQLConnection(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   DB
  ,DBAccess
  ,Uni
  ,MemDS
  ,SQLConnection
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_SQLConnection]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TSQLQuery(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TSQLQuery') do
  with CL.AddClassN(CL.FindClass('TObject'),'TSQLQuery') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Procedure Open');
    RegisterMethod('Procedure Close');
    RegisterMethod('Procedure Next');
    RegisterMethod('Procedure First');
    RegisterMethod('Procedure Last');
    RegisterMethod('Procedure Previous');
    RegisterMethod('Function FieldByName( FieldName : AnsiString) : TField');
    RegisterMethod('Procedure Append');
    RegisterMethod('Procedure Edit');
    RegisterMethod('Procedure Post');
    RegisterMethod('Function Eof : boolean');
    RegisterProperty('Active', 'boolean', iptrw);
    RegisterProperty('Connection', 'TSQLConnection', iptrw);
    RegisterProperty('SQL', 'TStrings', iptr);
    RegisterProperty('SQLDelete', 'TStrings', iptr);
    RegisterProperty('SQLInsert', 'TStrings', iptr);
    RegisterProperty('SQLUpdate', 'TStrings', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TSQLConnection(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TSQLConnection') do
  with CL.AddClassN(CL.FindClass('TObject'),'TSQLConnection') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Procedure Open( )');
    RegisterMethod('Procedure Close( )');
    RegisterMethod('Procedure SetConnection( Query : TUniQuery)');
    RegisterProperty('ProviderName', 'AnsiString', iptrw);
    RegisterProperty('UserName', 'AnsiString', iptrw);
    RegisterProperty('Password', 'AnsiString', iptrw);
    RegisterProperty('Server', 'AnsiString', iptrw);
    RegisterProperty('Database', 'AnsiString', iptrw);
    RegisterProperty('Connected', 'boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_SQLConnection(CL: TPSPascalCompiler);
begin
  SIRegister_TSQLConnection(CL);
  SIRegister_TSQLQuery(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TSQLQuerySQLUpdate_R(Self: TSQLQuery; var T: TStrings);
begin T := Self.SQLUpdate; end;

(*----------------------------------------------------------------------------*)
procedure TSQLQuerySQLInsert_R(Self: TSQLQuery; var T: TStrings);
begin T := Self.SQLInsert; end;

(*----------------------------------------------------------------------------*)
procedure TSQLQuerySQLDelete_R(Self: TSQLQuery; var T: TStrings);
begin T := Self.SQLDelete; end;

(*----------------------------------------------------------------------------*)
procedure TSQLQuerySQL_R(Self: TSQLQuery; var T: TStrings);
begin T := Self.SQL; end;

(*----------------------------------------------------------------------------*)
procedure TSQLQueryActive_W(Self: TSQLQuery; const T: boolean);
begin Self.Active := T; end;

(*----------------------------------------------------------------------------*)
procedure TSQLQueryActive_R(Self: TSQLQuery; var T: boolean);
begin T := Self.Active; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionConnected_W(Self: TSQLConnection; const T: boolean);
begin Self.Connected := T; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionConnected_R(Self: TSQLConnection; var T: boolean);
begin T := Self.Connected; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionDatabase_W(Self: TSQLConnection; const T: AnsiString);
begin Self.Database := T; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionDatabase_R(Self: TSQLConnection; var T: AnsiString);
begin T := Self.Database; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionServer_W(Self: TSQLConnection; const T: AnsiString);
begin Self.Server := T; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionServer_R(Self: TSQLConnection; var T: AnsiString);
begin T := Self.Server; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionPassword_W(Self: TSQLConnection; const T: AnsiString);
begin Self.Password := T; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionPassword_R(Self: TSQLConnection; var T: AnsiString);
begin T := Self.Password; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionUserName_W(Self: TSQLConnection; const T: AnsiString);
begin Self.UserName := T; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionUserName_R(Self: TSQLConnection; var T: AnsiString);
begin T := Self.UserName; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionProviderName_W(Self: TSQLConnection; const T: AnsiString);
begin Self.ProviderName := T; end;

(*----------------------------------------------------------------------------*)
procedure TSQLConnectionProviderName_R(Self: TSQLConnection; var T: AnsiString);
begin T := Self.ProviderName; end;

(*----------------------------------------------------------------------------*)
procedure TSQLQueryConnection_W(Self: TSQLQuery; const T: TSQLConnection);
begin Self.Connection := T; end;

(*----------------------------------------------------------------------------*)
procedure TSQLQueryConnection_R(Self: TSQLQuery; var T: TSQLConnection);
begin T := Self.Connection; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSQLQuery(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSQLQuery) do
  begin
    RegisterConstructor(@TSQLQuery.Create, 'Create');
    RegisterMethod(@TSQLQuery.Open, 'Open');
    RegisterMethod(@TSQLQuery.Close, 'Close');
    RegisterMethod(@TSQLQuery.Next, 'Next');
    RegisterMethod(@TSQLQuery.First, 'First');
    RegisterMethod(@TSQLQuery.Last, 'Last');
    RegisterMethod(@TSQLQuery.Previous, 'Previous');
    RegisterMethod(@TSQLQuery.FieldByName, 'FieldByName');
    RegisterMethod(@TSQLQuery.Append, 'Append');
    RegisterMethod(@TSQLQuery.Edit, 'Edit');
    RegisterMethod(@TSQLQuery.Post, 'Post');
    RegisterMethod(@TSQLQuery.Eof, 'Eof');
    RegisterPropertyHelper(@TSQLQueryActive_R,@TSQLQueryActive_W,'Active');
    RegisterPropertyHelper(@TSQLQueryConnection_R,@TSQLQueryConnection_W,'Connection');
    RegisterPropertyHelper(@TSQLQuerySQL_R,nil,'SQL');
    RegisterPropertyHelper(@TSQLQuerySQLDelete_R,nil,'SQLDelete');
    RegisterPropertyHelper(@TSQLQuerySQLInsert_R,nil,'SQLInsert');
    RegisterPropertyHelper(@TSQLQuerySQLUpdate_R,nil,'SQLUpdate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TSQLConnection(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSQLConnection) do
  begin
    RegisterConstructor(@TSQLConnection.Create, 'Create');
    RegisterMethod(@TSQLConnection.Open, 'Open');
    RegisterMethod(@TSQLConnection.Close, 'Close');
    RegisterPropertyHelper(@TSQLConnectionProviderName_R,@TSQLConnectionProviderName_W,'ProviderName');
    RegisterPropertyHelper(@TSQLConnectionUserName_R,@TSQLConnectionUserName_W,'UserName');
    RegisterPropertyHelper(@TSQLConnectionPassword_R,@TSQLConnectionPassword_W,'Password');
    RegisterPropertyHelper(@TSQLConnectionServer_R,@TSQLConnectionServer_W,'Server');
    RegisterPropertyHelper(@TSQLConnectionDatabase_R,@TSQLConnectionDatabase_W,'Database');
    RegisterPropertyHelper(@TSQLConnectionConnected_R,@TSQLConnectionConnected_W,'Connected');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_SQLConnection(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TSQLConnection(CL);
  RIRegister_TSQLQuery(CL);
end;

 
 
{ TPSImport_SQLConnection }
(*----------------------------------------------------------------------------*)
procedure TPSImport_SQLConnection.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_SQLConnection(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_SQLConnection.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_SQLConnection(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.