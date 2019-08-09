unit unitabout;

{^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
CrossCompare

A simple application for comparing two lists of strings to produce a list
with unique or shared values. Allows simple VLookups without the use of
Excel or a similar application.

Copyright (C) 2019 Noah Wood (www.noahw.org)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, LCLIntf;

type

  { TFormAbout }

  TFormAbout = class(TForm)
    BtnOK: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MemoAbout: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    PanelBottom: TPanel;
    procedure BtnOKClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private

  public

  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.lfm}

{ TFormAbout }

procedure TFormAbout.Label4Click(Sender: TObject);
begin
  TLabel(Sender).Font.Color:=clPurple;
  OpenUrl('https://www.noahw.org');
end;

procedure TFormAbout.BtnOKClick(Sender: TObject);
begin
  Self.Close;
end;

end.

