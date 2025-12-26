local lush = require("lush")
local hsl = lush.hsl

local palette = {
	-- Backgrounds - warm rice paper tones
	bg = hsl(40, 15, 12), -- Deep warm charcoal (like aged sumi ink)
	bg_light = hsl(40, 12, 16), -- Slightly lifted
	bg_lighter = hsl(40, 10, 20), -- For floats/popups
	bg_accent = hsl(40, 8, 24), -- Visual selection, cursor line

	-- Foregrounds - warm off-whites like washi paper
	fg = hsl(45, 20, 85), -- Primary text (warm cream)
	fg_dim = hsl(45, 15, 65), -- Secondary text
	fg_dark = hsl(45, 10, 45), -- Comments, line numbers

	-- Hinomaru Red (日の丸) - the heart of the Japanese flag
	-- Shu (朱) - traditional vermillion, between red and orange
	hinomaru = hsl(5, 75, 55), -- The iconic red
	shu = hsl(15, 70, 50), -- Vermillion/cinnabar
	bengara = hsl(12, 50, 40), -- Reddish brown, earthy

	-- Sumi (墨) - traditional black ink that turns blue-green
	sumi = hsl(200, 15, 25), -- The blue-black of aged tattoo ink
	sumi_light = hsl(195, 20, 35), -- Lighter sumi wash

	-- Ao (青) - traditional indigo/blue
	ao = hsl(210, 45, 55), -- Tranquility, resilience
	shinbashi = hsl(190, 40, 50), -- Geisha district blue-green

	-- Midori (緑) - greens of nature
	moegi = hsl(90, 30, 45), -- Reserved, subtle green (Heian period)
	wakanae = hsl(100, 35, 50), -- Young rice sprout green

	-- Murasaki (紫) - purple/violet
	kikyo = hsl(270, 35, 55), -- Bellflower purple, dignified

	-- Gold and warm accents
	odo = hsl(45, 40, 50), -- Yellowish brown ochre
	koji = hsl(35, 55, 55), -- Reddish yellow, Buddhist connection

	-- Sakura (桜) - cherry blossom
	sakura = hsl(350, 50, 70), -- Soft pink

	-- Diagnostics
	error = hsl(0, 65, 55),
	warn = hsl(40, 70, 55),
	info = hsl(200, 50, 55),
	hint = hsl(150, 40, 50),
}

