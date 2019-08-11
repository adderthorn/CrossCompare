unit UnitMain;

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
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus, Grids,
  StdCtrls, ComCtrls, StdActns, ExtCtrls, Clipbrd, IniPropStorage,
  IDEWindowIntf, UnitAbout, UnitOptions;

type
  { TViewMode }
  TViewMode = (TLeft, TRight, TShared);

  { TFormMain }

  TFormMain = class(TForm)
    MenuItemFileSep2: TMenuItem;
    MenuItemViewReset: TMenuItem;
    MenuItemViewSep4: TMenuItem;
    ToolButtonSep4: TToolButton;
    ToolButtonOptions: TToolButton;
    ViewReset: TAction;
    FormatWordWrap: TAction;
    EditFindNext: TAction;
    EditFindReplace: TAction;
    EditClear: TAction;
    MenuItemFormatWordWrap: TMenuItem;
    MenuItemEditFindReplace: TMenuItem;
    MenuItemEditFindNext: TMenuItem;
    MenuItemEditClear: TMenuItem;
    MenuItemPopupClear: TMenuItem;
    EditFind: TAction;
    PropStorage: TIniPropStorage;
    MenuItemEditSep3: TMenuItem;
    MenuItemEditFind: TMenuItem;
    MenuItemToolsOptions: TMenuItem;
    MenuItemTools: TMenuItem;
    SplitterLeft: TSplitter;
    SplitterRight: TSplitter;
    ToolsOptions: TAction;
    FontDialogEditors: TFontDialog;
    FormatFont: TAction;
    MenuItemFormatFont: TMenuItem;
    MenuItemFormat: TMenuItem;
    MenuItemViewStatusBar: TMenuItem;
    MenuItemViewToolbar: TMenuItem;
    MenuItemViewSep3: TMenuItem;
    ToolButtonExport: TToolButton;
    ToolButtonNew: TToolButton;
    ToolButtonSep1: TToolButton;
    ToolButtonSep2: TToolButton;
    ViewStatusBar: TAction;
    ViewToolbar: TAction;
    HelpAbout: TAction;
    MenuItemHelpAbout: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItemViewDuplicates: TMenuItem;
    MenuItemViewSep2: TMenuItem;
    ViewDuplicates: TAction;
    FileSendToClipboard: TAction;
    FileSaveAs: TAction;
    FileSave: TAction;
    FileNew: TAction;
    MenuItemPopupSendToClipboard: TMenuItem;
    MenuItemPopupSep3: TMenuItem;
    MenuItemPopupSelectAll: TMenuItem;
    MenuItemPopupSep2: TMenuItem;
    MenuItemPopupPaste: TMenuItem;
    MenuItemPopupCopy: TMenuItem;
    MenuItemPopupCut: TMenuItem;
    MenuItemPopupSep1: TMenuItem;
    MenuItemPopupUndo: TMenuItem;
    MenuItemFileSendToClipboard: TMenuItem;
    MenuItemFileSaveAs: TMenuItem;
    MenuItemFileSave: TMenuItem;
    MenuItemFileNew: TMenuItem;
    MenuItemFileSep1: TMenuItem;
    MenuItemViewRefresh: TMenuItem;
    MenuItemViewSep1: TMenuItem;
    PopupMenuMain: TPopupMenu;
    ToolButtonSep3: TToolButton;
    ToolButtonLeftUnique: TToolButton;
    ToolButtonRightUnique: TToolButton;
    ToolButtonShared: TToolButton;
    ViewRefresh: TAction;
    MenuItemViewShared: TMenuItem;
    MenuItemViewRight: TMenuItem;
    MenuItemViewLeft: TMenuItem;
    MenuItemView: TMenuItem;
    ViewShared: TAction;
    ViewRight: TAction;
    ViewLeft: TAction;
    EditCopy: TEditCopy;
    EditCut: TEditCut;
    EditPaste: TEditPaste;
    EditSelectAll: TEditSelectAll;
    EditUndo: TEditUndo;
    FileExit: TAction;
    ActionList: TActionList;
    ImageListToolbar: TImageList;
    GridLabel: TLabel;
    MainMenu: TMainMenu;
    MemoLeft: TMemo;
    MemoRight: TMemo;
    MenuItemEditSelectAll: TMenuItem;
    MenuItemEditSep2: TMenuItem;
    MenuItemEditPaste: TMenuItem;
    MenuItemEditCopy: TMenuItem;
    MenuItemEditCut: TMenuItem;
    MenuItemEditSep1: TMenuItem;
    MenuItemEditUndo: TMenuItem;
    MenuItemEdit: TMenuItem;
    MenuItemFileExit: TMenuItem;
    MenuItemFile: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    SgResults: TStringGrid;
    ToolBar: TToolBar;
    ToolButtonUndo: TToolButton;
    ToolButtonCopy: TToolButton;
    ToolButtonPaste: TToolButton;
    ToolButtonCut: TToolButton;
    procedure EditClearExecute(Sender: TObject);
    procedure EditClearUpdate(Sender: TObject);
    procedure EditCopyExecute(Sender: TObject);
    procedure EditCopyUpdate(Sender: TObject);
    procedure EditPasteExecute(Sender: TObject);
    procedure FileExitExecute(Sender: TObject);
    procedure FileNewExecute(Sender: TObject);
    procedure FileSendToClipboardExecute(Sender: TObject);
    procedure FileSendToClipboardUpdate(Sender: TObject);
    procedure FormatFontExecute(Sender: TObject);
    procedure FormatWordWrapExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure HelpAboutExecute(Sender: TObject);
    procedure PropStorageRestoreProperties(Sender: TObject);
    procedure MemoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MemoUpdate(Sender: TObject);
    procedure PropStorageSavingProperties(Sender: TObject);
    procedure SgResultsAfterSelection(Sender: TObject; aCol, aRow: Integer);
    procedure SplitterMoved(Sender: TObject);
    procedure ToolsOptionsExecute(Sender: TObject);
    procedure ViewDuplicatesExecute(Sender: TObject);
    procedure ViewModeExecute(Sender: TObject);
    procedure RefreshGrid(Sender: TObject);
    procedure ViewResetExecute(Sender: TObject);
    procedure ViewStatusBarExecute(Sender: TObject);
    procedure ViewToolbarExecute(Sender: TObject);
  private
    DontMoveSplitter: boolean;
    ViewMode: TViewMode;
    AppOptions: TAppOptions;
    LeftRatio, RightRatio: double;
    procedure Reset;
    procedure UpdateStatusBar(l, r, rs: integer);
  public

  const
    LEFT_VIEW = 'Left Unique';
    RIGHT_VIEW ='Right Unique';
    SHARED_VIEW='Shared Items';
    HALF_SPLITTER_WIDTH = 3;

