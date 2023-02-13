unit Add;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Main;

type

    { TFormAdd }

    TFormAdd = class(TForm)
        ButtonAdd: TButton;
        EnterNewStudent: TEdit;
        LabelTitle: TLabel;
        procedure ButtonAddClick(Sender: TObject);
        procedure EnterNewStudentChange(Sender: TObject);
    private

    public

    end;

var
    FormAdd: TFormAdd;

implementation

{$R *.lfm}

{ TFormAdd }

procedure TFormAdd.EnterNewStudentChange(Sender: TObject);
begin

end;

procedure TFormAdd.ButtonAddClick(Sender: TObject);
begin
    if Length(FormAdd.EnterNewStudent.Text) > 0 then
    begin
        FormMain.ListBoxStudents.Items.Add(FormAdd.EnterNewStudent.Text);
        Showmessage(FormAdd.EnterNewStudent.Text + ' успешно добавлен(-а)!');
        FormAdd.EnterNewStudent.Text := '';
        FormAdd.Hide;
        FormMain.Show;
    end
    else
    begin      
        Showmessage('Введите значение!');
    end;
end;

end.

