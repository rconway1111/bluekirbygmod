//
//  ___  ___   _   _   _    __   _   ___ ___ __ __
// |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
//  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
//  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2009
//										 
//

local surface = surface
local draw = draw
local Color = Color

local SKIN = {}

SKIN.PrintName 		= "Default Derma Skin"
SKIN.Author 		= "Garry Newman"
SKIN.DermaVersion	= 1

SKIN.bg_color 					= Color( 110, 110, 110, 255 )
SKIN.bg_color_sleep 			= Color( 70, 70, 70, 255 )
SKIN.bg_color_dark				= Color( 55, 57, 61, 255 )
SKIN.bg_color_bright			= Color( 220, 220, 220, 255 )
SKIN.frame_border				= Color( 50, 50, 50, 255 )
SKIN.frame_title				= Color( 130, 130, 130, 255 )


SKIN.fontFrame					= "Default"

SKIN.control_color 				= Color( 120, 120, 120, 255 )
SKIN.control_color_highlight	= Color( 150, 150, 150, 255 )
SKIN.control_color_active 		= Color( 110, 150, 250, 255 )
SKIN.control_color_bright 		= Color( 255, 200, 100, 255 )
SKIN.control_color_dark 		= Color( 100, 100, 100, 255 )

SKIN.bg_alt1 					= Color( 50, 50, 50, 255 )
SKIN.bg_alt2 					= Color( 55, 55, 55, 255 )

SKIN.listview_hover				= Color( 70, 70, 70, 255 )
SKIN.listview_selected			= Color( 100, 170, 220, 255 )

SKIN.text_bright				= Color( 255, 255, 255, 255 )
SKIN.text_normal				= Color( 180, 180, 180, 255 )
SKIN.text_dark					= Color( 20, 20, 20, 255 )
SKIN.text_highlight				= Color( 255, 20, 20, 255 )

SKIN.texGradientUp				= Material( "gui/gradient_up" )
SKIN.texGradientDown			= Material( "gui/gradient_down" )

SKIN.combobox_selected			= SKIN.listview_selected

SKIN.panel_transback			= Color( 255, 255, 255, 50 )
SKIN.tooltip					= Color( 255, 245, 175, 255 )

SKIN.colPropertySheet 			= Color( 170, 170, 170, 255 )
SKIN.colTab			 			= SKIN.colPropertySheet
SKIN.colTabInactive				= Color( 140, 140, 140, 255 )
SKIN.colTabShadow				= Color( 0, 0, 0, 170 )
SKIN.colTabText		 			= Color( 255, 255, 255, 255 )
SKIN.colTabTextInactive			= Color( 0, 0, 0, 200 )
SKIN.fontTab					= "Default"

SKIN.colCollapsibleCategory		= Color( 255, 255, 255, 20 )

SKIN.colCategoryText			= Color( 255, 255, 255, 255 )
SKIN.colCategoryTextInactive	= Color( 200, 200, 200, 255 )
SKIN.fontCategoryHeader			= "TabLarge"

SKIN.colNumberWangBG			= Color( 255, 240, 150, 255 )
SKIN.colTextEntryBG				= Color( 240, 240, 240, 255 )
SKIN.colTextEntryBorder			= Color( 20, 20, 20, 255 )
SKIN.colTextEntryText			= Color( 20, 20, 20, 255 )
SKIN.colTextEntryTextHighlight	= Color( 20, 200, 250, 255 )
SKIN.colTextEntryTextHighlight	= Color( 20, 200, 250, 255 )

SKIN.colMenuBG					= Color( 255, 255, 255, 200 )
SKIN.colMenuBorder				= Color( 0, 0, 0, 200 )

SKIN.colButtonText				= Color( 255, 255, 255, 255 )
SKIN.colButtonTextDisabled		= Color( 255, 255, 255, 55 )
SKIN.colButtonBorder			= Color( 20, 20, 20, 255 )
SKIN.colButtonBorderHighlight	= Color( 255, 255, 255, 50 )
SKIN.colButtonBorderShadow		= Color( 0, 0, 0, 100 )
SKIN.fontButton					= "Default"


/*---------------------------------------------------------
   DrawGenericBackground
---------------------------------------------------------*/
function SKIN:DrawGenericBackground( x, y, w, h, color )

	draw.RoundedBox( 4, x, y, w, h, color )

end

