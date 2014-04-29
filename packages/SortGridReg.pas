unit SortGridReg;

interface
             
procedure Register;

implementation
uses
  Classes, SortGrid;
    
procedure Register;
begin
  RegisterComponents('Delphi Zip', [TSortGrid] );
end; 

end.
