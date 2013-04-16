class MyMainMenu extends FPage;

// A simple label displaying the player's name.
var() `{Automated} FLabel LPlayerName;

// Reference to the play FButton.
var() `{Automated} FButton BPlay;

// Reference to the exit FButton.
var() `{Automated} FButton BExit;

/** Clear all object references for garbage collecting. */
function Free()
{
	super.Free();
	LPlayerName = none;
	BPlay = none;
	BExit = none;
}

/** Executed when Initialize() is called. */
protected function InitializeComponent()
{
	local PlayerReplicationInfo PRI;

	// Very important! Without it the page would be invisible due important core changes done with FComponent.uc
	super.InitializeComponent();

	PRI = Player().PlayerReplicationInfo;
	if( PRI != none )
	{
		LPlayerName.SetText( PRI.PlayerName );
	}

	// Hook the OnClick event, which is clicked on either left or right mouse click.
	BPlay.OnClick = ComponentClicked;
	BExit.OnClick = ComponentClicked;
}

/** Executed whenever a button is pressed(If delegated) */
protected function ComponentClicked( FComponent sender, optional bool bRight )
{
	switch( sender )
	{
		case BPlay:
			ConsoleCommand( "open ExampleMap.udk" );
			break;

		case BExit:	
			// Exit the game.
			ConsoleCommand( "Exit" );
			break;
	}
}

defaultproperties
{
	// Centered
	RelativePosition=(X=0.375,Y=0.10)
	RelativeSize=(X=0.25,Y=0.8)

	begin object name=oLPlayerName class=FLabel
		RelativePosition=(X=0.0,Y=0.0)
		RelativeSize=(X=1.0,Y=0.1)
		RelativeOffset=(X=0,Y=0)
		Text="PLAYERNAME"
		TextAlign=TA_Center
		TextVAlign=TA_Top
	end object
	LPlayerName=oLPlayerName
	Components.Add(oLPlayerName)

	begin object name=oBPlay class=FButton
		RelativePosition=(X=0.0,Y=0.1)
		RelativeSize=(X=1.0,Y=0.1)
		// Read text from the UDKGameUI.int file.
		Text="Play ExampleMap.udk"
	end object
	BPlay=oBPlay
	Components.Add(oBPlay)

	begin object name=oBExit class=FButton
		RelativePosition=(X=0.0,Y=1.0)
		RelativeSize=(X=1.0,Y=0.1)
		VerticalDock=VD_Bottom	// Snap to the bottom (Pos Y becomes the end position and Size Y becomes the offset from the end)
		// Read text from the UDKGameUI.int file.
		Text="@UDKGameUI.Generic.Exit"
		// So we can apply a customized styling.
		StyleNames.Add(QuitButton)
		begin object name=oToolTip class=FToolTip
			ToolTipText="Exit the game?"
		end object
		ToolTipComponent=oToolTip
	end object
	BExit=oBExit
	Components.Add(oBExit)
}