/*---------------------------------------------------------
   DrawButtonBorder
---------------------------------------------------------*/
function SKIN:DrawButtonBorder( x, y, w, h, depressed )

	if ( !depressed ) then
	
		// Highlight
		surface.SetDrawColor( self.colButtonBorderHighlight )
		surface.DrawRect( x+1, y+1, w-2, 1 )
		surface.DrawRect( x+1, y+1, 1, h-2 )
		
		// Corner
		surface.DrawRect( x+2, y+2, 1, 1 )
	
		// Shadow
		surface.SetDrawColor( self.colButtonBorderShadow )
		surface.DrawRect( w-2, y+2, 1, h-2 )
		surface.DrawRect( x+2, h-2, w-2, 1 )
		
	else
	
		local col = self.colButtonBorderShadow
	
		for i=1, 5 do
		
			surface.SetDrawColor( col.r, col.g, col.b, (255 - i * (255/5) ) )
			surface.DrawOutlinedRect( i, i, w-i, h-i )
		
		end
		
	end	

	surface.SetDrawColor( self.colButtonBorder )
	surface.DrawOutlinedRect( x, y, w, h )

end

/*---------------------------------------------------------
   DrawDisabledButtonBorder
---------------------------------------------------------*/
function SKIN:DrawDisabledButtonBorder( x, y, w, h, depressed )

	surface.SetDrawColor( 0, 0, 0, 150 )
	surface.DrawOutlinedRect( x, y, w, h )
	
end


/*---------------------------------------------------------
	Frame
---------------------------------------------------------*/
function SKIN:PaintFrame( panel )

	draw.RoundedBox( 4, 0, 0, panel:GetWide(), panel:GetTall(), self.frame_border )
	draw.RoundedBox( 4, 1, 1, panel:GetWide()-2, panel:GetTall()-2, self.frame_title )
	draw.RoundedBoxEx( 4, 2, 21, panel:GetWide()-4, panel:GetTall()-23, self.bg_color, false, false, true, true )

end

function SKIN:LayoutFrame( panel )

	panel.lblTitle:SetFont( self.fontFrame )
	
	panel.btnClose:SetPos( panel:GetWide() - 22, 4 )
	panel.btnClose:SetSize( 18, 18 )
	
	panel.lblTitle:SetPos( 8, 2 )
	panel.lblTitle:SetSize( panel:GetWide() - 25, 20 )

end


/*---------------------------------------------------------
	Button
---------------------------------------------------------*/
function SKIN:PaintButton( panel )

	local w, h = panel:GetSize()

	if ( panel.m_bBackground ) then
	
		local col = self.control_color
		
		if ( panel:GetDisabled() ) then
			col = self.control_color_dark
		elseif ( panel.Depressed || panel:GetSelected() ) then
			col = self.control_color_active
		elseif ( panel.Hovered ) then
			col = self.control_color_highlight
		end
		
		draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 0, 230 ) )
		draw.RoundedBox( 2, 1, 1, w-2, h-2, Color( col.r + 30, col.g + 30, col.b + 30 ) )
		draw.RoundedBox( 2, 2, 2, w-4, h-4, col )
		
		draw.RoundedBox( 0, 3, h*0.5, w-6, h-h*0.5-2, Color( 0, 0, 0, 40 ) )
	
	end

end
function SKIN:PaintOverButton( panel )
end


function SKIN:SchemeButton( panel )

	panel:SetFont( self.fontButton )
	
	if ( panel:GetDisabled() ) then
		panel:SetTextColor( self.colButtonTextDisabled )
	else
		panel:SetTextColor( self.colButtonText )
	end
	
	DLabel.ApplySchemeSettings( panel )

end

/*---------------------------------------------------------
	SysButton
---------------------------------------------------------*/
function SKIN:PaintPanel( panel )

	if ( panel.m_bPaintBackground ) then
	
		local w, h = panel:GetSize()
		self:DrawGenericBackground( 0, 0, w, h, panel.m_bgColor or self.panel_transback )
		
	end	

end

/*---------------------------------------------------------
	SysButton
---------------------------------------------------------*/
function SKIN:PaintSysButton( panel )

	self:PaintButton( panel )
	self:PaintOverButton( panel ) // Border

end

function SKIN:SchemeSysButton( panel )

	panel:SetFont( "Marlett" )
	DLabel.ApplySchemeSettings( panel )
	
