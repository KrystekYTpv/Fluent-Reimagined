local Library = loadstring(game:HttpGet("https://github.com/KrystekYTpv/Fluent-Reimagined/releases/download/Release/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrystekYTpv/Fluent-Reimagined/refs/heads/main/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrystekYTpv/Fluent-Reimagined/refs/heads/main/Addons/InterfaceManager.luau"))()

local Window = Library:CreateWindow{
    Title = "Fluent Full Showcase",
    SubTitle = "by KrystekYT",
    TabWidth = 160,
    Size = UDim2.fromOffset(830, 525),
    Resize = true,
    MinSize = Vector2.new(470, 380),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
}

local Tabs = {
    Main = Window:CreateTab{
        Title = "Main Elements",
        Icon = "phosphor-house"
    },
    Data = Window:CreateTab{
        Title = "Data & Inputs",
        Icon = "phosphor-database"
    },
    Visuals = Window:CreateTab{
        Title = "Visuals & Colors",
        Icon = "phosphor-palette"
    },
    Settings = Window:CreateTab{
        Title = "Settings",
        Icon = "settings"
    }
}

local Options = Library.Options

-- Sekcja w zakładce Main (demonstracja Section)
local MainSection = Tabs.Main:CreateSection("Basic Interactions")

MainSection:CreateParagraph("WelcomeParagraph", {
    Title = "Welcome to ExampleNew2",
    Content = "This script demonstrates EVERY feature of the Fluent Renewed Plus library.\nExplore the tabs to see all available elements.",
    TitleAlignment = "Left",
    ContentAlignment = "Left"
})

-- Button
MainSection:CreateButton{
    Title = "Test Notification",
    Description = "Click to see a notification",
    Callback = function()
        Library:Notify{
            Title = "Hello!",
            Content = "This is a notification with sound.",
            SubContent = "It lasts 3 seconds.",
            Duration = 3,
            Sound = {
                SoundId = "rbxassetid://8486683243",
                Volume = 1
            }
        }
    end
}

-- Dialog Button
MainSection:CreateButton{
    Title = "Open Dialog",
    Description = "Tests the modal dialog system",
    Callback = function()
        Window:Dialog{
            Title = "Confirm Action",
            Content = "Are you sure you want to proceed with this action?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        print("User confirmed.")
                        Library:Notify{Title="Dialog", Content="Confident User Detected!"}
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("User cancelled.")
                    end
                }
            }
        }
    end
}

-- Toggle with Sub-Keybind
local Toggle = MainSection:CreateToggle("MyToggle", {
    Title = "Master Toggle",
    Description = "Toggle with internal Keybind",
    Default = false,
    Callback = function(Value)
        print("Toggle State:", Value)
    end
})

-- Zagnieżdżony Keybind (Funkcja Toggle:Keybind)
Toggle:Keybind("MyToggleKey", {
    Mode = "Toggle", -- "Toggle" lub "Hold"
    Default = Enum.KeyCode.E,
    Callback = function(Value)
        print("Toggle Keybind Pressed", Value)
    end,
    ChangedCallback = function(NewKey)
        print("Toggle Keybind changed to:", NewKey)
    end
})

-- Keybind wolnostojący
MainSection:CreateKeybind("StandaloneKeybind", {
    Title = "Standalone Keybind",
    Description = "Holds interaction",
    Mode = "Hold",
    Default = Enum.KeyCode.LeftAlt,
    Callback = function(Value)
        print("Holding Key:", Value) -- Zwraca true/false dla Mode="Hold"
    end,
    ChangedCallback = function(New)
        print("Standalone Keybind changed:", New)
    end
})


-- Zakładka Data & Inputs
local InputSection = Tabs.Data:CreateSection("User Inputs")

InputSection:CreateInput("TextInput", {
    Title = "Text Input",
    Description = "Type something...",
    Default = "Fluent",
    Placeholder = "Enter text here",
    Numeric = false,
    Finished = true, -- Callback po enterze/utracie focusu
    ClearOnFocusLost = false,
    Callback = function(Value)
        print("Text Input:", Value)
    end
})