{$IFDEF WINDOWS}
    NEWLINE=tlbsCRLF;
    NEWLINE_CHAR = #13#10;
{$ELSE }
  {$IFDEF MAC}
      NEWLINE=tlbsCR;
      NEWLINE_CHAR = #13;
  {$ELSE}
      NEWLINE=tlbsLF;
      NEWLINE_CHAR = #10;
  {$ENDIF}
{$ENDIF}

    TRIM_OPTION = 'TrimOption';
    LEFT_RATIO = 'LeftRatio';
    RIGHT_RATIO= 'RightRatio';
    CASE_SENSITIVE='CompareMethod';
  end;

var
  FormMain: TFormMain;
  WhitespaceChars: array[0..1] of char;

implementation

{$R *.lfm}

{ TFormMain }

procedure TFormMain.FileExitExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormMain.FileNewExecute(Sender: TObject);
begin
  Reset;
end;

procedure TFormMain.FileSendToClipboardExecute(Sender: TObject);
var
  Sl: TStringList;
  i: integer;
begin
  Sl:=TStringList.Create;
  for i:=0 to SgResults.RowCount - 1 do
  begin
    Sl.Add(SgResults.Cells[0,i]);
  end;
  Clipboard.AsText:=Sl.Text.Trim;
end;