end


/*---------------------------------------------------------
	ImageButton
---------------------------------------------------------*/
function SKIN:PaintImageButton( panel )

	self:PaintButton( panel )

end

/*---------------------------------------------------------
	ImageButton
---------------------------------------------------------*/
function SKIN:PaintOverImageButton( panel )

	self:PaintOverButton( panel )

end
function SKIN:LayoutImageButton( panel )

	if ( panel.m_bBorder ) then
		panel.m_Image:SetPos( 1, 1 )
		panel.m_Image:SetSize( panel:GetWide()-2, panel:GetTall()-2 )
	else
		panel.m_Image:SetPos( 0, 0 )
		panel.m_Image:SetSize( panel:GetWide(), panel:GetTall() )
	end

end

/*---------------------------------------------------------
	PaneList
---------------------------------------------------------*/
function SKIN:PaintPanelList( panel )

	if ( panel.m_bBackground ) then
		draw.RoundedBox( 4, 0, 0, panel:GetWide(), panel:GetTall(), self.bg_color_dark )
	end

end

/*---------------------------------------------------------
	ScrollBar
---------------------------------------------------------*/
function SKIN:PaintVScrollBar( panel )

	surface.SetDrawColor( self.bg_color_sleep )
	surface.DrawRect( 0, 0, panel:GetWide(), panel:GetTall() )

end
function SKIN:LayoutVScrollBar( panel )

	local Wide = panel:GetWide()
	local Scroll = panel:GetScroll() / panel.CanvasSize
	local BarSize = math.max( panel:BarScale() * (panel:GetTall() - (Wide * 2)), 10 )
	local Track = panel:GetTall() - (Wide * 2) - BarSize
	Track = Track + 1
	
	Scroll = Scroll * Track
	
	panel.btnGrip:SetPos( 0, Wide + Scroll )
	panel.btnGrip:SetSize( Wide, BarSize )
	
	panel.btnUp:SetPos( 0, 0, Wide, Wide )
	panel.btnUp:SetSize( Wide, Wide )
	
	panel.btnDown:SetPos( 0, panel:GetTall() - Wide, Wide, Wide )
	panel.btnDown:SetSize( Wide, Wide )

end

/*---------------------------------------------------------
	ScrollBarGrip
---------------------------------------------------------*/
function SKIN:PaintScrollBarGrip( panel )

	local w, h = panel:GetSize()
	
	local col = self.control_color
	
	if ( panel.Depressed ) then
		col = self.control_color_active
	elseif ( panel.Hovered ) then
		col = self.control_color_highlight
	end
		
	draw.RoundedBox( 2, 0, 0, w, h, Color( 0, 0, 0, 230 ) )
	draw.RoundedBox( 2, 1, 1, w-2, h-2, Color( col.r + 30, col.g + 30, col.b + 30 ) )
	draw.RoundedBox( 2, 2, 2, w-4, h-4, col )
		
	draw.RoundedBox( 0, 3, h*0.5, w-6, h-h*0.5-2, Color( 0, 0, 0, 25 ) )

end


/*---------------------------------------------------------
	ScrollBar
---------------------------------------------------------*/
function SKIN:PaintMenu( panel )

	surface.SetDrawColor( self.colMenuBG )
	panel:DrawFilledRect( 0, 0, w, h )

end
function SKIN:PaintOverMenu( panel )

	surface.SetDrawColor( self.colMenuBorder )
	panel:DrawOutlinedRect( 0, 0, w, h )

end
function SKIN:LayoutMenu( panel )

end

/*---------------------------------------------------------
	ScrollBar
---------------------------------------------------------*/
function SKIN:PaintMenuOption( panel )

	if ( panel.m_bBackground && panel.Hovered ) then
	
		local col = nil
		
		if ( panel.Depressed ) then
			col = self.control_color_bright
		else
			col = self.control_color_active
		end
		
		surface.SetDrawColor( col.r, col.g, col.b, col.a )
		surface.DrawRect( 0, 0, panel:GetWide(), panel:GetTall() )
	
	end
	
end
function SKIN:LayoutMenuOption( panel )

	// This is totally messy. :/

	panel:SizeToContents()

	panel:SetWide( panel:GetWide() + 30 )
	
	local w = math.max( panel:GetParent():GetWide(), panel:GetWide() )

	panel:SetSize( w, 18 )
	
	if ( panel.SubMenuArrow ) then
	
		panel.SubMenuArrow:SetSize( panel:GetTall(), panel:GetTall() )
		panel.SubMenuArrow:CenterVertical()
		panel.SubMenuArrow:AlignRight()
		
	end
	
