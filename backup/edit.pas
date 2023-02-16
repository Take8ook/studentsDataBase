unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Main, Person;

type

    { TFormEdit }

    TFormEdit = class(TForm)
        ButtonEdit: TButton;
        EditStudent: TEdit;
        LabelTitle: TLabel;
        procedure ButtonEditClick(Sender: TObject);
    private

    public

    end;

var
    FormEdit: TFormEdit;

implementation

{$R *.lfm}

{ TFormEdit }

procedure TFormEdit.ButtonEditClick(Sender: TObject);
var
    editingStudent: String;
    index: integer;
    somePerson: TPerson;
begin
    if (Length(FormEdit.EditStudent.Text) > 0) and (FormMain.ListBoxStudents.ItemIndex > -1) then
    begin
        editingStudent := FormMain.ListBoxStudents.Items[FormMain.ListBoxStudents.ItemIndex];
        //FormMain.ListBoxStudents.Items[FormMain.ListBoxStudents.ItemIndex] := FormEdit.EditStudent.Text;
        //Main.perList[FormMain.ListBoxStudents.ItemIndex].firstName = (FormEdit.EditStudent.Text);
        somePerson := TPerson.Create(FormEdit.EditStudent.Text);
        index := FormMain.ListBoxStudents.ItemIndex;
        Main.perList.Delete(index);
        Main.perList.Insert(index, somePerson);
        FormMain.FillListBox(FormMain.ListBoxStudents, Main.perList);
        ShowMessage(editingStudent + ' успешно изменен(-а) на ' + FormEdit.EditStudent.Text + '!');
        FormEdit.EditStudent.Text := '';
        FormEdit.Close;
        FormMain.Show;
    end
    else
    begin
        if FormMain.ListBoxStudents.ItemIndex = -1 then
        begin
            FormEdit.Close;
            FormEdit.EditStudent.Text := '';
            ShowMessage('Не выбрано изменяемое поле!');
        end
        else
            ShowMessage('Введите значение!');
    end
end;

end.