InputSection:CreateInput("NumericInput", {
    Title = "Numeric Input",
    Default = "",
    Placeholder = "Enter number",
    Numeric = true,
    Finished = false, -- Callback przy każdej zmianie
    Callback = function(Value)
        print("Numeric Input:", Value)
    end
})

InputSection:CreateInput("FocusClearInput", {
    Title = "Clearing Input",
    Description = "Clears text when you click away",
    Default = "",
    Placeholder = "Start typing...",
    ClearOnFocusLost = true,
    Callback = function(Value)
        print("Clear Input:", Value)
    end
})

local DropdownSection = Tabs.Data:CreateSection("Selection")

DropdownSection:CreateDropdown("SingleDropdown", {
    Title = "Single Select Dropdown",
    Values = {"Option 1", "Option 2", "Option 3"},
    Multi = false,
    Default = 1,
    Callback = function(Value)
        print("Selected:", Value)
    end
})

DropdownSection:CreateDropdown("MultiDropdown", {
    Title = "Multi Select Dropdown",
    Description = "Pick multiple items",
    Values = {"Apple", "Banana", "Cherry", "Date", "Elderberry"},
    Multi = true,
    Default = {"Banana"},
    Callback = function(Value)
        -- Value is a table when Multi is true
        local items = {}
        for k, v in pairs(Value) do
            if v then
                table.insert(items, k)
            end
        end
        print("Multi Selected:", table.concat(items, ", "))
    end
})

DropdownSection:CreateDropdown("SearchDropdown", {
    Title = "Searchable Dropdown",
    Values = {"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"},
    Multi = false,
    Searchable = true,
    Default = 1,
    Callback = function(Value)
        print("Searched & Selected:", Value)
    end
})

-- Zakładka Visuals
local VisualSection = Tabs.Visuals:CreateSection("Sliders & Colors")

VisualSection:CreateSlider("Slider1", {
    Title = "Basic Slider",
    Description = "0 to 100",
    Min = 0,
    Max = 100,
    Default = 50,
    Rounding = 1,
    Callback = function(Value)
        print("Slider:", Value)
    end
})

VisualSection:CreateSlider("SliderDecimal", {
    Title = "Decimal Slider",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Rounding = 2, -- 2 miejsca po przecinku
    Callback = function(Value)
        print("Decimal:", Value)
    end
})

VisualSection:CreateColorpicker("ColorPicker1", {
    Title = "Static Colorpicker",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        print("Color Static:", Value)
    end
})

VisualSection:CreateColorpicker("ColorPickerTrans", {
    Title = "Transparent Colorpicker",
    Description = "Includes transparency slider",
    Default = Color3.fromRGB(0, 255, 0),
    Transparency = 0.5,
    Callback = function(Value)
        -- Note: Colorpicker value is Color3, Transparency is maintained internally or accessible via Options.ColorPickerTrans.Transparency
        print("Color Trans:", Value)
    end
})

VisualSection:CreateColorpicker("ColorPickerLive", {
    Title = "Live Update Colorpicker",
    Description = "Updates as you drag",
    Default = Color3.fromRGB(0, 0, 255),
    UpdateOnChange = true,
    Callback = function(Value)
        -- Uwaga: może spamować konsolę
        -- print("Color Live:", Value)
        Window.Root.BackgroundColor3 = Value -- Efekt wizualny na żywo (zmienia tło okienka dla testu)
    end
})

-- Alignment Test
local AlignSection = Tabs.Visuals:CreateSection("Text Alignment")

AlignSection:CreateParagraph("LeftPara", {
    Title = "Left Aligned",
    Content = "Content Left",
    TitleAlignment = "Left",
    ContentAlignment = "Left"
})

AlignSection:CreateParagraph("CenterPara", {
    Title = "Center Aligned",
    Content = "Content Center",
    TitleAlignment = "Middle", -- "Middle" or "Center"
    ContentAlignment = "Center"
})


-- SaveManager Setup
SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes{}

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/example-place")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Library:Notify{
    Title = "Loaded",
    Content = "Full Showcase Script Loaded",
    Duration = 5
}

-- Print loaded config info
SaveManager:LoadAutoloadConfig()


