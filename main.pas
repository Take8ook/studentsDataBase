unit Main;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Contnrs, Person, PersonList;

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
        procedure FormDestroy(Sender: TObject);
        procedure FillListBox(lBox: TListBox; objList: TObjectList);
    private

    public

    end;

var
    FormMain: TFormMain;
    perList: TPersonList;

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
    fileName: string;
    data: string;
begin
    fileName := 'data/data.txt';
    if FileExists(fileName) then
    begin
        AssignFile(f, fileName);
        Reset(f);
        if Assigned(perList) then
            perList.Clear;
        while (not EOF(f)) do
        begin
            Readln(f, data);
            perList.Add(TPerson.Create(data));
            data := '';
        end;
        CloseFile(f);

        FillListBox(ListBoxStudents, perList);
    end
    else
    begin
        ShowMessage('Файла не существует!');
    end;
end;

procedure TFormMain.ButtonRemoveClick(Sender: TObject);
var
    deletedPerson: string;
begin
    if ListBoxStudents.ItemIndex > -1 then
    begin
	    deletedPerson := perList[ListBoxStudents.ItemIndex].ToString;
        perList.Delete(ListBoxStudents.ItemIndex);
        FillListBox(ListBoxStudents, perList);
	    ShowMessage(deletedPerson + ' успешно удален(-а)!');
    end;
end;

procedure TFormMain.ButtonSaveClick(Sender: TObject);
var
    f: TextFile;
    fileName: string;
    i: integer;
begin
    fileName := 'data/data.txt';

    AssignFile(f, fileName);
    Rewrite(f);

    for i := 0 to perList.Count - 1 do
    begin
        WriteLn(f, perList[i].ToString);
    end;

    ShowMessage('Сохранение успешно!');
    CloseFile(f);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
    perList := TPersonList.Create();
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
    perList.Free;
end;

procedure TFormMain.FillListBox(lBox: TListBox; objList: TObjectList);
var
    i: integer;
begin
    lBox.Items.Clear;
    for i := 0 to (objList.Count - 1)  do
        begin
            lBox.Items.Add(objList[i].ToString);
        end;
end;

end.