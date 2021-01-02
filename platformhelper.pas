unit PlatformHelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LCLType, Controls, Menus;

procedure AdaptMenus;
procedure AdaptFeatures;

implementation

uses
  UnitMain;

procedure AdaptFeatures;
begin
  {$IFDEF LCLCocoa}
  CocoaInt.CocoaIconUse=false;
  {$ENDIF}
end;

procedure AdaptMenus;
begin
  { Application Menu }
  {$IFDEF Darwin}
  FormMain.MenuItemApple.Enabled:=True;
  FormMain.MenuItemApple.Visible:=True;
  {$ENDIF}

  { File Menu }
  FormMain.FileNew.ShortCut:=ShortCut(VK_N, [ssModifier, ssShift]);
  {$IFDEF Darwin}
  FormMain.FileExit.Enabled:=false;
  FormMain.FileExit.Visible:=false;
  FormMain.MenuItemFileSep1.Visible:=false;
  {$ENDIF}

  { Edit Menu }
  FormMain.EditUndo.ShortCut:=ShortCut(VK_Z, [ssModifier]);
  FormMain.EditCut.ShortCut:=ShortCut(VK_X, [ssModifier]);
  FormMain.EditCopy.ShortCut:=ShortCut(VK_C, [ssModifier]);
  FormMain.EditCut.ShortCut:=ShortCut(VK_X, [ssModifier]);
  FormMain.EditPaste.ShortCut:=ShortCut(VK_V, [ssModifier]);
  FormMain.EditFind.ShortCut:=ShortCut(VK_F, [ssModifier]);
  FormMain.EditSelectAll.ShortCut:=ShortCut(VK_A, [ssModifier]);
  {$IFDEF Darwin}
  FormMain.EditFindNext.ShortCut:=ShortCut(VK_G, [ssMeta]);
  FormMain.EditFindReplace.ShortCut:=ShortCut(VK_F, [ssMeta, ssAlt]);
  FormMain.EditClear.ShortCut:=ShortCut(VK_BACK, [ssMeta]);
  {$ELSE}
  FormMain.EditFindNext.ShortCut:=ShortCut(VK_F3, []);
  FormMain.EditFindReplace.ShortCut:=ShortCut(VK_H, [ssCtrl]);
  FormMain.EditClear.ShortCut:=ShortCut(VK_F4, []);
  {$ENDIF}

  { View Menu }
  FormMain.ViewDuplicates.ShortCut:=ShortCut(VK_D, [ssModifier]);
  FormMain.ViewRefresh.ShortCut:=ShortCut(VK_R, [ssModifier, ssShift]);
  {$IFDEF Darwin}
  FormMain.ViewRefresh.ShortCut:=ShortCut(VK_R, [ssMeta]);
  {$ELSE}
  FormMain.ViewRefresh.ShortCut:=ShortCut(VK_F5, []);
  {$ENDIF}

  { Tools Menu }
  {$IFDEF Darwin}
  FormMain.MenuItemTools.Enabled:=False;
  FormMain.MenuItemTools.Visible:=False;
  {$ENDIF}

  { Help Menu }
  {$IFDEF Darwin}
  FormMain.MenuItemHelpAbout.Enabled:=False;
  FormMain.MenuItemHelpAbout.Visible:=False;
  {$ENDIF}

end;

end.

