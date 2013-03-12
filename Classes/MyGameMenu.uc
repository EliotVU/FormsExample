class MyGameMenu extends FPage;

// Exit the game button.
var() `{Automated} FButton BExit;

/** Clear all object references for garbage collecting. */
function Free()
{
	super.Free();
	BExit = none;
}

/** Executed whenever a button is pressed(If delegated) */
function Click( FComponent sender, optional bool bRight )
{
	switch( sender )
	{
		case BExit:	
			// Exit the game.
			sender.ConsoleCommand( "Exit" );
			break;
	}
}

defaultproperties
{
	// Centered
	RelativePosition=(X=0.25,Y=0.10)
	RelativeSize=(X=0.25,Y=0.8)

	begin object name=oBExit class=FButton
		RelativePosition=(X=1.0,Y=1.0)
		RelativeSize=(X=0.1,Y=0.05)
		HorizontalDock=HD_Right // Snap to the right (Pos X becomes the end position and Size X becomes the offset from the end)
		VerticalDock=VD_Bottom	// Snap to the bottom (Pos Y becomes the end position and Size Y becomes the offset from the end)
		Text="Exit"
		// Executes in Default_MyMainMenu, all references will be NONE! 
		//	- Use sender.Controller instead of just Controller!
		OnClick=Click
	end object
	BExit=oBExit
	Components.Add(oBExit)
}