end
function SKIN:SchemeMenuOption( panel )

	panel:SetFGColor( 40, 40, 40, 255 )
	
end

/*---------------------------------------------------------
	TextEntry
---------------------------------------------------------*/
function SKIN:PaintTextEntry( panel )

	if ( panel.m_bBackground ) then
	
		surface.SetDrawColor( self.colTextEntryBG )
		surface.DrawRect( 0, 0, panel:GetWide(), panel:GetTall() )
	
	end
	
	panel:DrawTextEntryText( panel.m_colText, panel.m_colHighlight, panel.m_colCursor )
	
	if ( panel.m_bBorder ) then
	
		surface.SetDrawColor( self.colTextEntryBorder )
		surface.DrawOutlinedRect( 0, 0, panel:GetWide(), panel:GetTall() )
	
	end

	
end
function SKIN:SchemeTextEntry( panel )

	panel:SetTextColor( self.colTextEntryText )
	panel:SetHighlightColor( self.colTextEntryTextHighlight )
	panel:SetCursorColor( Color( 0, 0, 100, 255 ) )

end

/*---------------------------------------------------------
	Label
---------------------------------------------------------*/
function SKIN:PaintLabel( panel )
	return false
end

function SKIN:SchemeLabel( panel )

	local col = nil

	if ( panel.Hovered && panel:GetTextColorHovered() ) then
		col = panel:GetTextColorHovered()
	else
		col = panel:GetTextColor()
	end
	
	if ( col ) then
		panel:SetFGColor( col.r, col.g, col.b, col.a )
	else
		panel:SetFGColor( 200, 200, 200, 255 )
	end

end

function SKIN:LayoutLabel( panel )

	panel:ApplySchemeSettings()
	
	if ( panel.m_bAutoStretchVertical ) then
		panel:SizeToContentsY()
	end
	
end

/*---------------------------------------------------------
	CategoryHeader
---------------------------------------------------------*/
function SKIN:PaintCategoryHeader( panel )
		
end

function SKIN:SchemeCategoryHeader( panel )
	
	panel:SetTextInset( 5 )
	panel:SetFont( self.fontCategoryHeader )
	
	if ( panel:GetParent():GetExpanded() ) then
		panel:SetTextColor( self.colCategoryText )
	else
		panel:SetTextColor( self.colCategoryTextInactive )
	end
	
end

/*---------------------------------------------------------
	CategoryHeader
---------------------------------------------------------*/
function SKIN:PaintCollapsibleCategory( panel )
	
	draw.RoundedBox( 4, 0, 0, panel:GetWide(), panel:GetTall(), self.colCollapsibleCategory )
	
end

/*---------------------------------------------------------
	Tab
---------------------------------------------------------*/
function SKIN:PaintTab( panel )

	if ( panel:GetPropertySheet():GetActiveTab() == panel ) then
		draw.RoundedBox( 4, 0, 0, panel:GetWide(), panel:GetTall() + 8, self.colTabShadow )
		draw.RoundedBox( 4, 1, 1, panel:GetWide()-2, panel:GetTall() + 8, self.colTab )
	else
		draw.RoundedBox( 4, 0, 1, panel:GetWide(), panel:GetTall() + 8, self.colTabShadow )
		draw.RoundedBox( 4, 1, 2, panel:GetWide()-2, panel:GetTall() + 8, self.colTabInactive  )
	end
	
end
function SKIN:SchemeTab( panel )

	panel:SetFont( self.fontTab )

	local ExtraInset = 10

	if ( panel.Image ) then
		ExtraInset = ExtraInset + panel.Image:GetWide()
	end
	
	panel:SetTextInset( ExtraInset )
	panel:SizeToContents()
	panel:SetSize( panel:GetWide() + 10, panel:GetTall() + 8 )
	
	local Active = panel:GetPropertySheet():GetActiveTab() == panel
	
	if ( Active ) then
		panel:SetTextColor( self.colTabText )
	else
		panel:SetTextColor( self.colTabTextInactive )
	end
	
	panel.BaseClass.ApplySchemeSettings( panel )
		
end

