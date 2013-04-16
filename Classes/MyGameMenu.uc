class MyGameMenu extends FPage;

// Exit the game button.
var() `{Automated} FButton BExit;

/** Clear all object references for garbage collecting. */
function Free()
{
	super.Free();
	BExit = none;
}

protected function InitializeComponent()
{
	// Very important! Without it the page would be invisible due important core changes done with FComponent.uc
	super.InitializeComponent();

	// Hook the OnClick event, which is clicked on either left or right mouse click.
	BExit.OnClick = ComponentClicked;
}

/** Executed whenever a button is pressed(If delegated) */
protected function ComponentClicked( FComponent sender, optional bool bRight )
{
	switch( sender )
	{
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
	
	begin object name=oBExit class=FButton
		RelativePosition=(X=0.0,Y=1.0)
		RelativeSize=(X=1.0,Y=0.1)
		VerticalDock=VD_Bottom	// Snap to the bottom (Pos Y becomes the end position and Size Y becomes the offset from the end)
		// Read text from the UDKGameUI.int file.
		Text="@UDKGameUI.Generic.Exit"
		// So we can apply a customized styling.
		StyleNames.Add(QuitButton)
	end object
	BExit=oBExit
	Components.Add(oBExit)