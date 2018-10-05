import haxe.io.Path;

class GameEntry {
	public function new(gameID:String, gameVersion:String, agiVersion:String, exists:Bool) {
		this.gameID = gameID;
		this.gameVersion = gameVersion;
		this.agiVersion = agiVersion;
		this.exists = exists;
	}

	@:isVar public var gameID:String;
	@:isVar public var gameVersion:String;
	@:isVar public var agiVersion:String;
	@:isVar public var exists:Bool;
	@:isVar public var path:Path;
}