function SKIN:LayoutTab( panel )

	panel:SetTall( 22 )

	if ( panel.Image ) then
	
		local Active = panel:GetPropertySheet():GetActiveTab() == panel
		
		local Diff = panel:GetTall() - panel.Image:GetTall()
		panel.Image:SetPos( 7, Diff * 0.6 )
		
		if ( !Active ) then
			panel.Image:SetImageColor( Color( 170, 170, 170, 155 ) )
		else
			panel.Image:SetImageColor( Color( 255, 255, 255, 255 ) )
		end
	
	end	
	
end



/*---------------------------------------------------------
	PropertySheet
---------------------------------------------------------*/
function SKIN:PaintPropertySheet( panel )

	local ActiveTab = panel:GetActiveTab()
	local Offset = 0
	if ( ActiveTab ) then Offset = ActiveTab:GetTall() end
	
	// This adds a little shadow to the right which helps define the tab shape..
	draw.RoundedBox( 4, 0, Offset, panel:GetWide(), panel:GetTall()-Offset, self.colPropertySheet )
	
end

/*---------------------------------------------------------
	ListView
---------------------------------------------------------*/
function SKIN:PaintListView( panel )

	if ( panel.m_bBackground ) then
		surface.SetDrawColor( 50, 50, 50, 255 )
		panel:DrawFilledRect()
	end
	
end
	
/*---------------------------------------------------------
	ListViewLine
---------------------------------------------------------*/
function SKIN:PaintListViewLine( panel )

	local Col = nil
	
	if ( panel:IsSelected() ) then
	
		Col = self.listview_selected
		
	elseif ( panel.Hovered ) then
	
		Col = self.listview_hover
		
	elseif ( panel.m_bAlt ) then
	
		Col = self.bg_alt2
		
	else
	
		return
				
	end
		
	surface.SetDrawColor( Col.r, Col.g, Col.b, Col.a )
	surface.DrawRect( 0, 0, panel:GetWide(), panel:GetTall() )
	
end


/*---------------------------------------------------------
	ListViewLabel
---------------------------------------------------------*/
function SKIN:SchemeListViewLabel( panel )

	panel:SetTextInset( 3 )
	panel:SetTextColor( Color( 255, 255, 255, 255 ) ) 
		
end



/*---------------------------------------------------------
	Form
---------------------------------------------------------*/
function SKIN:PaintForm( panel )

	local color = self.bg_color_sleep

	self:DrawGenericBackground( 0, 9, panel:GetWide(), panel:GetTall()-9, self.bg_color )

end
function SKIN:SchemeForm( panel )

	panel.Label:SetFont( "TabLarge" )
	panel.Label:SetTextColor( Color( 255, 255, 255, 255 ) )

end
function SKIN:LayoutForm( panel )

end


/*---------------------------------------------------------
	MultiChoice
---------------------------------------------------------*/
function SKIN:LayoutMultiChoice( panel )

	panel.TextEntry:SetSize( panel:GetWide(), panel:GetTall() )
	
	panel.DropButton:SetSize( panel:GetTall(), panel:GetTall() )
	panel.DropButton:SetPos( panel:GetWide() - panel:GetTall(), 0 )
	
	panel.DropButton:SetZPos( 1 )
	panel.DropButton:SetDrawBackground( false )
	panel.DropButton:SetDrawBorder( false )
	
	panel.DropButton:SetTextColor( Color( 30, 100, 200, 255 ) )
	panel.DropButton:SetTextColorHovered( Color( 50, 150, 255, 255 ) )
	
end


/*
NumberWangIndicator
*/

function SKIN:DrawNumberWangIndicatorText( panel, wang, x, y, number, alpha )

	local alpha = math.Clamp( alpha ^ 0.5, 0, 1 ) * 255
	local col = self.text_dark
	
	// Highlight round numbers
	local dec = (wang:GetDecimals() + 1) * 10
	if ( number / dec == math.ceil( number / dec ) ) then
		col = self.text_highlight
	end

	draw.SimpleText( number, "Default", x, y, Color( col.r, col.g, col.b, alpha ) )
	
end