local createScheme = function(injected_functions)
	local sym = injected_functions.sym

	return {
		-- Editor UI
		Normal({ bg = palette.bg, fg = palette.fg }),
		NormalFloat({ bg = palette.bg_lighter, fg = palette.fg }),
		NormalNC({ bg = palette.bg.darken(5), fg = palette.fg.darken(10) }),
		FloatBorder({ bg = palette.bg_lighter, fg = palette.fg_dark }),
		FloatTitle({ bg = palette.bg_lighter, fg = palette.hinomaru, bold = true }),

		Cursor({ bg = palette.hinomaru, fg = palette.bg }),
		CursorLine({ bg = palette.bg_light }),
		CursorColumn({ CursorLine }),
		CursorLineNr({ fg = palette.koji, bold = true }),
		LineNr({ fg = palette.fg_dark.darken(15) }),
		SignColumn({ bg = palette.bg }),

		Visual({ bg = palette.bg_accent }),
		VisualNOS({ Visual }),

		Search({ bg = palette.koji.darken(20), fg = palette.bg }),
		IncSearch({ bg = palette.hinomaru, fg = palette.bg, bold = true }),
		CurSearch({ IncSearch }),
		Substitute({ bg = palette.shu, fg = palette.bg }),

		Pmenu({ bg = palette.bg_lighter, fg = palette.fg }),
		PmenuSel({ bg = palette.bg_accent, fg = palette.fg, bold = true }),
		PmenuSbar({ bg = palette.bg_light }),
		PmenuThumb({ bg = palette.fg_dark }),

		StatusLine({ bg = palette.bg_light, fg = palette.fg }),
		StatusLineNC({ bg = palette.bg, fg = palette.fg_dark }),
		TabLine({ bg = palette.bg_light, fg = palette.fg_dim }),
		TabLineFill({ bg = palette.bg }),
		TabLineSel({ bg = palette.bg_accent, fg = palette.fg, bold = true }),
		WinBar({ StatusLine }),
		WinBarNC({ StatusLineNC }),
		WinSeparator({ fg = palette.bg_accent }),
		VertSplit({ WinSeparator }),

		Folded({ bg = palette.bg_light, fg = palette.fg_dim, italic = true }),
		FoldColumn({ fg = palette.fg_dark }),

		MatchParen({ bg = palette.bg_accent, fg = palette.koji, bold = true }),
		ColorColumn({ bg = palette.bg_light }),
		Conceal({ fg = palette.fg_dark }),
		NonText({ fg = palette.bg_accent }),
		SpecialKey({ fg = palette.sumi_light }),
		Whitespace({ fg = palette.bg_accent }),
		EndOfBuffer({ fg = palette.bg_light }),

		Directory({ fg = palette.ao }),
		Title({ fg = palette.hinomaru, bold = true }),
		Question({ fg = palette.wakanae }),
		MoreMsg({ fg = palette.moegi }),
		ModeMsg({ fg = palette.fg, bold = true }),
		ErrorMsg({ fg = palette.error, bold = true }),
		WarningMsg({ fg = palette.warn }),

		SpellBad({ undercurl = true, sp = palette.error }),
		SpellCap({ undercurl = true, sp = palette.warn }),
		SpellLocal({ undercurl = true, sp = palette.info }),
		SpellRare({ undercurl = true, sp = palette.hint }),

		-- Diff
		DiffAdd({ bg = palette.moegi.darken(60).desaturate(50) }),
		DiffChange({ bg = palette.ao.darken(60).desaturate(50) }),
		DiffDelete({ bg = palette.hinomaru.darken(60).desaturate(50), fg = palette.hinomaru.darken(20) }),
		DiffText({ bg = palette.ao.darken(40).desaturate(30) }),

		Added({ fg = palette.moegi }),
		Changed({ fg = palette.ao }),
		Removed({ fg = palette.hinomaru }),

		-- Syntax (Legacy Vim Groups)
		Comment({ fg = palette.fg_dark, italic = true }),

		Constant({ fg = palette.shu }),
		String({ fg = palette.moegi }),
		Character({ fg = palette.moegi.lighten(10) }),
		Number({ fg = palette.sakura }),
		Boolean({ fg = palette.shu }),
		Float({ fg = palette.sakura }),

		Identifier({ fg = palette.fg }),
		Function({ fg = palette.koji }),

		Statement({ fg = palette.hinomaru }),
		Conditional({ fg = palette.hinomaru }),
		Repeat({ fg = palette.hinomaru }),
		Label({ fg = palette.shu }),
		Operator({ fg = palette.shinbashi }),
		Keyword({ fg = palette.hinomaru }),
		Exception({ fg = palette.hinomaru }),

		PreProc({ fg = palette.kikyo }),
		Include({ fg = palette.kikyo }),
		Define({ fg = palette.kikyo }),
		Macro({ fg = palette.kikyo.lighten(10) }),
		PreCondit({ fg = palette.kikyo }),

		Type({ fg = palette.ao }),
		StorageClass({ fg = palette.hinomaru }),
		Structure({ fg = palette.ao }),
		Typedef({ fg = palette.ao }),

		Special({ fg = palette.shu }),
		SpecialChar({ fg = palette.bengara }),
		Tag({ fg = palette.hinomaru }),
		Delimiter({ fg = palette.fg_dim }),
		SpecialComment({ fg = palette.fg_dark.lighten(10), italic = true }),
		Debug({ fg = palette.shu }),

		Underlined({ fg = palette.ao, underline = true }),
		Ignore({ fg = palette.fg_dark }),
		Error({ fg = palette.error, bold = true }),
		Todo({ fg = palette.koji, bold = true, italic = true }),

		-- Comments
		sym("@comment")({ Comment }),
		sym("@comment.documentation")({ fg = palette.fg_dark.lighten(10), italic = true }),

		-- Constants
		sym("@constant")({ Constant }),
		sym("@constant.builtin")({ fg = palette.shu, italic = true }),
		sym("@constant.macro")({ fg = palette.shu }),

		-- Strings
		sym("@string")({ String }),
		sym("@string.documentation")({ fg = palette.moegi.darken(10) }),
		sym("@string.escape")({ fg = palette.bengara }),
		sym("@string.regex")({ fg = palette.shinbashi }),
		sym("@string.special")({ fg = palette.bengara }),
		sym("@string.special.symbol")({ fg = palette.sakura }),
		sym("@string.special.url")({ fg = palette.ao, underline = true }),

		-- Characters and Numbers
		sym("@character")({ Character }),
		sym("@character.special")({ fg = palette.bengara }),
		sym("@number")({ Number }),
		sym("@number.float")({ Float }),
		sym("@boolean")({ Boolean }),

		-- Functions
		sym("@function")({ Function }),
		sym("@function.call")({ fg = palette.koji }),
		sym("@function.builtin")({ fg = palette.odo }),
		sym("@function.macro")({ fg = palette.kikyo }),
		sym("@function.method")({ fg = palette.koji }),
		sym("@function.method.call")({ fg = palette.koji }),

		-- Methods (older captures)
		sym("@method")({ fg = palette.koji }),
		sym("@method.call")({ fg = palette.koji }),

		-- Constructors
		sym("@constructor")({ fg = palette.ao.lighten(10) }),

		-- Parameters and Variables
		sym("@parameter")({ fg = palette.fg.darken(5) }),
		sym("@variable")({ fg = palette.fg }),
		sym("@variable.builtin")({ fg = palette.shu.desaturate(20), italic = true }),
		sym("@variable.parameter")({ fg = palette.fg.darken(5) }),
		sym("@variable.member")({ fg = palette.shinbashi }),

		-- Fields and Properties
		sym("@field")({ fg = palette.shinbashi }),
		sym("@property")({ fg = palette.shinbashi }),

		-- Keywords
		sym("@keyword")({ Keyword }),
		sym("@keyword.conditional")({ fg = palette.hinomaru }),
		sym("@keyword.coroutine")({ fg = palette.kikyo }),
		sym("@keyword.debug")({ fg = palette.shu }),
		sym("@keyword.directive")({ fg = palette.kikyo }),
		sym("@keyword.exception")({ fg = palette.hinomaru }),
		sym("@keyword.function")({ fg = palette.hinomaru }),
		sym("@keyword.import")({ fg = palette.kikyo }),
		sym("@keyword.modifier")({ fg = palette.hinomaru }),
		sym("@keyword.operator")({ fg = palette.shinbashi }),
		sym("@keyword.repeat")({ fg = palette.hinomaru }),
		sym("@keyword.return")({ fg = palette.hinomaru, italic = true }),
		sym("@keyword.storage")({ fg = palette.hinomaru }),
		sym("@keyword.type")({ fg = palette.hinomaru }),

		-- Operators and Punctuation
		sym("@operator")({ Operator }),
		sym("@punctuation")({ fg = palette.fg_dim }),
		sym("@punctuation.bracket")({ fg = palette.fg_dim }),
		sym("@punctuation.delimiter")({ fg = palette.fg_dim }),
		sym("@punctuation.special")({ fg = palette.bengara }),

		-- Types
		sym("@type")({ Type }),
		sym("@type.builtin")({ fg = palette.ao, italic = true }),
		sym("@type.definition")({ fg = palette.ao }),
		sym("@type.qualifier")({ fg = palette.hinomaru }),

		-- Attributes and Annotations
		sym("@attribute")({ fg = palette.kikyo }),
		sym("@attribute.builtin")({ fg = palette.kikyo, italic = true }),

		-- Labels and Namespaces
		sym("@label")({ Label }),
		sym("@module")({ fg = palette.sumi_light }),
		sym("@namespace")({ fg = palette.sumi_light }),

		-- Text (for markup, prose)
		sym("@markup")({ fg = palette.fg }),
		sym("@markup.heading")({ fg = palette.hinomaru, bold = true }),
		sym("@markup.heading.1")({ fg = palette.hinomaru, bold = true }),
		sym("@markup.heading.2")({ fg = palette.shu, bold = true }),
		sym("@markup.heading.3")({ fg = palette.koji, bold = true }),
		sym("@markup.heading.4")({ fg = palette.ao, bold = true }),
		sym("@markup.heading.5")({ fg = palette.kikyo, bold = true }),
		sym("@markup.heading.6")({ fg = palette.moegi, bold = true }),
		sym("@markup.strong")({ bold = true }),
		sym("@markup.italic")({ italic = true }),
		sym("@markup.strikethrough")({ strikethrough = true }),
		sym("@markup.underline")({ underline = true }),
		sym("@markup.quote")({ fg = palette.fg_dim, italic = true }),
		sym("@markup.math")({ fg = palette.sakura }),
		sym("@markup.link")({ fg = palette.ao }),
		sym("@markup.link.label")({ fg = palette.shinbashi }),
		sym("@markup.link.url")({ fg = palette.ao, underline = true }),
		sym("@markup.raw")({ fg = palette.moegi }),
		sym("@markup.raw.block")({ fg = palette.moegi }),
		sym("@markup.list")({ fg = palette.hinomaru }),
		sym("@markup.list.checked")({ fg = palette.moegi }),
		sym("@markup.list.unchecked")({ fg = palette.fg_dark }),

		-- Tags (HTML, JSX, etc.)
		sym("@tag")({ fg = palette.hinomaru }),
		sym("@tag.attribute")({ fg = palette.koji }),
		sym("@tag.builtin")({ fg = palette.hinomaru }),
		sym("@tag.delimiter")({ fg = palette.fg_dim }),

		-- Rust
		sym("@keyword.rust")({ fg = palette.hinomaru }),
		sym("@type.rust")({ fg = palette.ao }),
		sym("@type.builtin.rust")({ fg = palette.ao, italic = true }),
		sym("@function.macro.rust")({ fg = palette.kikyo, bold = true }),
		sym("@constant.builtin.rust")({ fg = palette.shu, italic = true }),
		sym("@module.rust")({ fg = palette.sumi_light }),
		sym("@punctuation.special.rust")({ fg = palette.bengara }), -- lifetimes

		-- Python
		sym("@keyword.python")({ fg = palette.hinomaru }),
		sym("@variable.builtin.python")({ fg = palette.shu, italic = true }), -- self, cls
		sym("@function.builtin.python")({ fg = palette.odo }),
		sym("@attribute.python")({ fg = palette.kikyo }), -- decorators
		sym("@type.builtin.python")({ fg = palette.ao, italic = true }),

		-- TypeScript/JavaScript
		sym("@keyword.typescript")({ fg = palette.hinomaru }),
		sym("@keyword.javascript")({ fg = palette.hinomaru }),
		sym("@type.typescript")({ fg = palette.ao }),
		sym("@type.javascript")({ fg = palette.ao }),
		sym("@constructor.typescript")({ fg = palette.ao, bold = true }),
		sym("@constructor.javascript")({ fg = palette.ao, bold = true }),
		sym("@variable.builtin.typescript")({ fg = palette.shu, italic = true }),
		sym("@variable.builtin.javascript")({ fg = palette.shu, italic = true }),

		-- TSX/JSX
		sym("@tag.tsx")({ fg = palette.hinomaru }),
		sym("@tag.jsx")({ fg = palette.hinomaru }),
		sym("@tag.attribute.tsx")({ fg = palette.koji }),
		sym("@tag.attribute.jsx")({ fg = palette.koji }),
		sym("@tag.delimiter.tsx")({ fg = palette.fg_dim }),
		sym("@tag.delimiter.jsx")({ fg = palette.fg_dim }),

		-- Go
		sym("@keyword.go")({ fg = palette.hinomaru }),
		sym("@type.builtin.go")({ fg = palette.ao, italic = true }),
		sym("@function.builtin.go")({ fg = palette.odo }),

		-- Lua
		sym("@keyword.lua")({ fg = palette.hinomaru }),
		sym("@variable.builtin.lua")({ fg = palette.shu, italic = true }),
		sym("@constructor.lua")({ fg = palette.ao }), -- table constructors

		-- C/C++
		sym("@keyword.c")({ fg = palette.hinomaru }),
		sym("@keyword.cpp")({ fg = palette.hinomaru }),
		sym("@type.builtin.c")({ fg = palette.ao, italic = true }),
		sym("@type.builtin.cpp")({ fg = palette.ao, italic = true }),
		sym("@keyword.directive.c")({ fg = palette.kikyo }),
		sym("@keyword.directive.cpp")({ fg = palette.kikyo }),

		-- LSP Semantic Tokens
		sym("@lsp.type.class")({ fg = palette.ao }),
		sym("@lsp.type.comment")({ Comment }),
		sym("@lsp.type.decorator")({ fg = palette.kikyo }),
		sym("@lsp.type.enum")({ fg = palette.ao }),
		sym("@lsp.type.enumMember")({ fg = palette.shu }),
		sym("@lsp.type.function")({ fg = palette.koji }),
		sym("@lsp.type.interface")({ fg = palette.ao.rotate(15) }),
		sym("@lsp.type.keyword")({ fg = palette.hinomaru }),
		sym("@lsp.type.macro")({ fg = palette.kikyo }),
		sym("@lsp.type.method")({ fg = palette.koji }),
		sym("@lsp.type.namespace")({ fg = palette.sumi_light }),
		sym("@lsp.type.number")({ Number }),
		sym("@lsp.type.operator")({ Operator }),
		sym("@lsp.type.parameter")({ fg = palette.fg.darken(5) }),
		sym("@lsp.type.property")({ fg = palette.shinbashi }),
		sym("@lsp.type.string")({ String }),
		sym("@lsp.type.struct")({ fg = palette.ao }),
		sym("@lsp.type.type")({ fg = palette.ao }),
		sym("@lsp.type.typeParameter")({ fg = palette.ao.rotate(20) }),
		sym("@lsp.type.variable")({ fg = palette.fg }),

		-- LSP Semantic Token Modifiers
		sym("@lsp.mod.deprecated")({ strikethrough = true }),
		sym("@lsp.mod.readonly")({ italic = true }),
		sym("@lsp.mod.defaultLibrary")({ italic = true }),

		-- Language-specific LSP
		sym("@lsp.type.lifetime.rust")({ fg = palette.bengara }),
		sym("@lsp.type.selfKeyword.rust")({ fg = palette.shu, italic = true }),
		sym("@lsp.type.selfTypeKeyword.rust")({ fg = palette.ao }),
		sym("@lsp.type.builtinType.rust")({ fg = palette.ao, italic = true }),
		sym("@lsp.typemod.function.defaultLibrary.rust")({ fg = palette.odo }),

		-- Diagnostics
		DiagnosticError({ fg = palette.error }),
		DiagnosticWarn({ fg = palette.warn }),
		DiagnosticInfo({ fg = palette.info }),
		DiagnosticHint({ fg = palette.hint }),
		DiagnosticOk({ fg = palette.moegi }),

		DiagnosticVirtualTextError({ fg = palette.error.darken(20), italic = true }),
		DiagnosticVirtualTextWarn({ fg = palette.warn.darken(20), italic = true }),
		DiagnosticVirtualTextInfo({ fg = palette.info.darken(20), italic = true }),
		DiagnosticVirtualTextHint({ fg = palette.hint.darken(20), italic = true }),
		DiagnosticVirtualTextOk({ fg = palette.moegi.darken(20), italic = true }),

		DiagnosticUnderlineError({ undercurl = true, sp = palette.error }),
		DiagnosticUnderlineWarn({ undercurl = true, sp = palette.warn }),
		DiagnosticUnderlineInfo({ undercurl = true, sp = palette.info }),
		DiagnosticUnderlineHint({ undercurl = true, sp = palette.hint }),
		DiagnosticUnderlineOk({ undercurl = true, sp = palette.moegi }),

		DiagnosticFloatingError({ fg = palette.error, bg = palette.bg_lighter }),
		DiagnosticFloatingWarn({ fg = palette.warn, bg = palette.bg_lighter }),
		DiagnosticFloatingInfo({ fg = palette.info, bg = palette.bg_lighter }),
		DiagnosticFloatingHint({ fg = palette.hint, bg = palette.bg_lighter }),
		DiagnosticFloatingOk({ fg = palette.moegi, bg = palette.bg_lighter }),

		DiagnosticSignError({ fg = palette.error }),
		DiagnosticSignWarn({ fg = palette.warn }),
		DiagnosticSignInfo({ fg = palette.info }),
		DiagnosticSignHint({ fg = palette.hint }),
		DiagnosticSignOk({ fg = palette.moegi }),

		-- LSP
		LspReferenceText({ bg = palette.bg_accent }),
		LspReferenceRead({ bg = palette.bg_accent }),
		LspReferenceWrite({ bg = palette.bg_accent.lighten(5) }),

		LspSignatureActiveParameter({ fg = palette.koji, bold = true, underline = true }),

		LspCodeLens({ fg = palette.fg_dark }),
		LspCodeLensSeparator({ fg = palette.fg_dark.darken(10) }),

		LspInlayHint({ fg = palette.fg_dark, italic = true }),

		-- Plugin Support
		TelescopeNormal({ bg = palette.bg_lighter, fg = palette.fg }),
		TelescopeBorder({ bg = palette.bg_lighter, fg = palette.fg_dark }),
		TelescopeTitle({ fg = palette.hinomaru, bold = true }),
		TelescopePromptNormal({ bg = palette.bg_light }),
		TelescopePromptBorder({ bg = palette.bg_light, fg = palette.fg_dark }),
		TelescopePromptTitle({ fg = palette.koji, bold = true }),
		TelescopePromptPrefix({ fg = palette.hinomaru }),
		TelescopeResultsNormal({ bg = palette.bg_lighter }),
		TelescopeResultsBorder({ bg = palette.bg_lighter, fg = palette.fg_dark }),
		TelescopePreviewNormal({ bg = palette.bg }),
		TelescopePreviewBorder({ bg = palette.bg, fg = palette.fg_dark }),
		TelescopePreviewTitle({ fg = palette.moegi, bold = true }),
		TelescopeSelection({ bg = palette.bg_accent, fg = palette.fg, bold = true }),
		TelescopeSelectionCaret({ fg = palette.hinomaru }),
		TelescopeMatching({ fg = palette.koji, bold = true }),

		-- Plugin Support: nvim-cmp
		CmpItemAbbr({ fg = palette.fg }),
		CmpItemAbbrDeprecated({ fg = palette.fg_dark, strikethrough = true }),
		CmpItemAbbrMatch({ fg = palette.koji, bold = true }),
		CmpItemAbbrMatchFuzzy({ fg = palette.koji }),
		CmpItemKind({ fg = palette.kikyo }),
		CmpItemMenu({ fg = palette.fg_dark }),

		CmpItemKindClass({ fg = palette.ao }),
		CmpItemKindColor({ fg = palette.sakura }),
		CmpItemKindConstant({ fg = palette.shu }),
		CmpItemKindConstructor({ fg = palette.ao }),
		CmpItemKindEnum({ fg = palette.ao }),
		CmpItemKindEnumMember({ fg = palette.shu }),
		CmpItemKindEvent({ fg = palette.kikyo }),
		CmpItemKindField({ fg = palette.shinbashi }),
		CmpItemKindFile({ fg = palette.fg }),
		CmpItemKindFolder({ fg = palette.ao }),
		CmpItemKindFunction({ fg = palette.koji }),
		CmpItemKindInterface({ fg = palette.ao.rotate(15) }),
		CmpItemKindKeyword({ fg = palette.hinomaru }),
		CmpItemKindMethod({ fg = palette.koji }),
		CmpItemKindModule({ fg = palette.sumi_light }),
		CmpItemKindOperator({ fg = palette.shinbashi }),
		CmpItemKindProperty({ fg = palette.shinbashi }),
		CmpItemKindReference({ fg = palette.sakura }),
		CmpItemKindSnippet({ fg = palette.moegi }),
		CmpItemKindStruct({ fg = palette.ao }),
		CmpItemKindText({ fg = palette.fg }),
		CmpItemKindTypeParameter({ fg = palette.ao.rotate(20) }),
		CmpItemKindUnit({ fg = palette.sakura }),
		CmpItemKindValue({ fg = palette.shu }),
		CmpItemKindVariable({ fg = palette.fg }),

		-- Plugin support: Gitsigns
		GitSignsAdd({ fg = palette.moegi }),
		GitSignsChange({ fg = palette.ao }),
		GitSignsDelete({ fg = palette.hinomaru }),
		GitSignsAddNr({ fg = palette.moegi }),
		GitSignsChangeNr({ fg = palette.ao }),
		GitSignsDeleteNr({ fg = palette.hinomaru }),
		GitSignsAddLn({ bg = palette.moegi.darken(60).desaturate(50) }),
		GitSignsChangeLn({ bg = palette.ao.darken(60).desaturate(50) }),
		GitSignsDeleteLn({ bg = palette.hinomaru.darken(60).desaturate(50) }),

		-- Plugin Support: Indent Blankline
		IblIndent({ fg = palette.bg_light }),
		IblScope({ fg = palette.fg_dark }),

		-- Plugin Support: Neo-tree
		NeoTreeNormal({ bg = palette.bg.darken(3), fg = palette.fg }),
		NeoTreeNormalNC({ NeoTreeNormal }),
		NeoTreeDirectoryName({ fg = palette.ao }),
		NeoTreeDirectoryIcon({ fg = palette.ao }),
		NeoTreeRootName({ fg = palette.hinomaru, bold = true }),
		NeoTreeFileName({ fg = palette.fg }),
		NeoTreeFileIcon({ fg = palette.fg_dim }),
		NeoTreeGitAdded({ fg = palette.moegi }),
		NeoTreeGitConflict({ fg = palette.hinomaru }),
		NeoTreeGitDeleted({ fg = palette.hinomaru.darken(20) }),
		NeoTreeGitIgnored({ fg = palette.fg_dark }),
		NeoTreeGitModified({ fg = palette.ao }),
		NeoTreeGitUnstaged({ fg = palette.koji }),
		NeoTreeGitUntracked({ fg = palette.sakura }),
		NeoTreeGitStaged({ fg = palette.moegi }),

		-- Plugin Support: Which-Key
		WhichKey({ fg = palette.hinomaru }),
		WhichKeyGroup({ fg = palette.ao }),
		WhichKeyDesc({ fg = palette.fg }),
		WhichKeySeparator({ fg = palette.fg_dark }),
		WhichKeyFloat({ bg = palette.bg_lighter }),
		WhichKeyBorder({ fg = palette.fg_dark }),
		WhichKeyValue({ fg = palette.fg_dim }),

		-- Plugin Support: Lazy.nvim
		LazyH1({ fg = palette.bg, bg = palette.hinomaru, bold = true }),
		LazyButton({ bg = palette.bg_light, fg = palette.fg }),
		LazyButtonActive({ bg = palette.bg_accent, fg = palette.fg, bold = true }),
		LazySpecial({ fg = palette.koji }),
		LazyProgressDone({ fg = palette.moegi }),
		LazyProgressTodo({ fg = palette.fg_dark }),

		-- Plugin Support: Noice
		NoiceCmdline({ bg = palette.bg_lighter }),
		NoiceCmdlineIcon({ fg = palette.hinomaru }),
		NoiceCmdlinePopup({ bg = palette.bg_lighter }),
		NoiceCmdlinePopupBorder({ fg = palette.fg_dark }),
		NoiceConfirm({ bg = palette.bg_lighter }),
		NoiceConfirmBorder({ fg = palette.fg_dark }),
		NoiceMini({ bg = palette.bg_light }),

		-- Plugin Support: Flash.nvim
		FlashLabel({ bg = palette.hinomaru, fg = palette.bg, bold = true }),
		FlashMatch({ bg = palette.bg_accent, fg = palette.koji }),
		FlashCurrent({ bg = palette.bg_accent.lighten(5), fg = palette.fg }),
		FlashBackdrop({ fg = palette.fg_dark }),

		-- Plugin Support: Mini
		MiniIndentscopeSymbol({ fg = palette.fg_dark }),
		MiniJump({ bg = palette.hinomaru, fg = palette.bg }),
		MiniJump2dSpot({ fg = palette.hinomaru, bold = true }),
		MiniStatuslineDevinfo({ bg = palette.bg_light, fg = palette.fg }),
		MiniStatuslineFileinfo({ bg = palette.bg_light, fg = palette.fg }),
		MiniStatuslineFilename({ bg = palette.bg, fg = palette.fg_dim }),
		MiniStatuslineInactive({ bg = palette.bg, fg = palette.fg_dark }),
		MiniStatuslineModeCommand({ bg = palette.koji, fg = palette.bg, bold = true }),
		MiniStatuslineModeInsert({ bg = palette.moegi, fg = palette.bg, bold = true }),
		MiniStatuslineModeNormal({ bg = palette.ao, fg = palette.bg, bold = true }),
		MiniStatuslineModeOther({ bg = palette.kikyo, fg = palette.bg, bold = true }),
		MiniStatuslineModeReplace({ bg = palette.hinomaru, fg = palette.bg, bold = true }),
		MiniStatuslineModeVisual({ bg = palette.sakura, fg = palette.bg, bold = true }),
		MiniTablineCurrent({ bg = palette.bg_accent, fg = palette.fg, bold = true }),
		MiniTablineFill({ bg = palette.bg }),
		MiniTablineHidden({ bg = palette.bg_light, fg = palette.fg_dim }),
		MiniTablineModifiedCurrent({ bg = palette.bg_accent, fg = palette.koji, bold = true }),
		MiniTablineModifiedHidden({ bg = palette.bg_light, fg = palette.koji }),
		MiniTablineModifiedVisible({ bg = palette.bg_light, fg = palette.koji }),
		MiniTablineTabpagesection({ bg = palette.bg_light, fg = palette.fg }),
		MiniTablineVisible({ bg = palette.bg_light, fg = palette.fg }),
	}
end

return lush(createScheme)
