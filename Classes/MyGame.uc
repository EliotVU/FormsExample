// This is your game. Start from this or modify your game to reference the FormsPlayerController/MyPlayerController
class MyGame extends UDKGame;

static event class<GameInfo> SetGameType( string MapName, string Options, string Portal )
{
	return default.Class;
}

defaultproperties
{
	PlayerControllerClass=class'MyPlayerController'
}