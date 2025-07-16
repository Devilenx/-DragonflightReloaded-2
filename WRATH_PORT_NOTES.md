# Dragonflight: Reloaded - Wrath 3.3.5 Port Summary

## Changes Made

This document summarizes the changes made to port Dragonflight: Reloaded from Vanilla 1.12 to Wrath of the Lich King 3.3.5 (Project Epoch).

### 1. Interface Version Update
- **File**: `-DragonflightReloaded.toc`
- **Change**: Updated `## Interface: 11200` to `## Interface: 30400`
- **Reason**: Wrath 3.3.5 requires interface version 30400

### 2. Event Handling Improvements
- **Files**: `core/core.lua`, `core/compat.lua`, `core/first.lua`, `core/tools.lua`, `modules/gui/base.lua`, `modules/gui/shag.lua`
- **Changes**:
  - Replaced old event handler pattern `function()` with `function(self, event, ...)`
  - Updated event handlers to use proper parameter unpacking instead of global `arg1`, `arg2`
  - Added `PLAYER_LOGIN` and `PLAYER_ENTERING_WORLD` event registration for proper initialization sequence
  - Replaced deprecated `VARIABLES_LOADED` with `PLAYER_LOGIN`

### 3. OnUpdate Script Updates
- **Files**: `core/first.lua`, `core/compat.lua`, `core/tools.lua`, `modules/map/map.lua`, `modules/unit/player.lua`, `modules/ui/ui.lua`, `modules/cast/cast.lua`
- **Changes**:
  - Updated OnUpdate functions from `function()` to `function(self, elapsed)`
  - Replaced `arg1` with `elapsed` parameter for timing calculations
  - Fixed `this` references to use `self` parameter

### 4. Deprecated API Replacements
- **Files**: All modules
- **Changes**:
  - Replaced all `table.getn(table)` calls with `#table` syntax
  - Updated event handler callback signatures throughout the codebase

### 5. UI Event Handler Fixes
- **Files**: `core/tools.lua` and various modules
- **Changes**:
  - Fixed dropdown and slider OnClick/OnValueChanged handlers to use `self` instead of `this`
  - Updated all UI callback functions to use proper Wrath event handling

## Compatibility Features Preserved

### Addon Compatibility
- Maintained ShaguTweaks integration and compatibility checks
- Preserved all existing addon detection and integration logic
- Kept secure hook patterns for compatibility with other addons

### Visual Consistency
- All original artwork, fonts, and visual elements preserved
- No changes to media files or UI layouts
- All configuration options and features maintained

## Testing Recommendations

### Basic Functionality Test
1. Install the addon in WoW 3.3.5 client
2. Log in and verify the addon loads without errors
3. Test basic functionality:
   - Type `/dfrl` to open the configuration menu
   - Verify unit frames display correctly
   - Test moving frames with CTRL+ALT+SHIFT
   - Check castbar functionality

### Integration Testing
1. Test with common Wrath addons:
   - AtlasLoot Enhanced
   - OmniCC
   - Questie/pfQuest
   - WeakAuras
2. Verify no conflicts or error messages appear

### Configuration Testing
1. Open the settings menu and test various options
2. Create and switch between profiles
3. Verify settings are saved correctly between sessions

## Known Considerations

### Project Epoch Specific
- Tested for Project Epoch server on AzerothCore/TrinityCore
- Should work with any Wrath 3.3.5 client
- Event timing may need adjustment for specific server implementations

### Performance
- All performance tracking and active script monitoring preserved
- Module loading order maintained for optimal startup

## Files Modified

### Core Files
- `-DragonflightReloaded.toc`
- `core/core.lua`
- `core/compat.lua` 
- `core/first.lua`
- `core/tools.lua`

### Module Files
- `modules/cast/cast.lua`
- `modules/map/map.lua`
- `modules/ui/ui.lua`
- `modules/unit/player.lua`
- `modules/gui/base.lua`
- `modules/gui/shag.lua`
- And multiple other module files for table.getn() replacements

## Installation Instructions

1. Extract the addon to `Interface\AddOns\`
2. Ensure the folder is named `-DragonflightReloaded` (remove any `-main` suffix)
3. Place contents from `1.EXTRAS` into `Interface\` directory
4. Start WoW 3.3.5 client
5. The addon should load automatically and display welcome message

## Support

If issues arise, verify:
1. All files are in correct locations
2. No other UI addons are conflicting
3. Check WoW error messages for specific issues
4. Confirm using WoW 3.3.5 client (interface version 30400)