function SKIN:PaintNumberWangIndicator( panel )
	
	/*
	
		Please excuse the crudeness of this code.
	
	*/

	if ( panel.m_bTop ) then
		surface.SetMaterial( self.texGradientUp )
	else
		surface.SetMaterial( self.texGradientDown )
	end
	
	surface.SetDrawColor( self.colNumberWangBG )
	surface.DrawTexturedRect( 0, 0, panel:GetWide(), panel:GetTall() )
	
	local wang = panel:GetWang()
	local CurNum = math.floor( wang:GetFloatValue() )
	local Diff = CurNum - wang:GetFloatValue()
		
	local InsetX = 3
	local InsetY = 5
	local Increment = wang:GetTall()
	local Offset = Diff * Increment
	local EndPoint = panel:GetTall()
	local Num = CurNum
	local NumInc = 1
	
	if ( panel.m_bTop ) then
	
		local Min = wang:GetMin()
		local Start = panel:GetTall() + Offset
		local End = Increment * -1
		
		CurNum = CurNum + NumInc
		for y = Start, Increment * -1, End do
	
			CurNum = CurNum - NumInc
			if ( CurNum < Min ) then break end
					
			self:DrawNumberWangIndicatorText( panel, wang, InsetX, y + InsetY, CurNum, y / panel:GetTall() )
		
		end
	
	else
	
		local Max = wang:GetMax()
		
		for y = Offset - Increment, panel:GetTall(), Increment do
			
			self:DrawNumberWangIndicatorText( panel, wang, InsetX, y + InsetY, CurNum, 1 - ((y+Increment) / panel:GetTall()) )
			
			CurNum = CurNum + NumInc
			if ( CurNum > Max ) then break end
		
		end
	
	end
	

end

function SKIN:LayoutNumberWangIndicator( panel )

	panel.Height = 200

	local wang = panel:GetWang()
	local x, y = wang:LocalToScreen( 0, wang:GetTall() )
	
	if ( panel.m_bTop ) then
		y = y - panel.Height - wang:GetTall()
	end
	
	panel:SetPos( x, y )
	panel:SetSize( wang:GetWide() - wang.Wanger:GetWide(), panel.Height)

end

/*---------------------------------------------------------
	CheckBox
---------------------------------------------------------*/
function SKIN:PaintCheckBox( panel )

	local w, h = panel:GetSize()

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawRect( 1, 1, w-2, h-2 )

	surface.SetDrawColor( 30, 30, 30, 255 )
	//=
	surface.DrawRect( 1, 0, w-2, 1 )
	surface.DrawRect( 1, h-1, w-2, 1 )
	//||
	surface.DrawRect( 0, 1, 1, h-2 )
	surface.DrawRect( w-1, 1, 1, h-2 )
	
	surface.DrawRect( 1, 1, 1, 1 )
	surface.DrawRect( w-2, 1, 1, 1 )
	
	surface.DrawRect( 1, h-2, 1, 1 )
	surface.DrawRect( w-2, h-2, 1, 1 )

end

function SKIN:SchemeCheckBox( panel )

	panel:SetTextColor( Color( 0, 0, 0, 255 ) )
	DSysButton.ApplySchemeSettings( panel )
	
end



/*---------------------------------------------------------
	Slider
---------------------------------------------------------*/
function SKIN:PaintSlider( panel )

end


/*---------------------------------------------------------
	NumSlider
---------------------------------------------------------*/
function SKIN:PaintNumSlider( panel )

	local w, h = panel:GetSize()
	
	self:DrawGenericBackground( 0, 0, w, h, Color( 255, 255, 255, 20 ) )
	
	surface.SetDrawColor( 0, 0, 0, 200 )
	surface.DrawRect( 3, h/2, w-6, 1 )
	
end


/*---------------------------------------------------------
	NumSlider
---------------------------------------------------------*/
function SKIN:PaintComboBoxItem( panel )

	if ( panel:GetSelected() ) then
		local col = self.combobox_selected
		surface.SetDrawColor( col.r, col.g, col.b, col.a )
		panel:DrawFilledRect()
	end

end

function SKIN:SchemeComboBoxItem( panel )
	panel:SetTextColor( Color( 0, 0, 0, 255 ) )
end

/*---------------------------------------------------------
	ComboBox
---------------------------------------------------------*/
function SKIN:PaintComboBox( panel )
	
	surface.SetDrawColor( 255, 255, 255, 255 )
	panel:DrawFilledRect()
		
	surface.SetDrawColor( 0, 0, 0, 255 )
	panel:DrawOutlinedRect()
	
end

