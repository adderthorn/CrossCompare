unit unitoptions;

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
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ValEdit, ExtCtrls,
  ButtonPanel, PopupNotifier, StdCtrls, Buttons, DividerBevel;

type

  { TAppOptions }

  TAppOptions = record
    TrimOption, LineEnding, CaseSensitive: integer;
    EditorFont: TFont;
  end;

  { TFormOptions }

  TFormOptions = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    BitBtnFontEdit: TBitBtn;
    ButtonResetFont: TButton;
    ButtonPanelOptions: TButtonPanel;
    DividerBevelUser: TDividerBevel;
    DividerBevelBehavior: TDividerBevel;
    FontDialogEditor: TFontDialog;
    GroupBoxFont: TGroupBox;
    PanelSample: TPanel;
    RadioGroupCase: TRadioGroup;
    RadioGroupLineEndings: TRadioGroup;
    RadioGroupTrim: TRadioGroup;
    StaticTextSample: TStaticText;
    procedure BitBtnFontEditClick(Sender: TObject);
    procedure ButtonResetFontClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public
    AppOptions: TAppOptions;
    constructor Create(AnOwner: TComponent; AnAppOptions: TAppOptions);
      reintroduce;
  end;

var
  FormOptions: TFormOptions;

implementation

{$R *.lfm}

procedure TFormOptions.FormCreate(Sender: TObject);
begin
  with AppOptions do
  begin
    if TrimOption > RadioGroupTrim.Items.Count - 1 then
      TrimOption:=0;
    if LineEnding > RadioGroupLineEndings.Items.Count - 1 then
      LineEnding:=0;
    RadioGroupTrim.ItemIndex:=TrimOption;
    RadioGroupLineEndings.ItemIndex:=LineEnding;
    StaticTextSample.Font:=EditorFont;
    RadioGroupCase.ItemIndex:=CaseSensitive;
  end;
end;

procedure TFormOptions.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  with AppOptions do
  begin
    TrimOption:=RadioGroupTrim.ItemIndex;
    EditorFont:=StaticTextSample.Font;
    LineEnding:=RadioGroupLineEndings.ItemIndex;
    CaseSensitive:=RadioGroupCase.ItemIndex;
  end;
end;

procedure TFormOptions.BitBtnFontEditClick(Sender: TObject);
begin
  FontDialogEditor.Font:=AppOptions.EditorFont;
  if FontDialogEditor.Execute then
  begin
    StaticTextSample.Font:=FontDialogEditor.Font;
    AppOptions.EditorFont:=FontDialogEditor.Font;
  end;
end;

procedure TFormOptions.ButtonResetFontClick(Sender: TObject);
var
  NewFont: TFont;
begin
  NewFont:=TFont.Create;
  StaticTextSample.Font:=NewFont;
  AppOptions.EditorFont:=NewFont;
  FreeAndNil(NewFont);
end;

constructor TFormOptions.Create(AnOwner: TComponent; AnAppOptions: TAppOptions);
begin
  inherited Create(AnOwner);
  AppOptions:=AnAppOptions;
end;

end.

