unit Person;

interface

uses SysUtils;

type
    TPerson = class(TObject)

    private
        firstName: string;

    public

        function getFirstName: string;

        function ToString: string; override;
        
        constructor Create(fullName: string);
    end;

implementation 

{ TPerson }

constructor TPerson.Create(fullName: string);
begin
    Self.firstName := fullName;
end;

function TPerson.getFirstName: string;
begin
    result := Self.firstName;
end;

function TPerson.ToString: string;
begin
    result := Self.lastName + ' ' + Self.firstName;
end;

end.

