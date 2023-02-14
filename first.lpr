program first;

{$mode objfpc}{$H+}

uses
    {$IFDEF UNIX}
    cthreads,
    {$ENDIF}
    {$IFDEF HASAMIGA}
    athreads,
    {$ENDIF}
    Interfaces,
    Forms, main, add, edit;

{$R *.res}

begin
    RequireDerivedFormResource:=True;
    Application.Scaled:=True;
    Application.Initialize;
    Application.CreateForm(TFormMain, FormMain);
    Application.CreateForm(TFormAdd, FormAdd);
    Application.CreateForm(TFormEdit, FormEdit);
    Application.Run;

end.

