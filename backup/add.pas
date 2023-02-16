unit Add;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Main, Person, PersonList;

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
        //FormMain.ListBoxStudents.Items.Add(FormAdd.EnterNewStudent.Text);
        if FormMain.ListBoxStudents.Count = 0 then
            Main.perList := TPersonList.Create();
        Main.perList.Add(TPerson.Create(EnterNewStudent.Text));
        FormMain.FillListBox(FormMain.ListBoxStudents, Main.perList);
        ShowMessage(EnterNewStudent.Text + ' успешно добавлен(-а)!');
        EnterNewStudent.Text := '';
        FormAdd.Close;
        FormMain.Show;
    end
    else
    begin      
        ShowMessage('Введите значение!');
    end;
end;

end.

