package tests;

class GameTestCase extends haxe.unit.TestCase {
	private var gameEntry:GameEntry;

	public function new(gameEntry:GameEntry) {
		super();

		this.gameEntry = gameEntry;
		Sys.setCwd(gameEntry.path.toString());
	}
}