procedure TFormMain.FileSendToClipboardUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=(SgResults.RowCount > 0);
end;

procedure TFormMain.FormatFontExecute(Sender: TObject);
begin
  FontDialogEditors.Font:=MemoLeft.Font;
  if FontDialogEditors.Execute then
  begin
    MemoLeft.Font:=FontDialogEditors.Font;
    MemoRight.Font:=FontDialogEditors.Font;
    SgResults.Font:=FontDialogEditors.Font;
    AppOptions.EditorFont:=FontDialogEditors.Font;
  end;
end;

procedure TFormMain.FormatWordWrapExecute(Sender: TObject);
begin
  MemoLeft.WordWrap:=TAction(Sender).Checked;
  MemoRight.WordWrap:=MemoLeft.WordWrap;
end;

procedure TFormMain.EditCopyUpdate(Sender: TObject);
begin
  if (Self.ActiveControl is TStringGrid) and
     (TStringGrid(Self.ActiveControl).SelectedRangeCount > 0) then
    TAction(Sender).Enabled:=true
  else if (Self.ActiveControl is TCustomEdit) and
     (TCustomEdit(Self.ActiveControl).SelLength > 0) then
    TAction(Sender).Enabled:=true
  else
    TAction(Sender).Enabled:=false;
end;

procedure TFormMain.EditPasteExecute(Sender: TObject);
var
  clipboardText, line: string;
  NewString: TStringList;
  textArr: TStringArray;
  i: integer;
begin
  if Self.ActiveControl is TCustomEdit then
  begin
    clipboardText:=Clipboard.AsText;
    textArr:=clipboardText.Trim.Split(WhitespaceChars);
    NewString:=TStringList.Create;
    for i:=0 to Length(textArr) - 1 do
    begin
      line:=textArr[i];
      if AnsiString.IsNullOrWhiteSpace(line) then continue;
      case AppOptions.TrimOption of
        1:
        line:=line.TrimRight;
        2:
        line.TrimLeft;
        3:
        line:=line.Trim;
      end;
      NewString.Append(line);
    end;
    NewString.TextLineBreakStyle:=NEWLINE;
    NewString.LineBreak:=NEWLINE_CHAR;
    TCustomEdit(Self.ActiveControl).SelText:=NewString.Text.Trim;
    FreeAndNil(NewString);
  end;
end;

procedure TFormMain.EditCopyExecute(Sender: TObject);
var
  Sg: TStringGrid;
  Sl: TStringList;
  i: integer;
begin
  if Self.ActiveControl is TStringGrid then
  begin
    Sg:=TStringGrid(Self.ActiveControl);
    Sl:=TStringList.Create;
    for i:=0 to Sg.RowCount - 1 do
    begin
      if Sg.IsCellSelected[0,i] then Sl.Add(Sg.Cells[0,i]);
    end;
    case AppOptions.LineEnding of
      0:
      Sl.TextLineBreakStyle:=NEWLINE;
      1:
      Sl.TextLineBreakStyle:=tlbsCRLF;
      2:
      Sl.TextLineBreakStyle:=tlbsLF;
      3:
      Sl.TextLineBreakStyle:=tlbsCR;
    end;
    Clipboard.AsText:=Sl.Text.Trim;
  end else if Self.ActiveControl is TCustomEdit then
  begin
    TCustomEdit(Self.ActiveControl).CopyToClipboard;
  end;
end;

procedure TFormMain.EditClearUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=(Self.ActiveControl is TCustomEdit);
end;

