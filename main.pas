unit Main;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

    { TFormMain }

    TFormMain = class(TForm)
        ButtonLoad: TButton;
        ButtonSave: TButton;
        ButtonEdit: TButton;
        ButtonRemove: TButton;
        ButtonAdd: TButton;
        LabelTitle: TLabel;
        ListBoxStudents: TListBox;
        procedure ButtonAddClick(Sender: TObject);
        procedure ButtonEditClick(Sender: TObject);
        procedure ButtonLoadClick(Sender: TObject);
        procedure ButtonRemoveClick(Sender: TObject);
        procedure ButtonSaveClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    private

    public

    end;

var
    FormMain: TFormMain;

implementation uses Add, Edit;

{$R *.lfm}

{ TFormMain }

procedure TFormMain.ButtonAddClick(Sender: TObject);
begin
    Add.FormAdd.ShowModal;
end;

procedure TFormMain.ButtonEditClick(Sender: TObject);
begin
    Edit.FormEdit.ShowModal;
end;

procedure TFormMain.ButtonLoadClick(Sender: TObject);
var
    f: TextFile;
    fileName: String;
    data: String;
    i: Integer;
begin
    fileName := 'data/data.txt';
    if FileExists(fileName) then
    begin
        AssignFile(f, fileName);
        Reset(f);

        i := 0;
        ListBoxStudents.Items.Clear;
        while (not EOF(f)) do
        begin
            Readln(f, data);
            ListBoxStudents.Items.Add(data);
            data := '';
        end;

        CloseFile(f);
    end
    else
    begin
        Showmessage('Файла не существует!');
    end;
end;

procedure TFormMain.ButtonRemoveClick(Sender: TObject);
var
    deletedSurname: String;
begin
    if ListBoxStudents.ItemIndex > -1 then
    begin
	    deletedSurname := ListBoxStudents.Items[ListBoxStudents.ItemIndex];
	    ListBoxStudents.Items.Delete(ListBoxStudents.ItemIndex);
	    Showmessage(deletedSurname + ' успешно удален(-а)!');
    end;
end;

procedure TFormMain.ButtonSaveClick(Sender: TObject);
var
    f: TextFile;
    fileName: String;
    i: Integer;
begin
    fileName := 'data/data.txt';

    AssignFile(f, fileName);
    Rewrite(f);

    i := 0;
    while (i < ListBoxStudents.Items.Count) do
    begin
        Writeln(f, ListBoxStudents.Items[i]);
        i := i + 1;
    end;

    Showmessage('Сохранение успешно!');
    CloseFile(f);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin

end;

end.