/*---------------------------------------------------------
	ScrollBar
---------------------------------------------------------*/
function SKIN:PaintBevel( panel )

	local w, h = panel:GetSize()

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawOutlinedRect( 0, 0, w-1, h-1)
	
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 1, 1, w-1, h-1)

end


/*---------------------------------------------------------
	Tree
---------------------------------------------------------*/
function SKIN:PaintTree( panel )

	if ( panel.m_bBackground ) then
		surface.SetDrawColor( self.bg_color_bright.r, self.bg_color_bright.g, self.bg_color_bright.b, self.bg_color_bright.a )
		panel:DrawFilledRect()
	end

end



/*---------------------------------------------------------
	TinyButton
---------------------------------------------------------*/
function SKIN:PaintTinyButton( panel )

	if ( panel.m_bBackground ) then
	
		surface.SetDrawColor( 255, 255, 255, 255 )
		panel:DrawFilledRect()
	
	end
	
	if ( panel.m_bBorder ) then

		surface.SetDrawColor( 0, 0, 0, 255 )
		panel:DrawOutlinedRect()
	
	end

end

function SKIN:SchemeTinyButton( panel )

	panel:SetFont( "Default" )
	
	if ( panel:GetDisabled() ) then
		panel:SetTextColor( Color( 0, 0, 0, 50 ) )
	else
		panel:SetTextColor( Color( 0, 0, 0, 255 ) )
	end
	
	DLabel.ApplySchemeSettings( panel )
	
	panel:SetFont( "DefaultSmall" )

end

/*---------------------------------------------------------
	TinyButton
---------------------------------------------------------*/
function SKIN:PaintTreeNodeButton( panel )

	if ( panel.m_bSelected ) then

		surface.SetDrawColor( 50, 200, 255, 150 )
		panel:DrawFilledRect()
	
	elseif ( panel.Hovered ) then

		surface.SetDrawColor( 255, 255, 255, 100 )
		panel:DrawFilledRect()
	
	end
	
	

end

function SKIN:SchemeTreeNodeButton( panel )

	DLabel.ApplySchemeSettings( panel )

end

/*---------------------------------------------------------
	Tooltip
---------------------------------------------------------*/
function SKIN:PaintTooltip( panel )

	local w, h = panel:GetSize()
	
	DisableClipping( true )
	
	// This isn't great, but it's not like we're drawing 1000's of tooltips all the time
	for i=1, 4 do
	
		local BorderSize = i*2
		local BGColor = Color( 0, 0, 0, (255 / i) * 0.3 )
		
		self:DrawGenericBackground( BorderSize, BorderSize, w, h, BGColor )
		panel:DrawArrow( BorderSize, BorderSize )
		self:DrawGenericBackground( -BorderSize, BorderSize, w, h, BGColor )
		panel:DrawArrow( -BorderSize, BorderSize )
		self:DrawGenericBackground( BorderSize, -BorderSize, w, h, BGColor )
		panel:DrawArrow( BorderSize, -BorderSize )
		self:DrawGenericBackground( -BorderSize, -BorderSize, w, h, BGColor )
		panel:DrawArrow( -BorderSize, -BorderSize )
		
	end


	self:DrawGenericBackground( 0, 0, w, h, self.tooltip )
	panel:DrawArrow( 0, 0 )

	DisableClipping( false )
end

/*---------------------------------------------------------
	VoiceNotify
---------------------------------------------------------*/

function SKIN:PaintVoiceNotify( panel )

	local w, h = panel:GetSize()
	
	self:DrawGenericBackground( 0, 0, w, h, panel.Color )
	self:DrawGenericBackground( 1, 1, w-2, h-2, Color( 60, 60, 60, 240 ) )

end

function SKIN:SchemeVoiceNotify( panel )

	panel.LabelName:SetFont( "TabLarge" )
	panel.LabelName:SetContentAlignment( 4 )
	panel.LabelName:SetColor( color_white )
	
	panel:InvalidateLayout()
	
end

function SKIN:LayoutVoiceNotify( panel )

	panel:SetSize( 200, 40 )
	panel.Avatar:SetPos( 4, 4 )
	panel.Avatar:SetSize( 32, 32 )
	
	panel.LabelName:SetPos( 44, 0 )
	panel.LabelName:SizeToContents()
	panel.LabelName:CenterVertical()

end


derma.DefineSkin( "Default", "Made to look like regular VGUI", SKIN )