procedure TFormMain.EditClearExecute(Sender: TObject);
begin
  if not (Self.ActiveControl is TCustomEdit) then exit;
  TCustomEdit(Self.ActiveControl).Clear;
end;

procedure TFormMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Reset;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  ViewMode:=TShared;
  ViewShared.Checked:=true;
  WhitespaceChars[0]:=#13; //cr
  WhitespaceChars[1]:=#10; //lf
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(MemoLeft);
  FreeAndNil(MemoRight);
  FreeAndNil(SgResults);
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  MemoLeft.Width:=Round(Self.Width * LeftRatio) - HALF_SPLITTER_WIDTH;
  //MemoRight.Width:=Round(Self.Width * RightRatio) - HALF_SPLITTER_WIDTH;
  Panel2.Width:=Self.Width - MemoLeft.Width - Round(Self.Width * RightRatio) - HALF_SPLITTER_WIDTH;
end;

procedure TFormMain.HelpAboutExecute(Sender: TObject);
var
  FrmAbt: TFormAbout;
begin
  FrmAbt:=TFormAbout.Create(Self);
  FrmAbt.ShowModal;
end;

procedure TFormMain.PropStorageRestoreProperties(Sender: TObject);
begin
  AppOptions.TrimOption:=PropStorage.StoredValue[TRIM_OPTION].ToInteger;
  AppOptions.EditorFont:=MemoLeft.Font;
  MemoRight.Font:=MemoLeft.Font;
  SgResults.Font:=MemoLeft.Font;
  LeftRatio:=PropStorage.StoredValue[LEFT_RATIO].ToDouble;
  RightRatio:=PropStorage.StoredValue[RIGHT_RATIO].ToDouble;
  AppOptions.CaseSensitive:=PropStorage.StoredValue[CASE_SENSITIVE].ToInteger;
end;

procedure TFormMain.MemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MemoUpdate(Sender);
end;

procedure TFormMain.MemoUpdate(Sender: TObject);
var
  EditCtrl: TCustomEdit;
begin
  if not (Sender is TCustomEdit) then exit;
  EditCtrl:=TCustomEdit(Sender);
    StatusBar.Panels[1].Text:='Ln ' + (EditCtrl.CaretPos.y + 1).ToString +
    ' Col ' + (EditCtrl.CaretPos.x + 1).ToString;
end;

procedure TFormMain.PropStorageSavingProperties(Sender: TObject);
begin
  PropStorage.StoredValue[TRIM_OPTION]:=AppOptions.TrimOption.ToString;
  PropStorage.StoredValue[LEFT_RATIO]:=LeftRatio.ToString;
  PropStorage.StoredValue[RIGHT_RATIO]:=RightRatio.ToString;
  PropStorage.StoredValue[CASE_SENSITIVE]:=AppOptions.CaseSensitive.ToString;
  //PropStorage.StoredValue[EDITOR_FONT]:=SaveFont;
end;

procedure TFormMain.SgResultsAfterSelection(Sender: TObject; aCol,
  aRow: Integer);
begin
  StatusBar.Panels[1].Text:='Ln ' + (aRow + 1).ToString + ' Col ' +
  (aCol + 1).ToString;
end;

procedure TFormMain.SplitterMoved(Sender: TObject);
begin
  if DontMoveSplitter then
  begin
    DontMoveSplitter:=false;
    FormResize(Sender);
    exit;
  end;
  LeftRatio:=(MemoLeft.Width / Self.Width);
  RightRatio:=(MemoRight.Width / Self.Width);
end;

procedure TFormMain.ToolsOptionsExecute(Sender: TObject);
var
  FormOptions: TFormOptions;
begin
  FormOptions:=TFormOptions.Create(Self, AppOptions);
  if FormOptions.ShowModal = mrOK then
  begin
    AppOptions:=FormOptions.AppOptions;
    with AppOptions do
    begin
      MemoLeft.Font:=EditorFont;
      MemoRight.Font:=EditorFont;
    end;
  end;
  FreeAndNil(FormOptions);
