unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Main;

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
var editingStudent: String;
begin
    if (Length(FormEdit.EditStudent.Text) > 0) and (FormMain.ListBoxStudents.ItemIndex > -1) then
    begin
        editingStudent := FormMain.ListBoxStudents.Items[FormMain.ListBoxStudents.ItemIndex];
        FormMain.ListBoxStudents.Items[FormMain.ListBoxStudents.ItemIndex] := FormEdit.EditStudent.Text;
        Showmessage(editingStudent + ' успешно изменен(-а) на ' + FormEdit.EditStudent.Text + '!');
        FormEdit.EditStudent.Text := '';
        FormEdit.Hide;
        FormMain.Show;
    end
    else
    begin
        if FormMain.ListBoxStudents.ItemIndex = -1 then
        begin
            FormEdit.Hide;
            Showmessage('Не выбрано изменяемое поле!');
        end
        else
            Showmessage('Введите значение!');
    end
end;

end.