end;

procedure TFormMain.ViewDuplicatesExecute(Sender: TObject);
begin
  RefreshGrid(Sender);
end;

procedure TFormMain.ViewModeExecute(Sender: TObject);
var
  NewLabel: string;
begin
  if (Sender = ViewShared) then ViewMode:=TShared;
  if (Sender = ViewLeft) then ViewMode:=TLeft;
  if (Sender = ViewRight) then ViewMode:=TRight;
  case ViewMode of
    TLeft:
      NewLabel:=LEFT_VIEW;
    TRight:
      NewLabel:=RIGHT_VIEW;
    TShared:
      NewLabel:=SHARED_VIEW;
  end;
  GridLabel.Caption:=NewLabel;
  RefreshGrid(Sender);
end;

procedure TFormMain.RefreshGrid(Sender: TObject);
var
  NewList: TStringList;
  s: string;
  i: integer;
  LeftList, RightList: TStringList;
begin
  with TStringList do
  begin
    NewList:=Create;
    LeftList:=Create;
    RightList:=Create;
  end;
  NewList.Sorted:=true;
  if ViewDuplicates.Checked then
    NewList.Duplicates:=dupIgnore
  else
    NewList.Duplicates:=dupAccept;
  LeftList.AddStrings(MemoLeft.Lines);
  RightList.AddStrings(MemoRight.Lines);
  if AppOptions.CaseSensitive = 1 then
  begin
    LeftList.CaseSensitive:=false;
    RightList.CaseSensitive:=false;
  end else begin
    LeftList.CaseSensitive:=true;
    RightList.CaseSensitive:=true;
  end;
  case ViewMode of
    TLeft:
    begin
      for s in LeftList do
      begin
        if RightList.IndexOf(s.Trim) > -1 then continue;
        NewList.Append(s.Trim);
      end;
    end;
    TRight:
    begin
      for s in RightList do
      begin
        if LeftList.IndexOf(s.Trim) > -1 then continue;
        NewList.Append(s.Trim);
      end;
    end;
    TShared:
    begin
      for s in LeftList do
      begin
        if RightList.IndexOf(s.Trim) > -1 then
          NewList.Append(s.Trim);
      end;
    end;
  end;
  SgResults.BeginUpdate;
  SgResults.RowCount:=0;
  for i:=0 to NewList.Count - 1 do
  begin
    SgResults.InsertRowWithValues(i,[NewList[i]]);
  end;
  SgResults.EndUpdate;
  UpdateStatusBar(LeftList.Count, RightList.Count, NewList.Count);
  FreeAndNil(NewList);
  FreeAndNil(LeftList);
  FreeAndNil(RightList);
end;

procedure TFormMain.ViewResetExecute(Sender: TObject);
begin
  LeftRatio:=0.33;
  RightRatio:=0.33;
  FormResize(Sender);
end;

procedure TFormMain.ViewStatusBarExecute(Sender: TObject);
begin
  StatusBar.Visible:=TAction(Sender).Checked;
end;

procedure TFormMain.ViewToolbarExecute(Sender: TObject);
begin
  ToolBar.Visible:=TAction(Sender).Checked;
end;

procedure TFormMain.UpdateStatusBar(l, r, rs: integer);
var
  EditCtrl: TCustomEdit;
begin
  StatusBar.Panels[2].Text:='Left: ' + l.ToString;
  StatusBar.Panels[3].Text:='Right: ' + r.ToString;
  StatusBar.Panels[4].Text:='Results: ' + rs.ToString;
  if Self.ActiveControl is TCustomEdit then
  begin
    MemoUpdate(Self.ActiveControl)
  end;
end;

procedure TFormMain.Reset;
begin
  MemoLeft.Clear;
  MemoRight.Clear;
  MemoLeft.SetFocus;
end;

end.

