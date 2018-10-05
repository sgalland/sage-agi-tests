import GameEntry;
import haxe.io.Path;
import haxe.unit.TestCase;
import tests.AGIInterpreter;

using StringTools;

class GameConfigurator {
	private var gameConfigurations:Array<GameEntry>;

	public function new() {
		buildGameEntries();
	}

	public function detectGames() {
		for (entry in gameConfigurations) {
			var agiVersionPath = "AGI" + entry.agiVersion.charAt(0);
			var gamePath = entry.gameID + "_" + entry.agiVersion.replace(".", "_");
			var path = new Path(Path.join([Sys.getCwd(), agiVersionPath, gamePath]));

			entry.exists = sys.FileSystem.exists(path.toString());

			if (!entry.exists) {
				var gameID = entry.gameID;
				throw 'Game $gameID was found.\n$path';
			}

			entry.path = path;
		}
	}

	public function buildTests():Array<TestCase> {
		var testCases = new Array<TestCase>();

		for (entry in gameConfigurations) {
			testCases.push(new AGIInterpreter(entry));
		}

		return testCases;
	}

	private function buildGameEntries() {
		gameConfigurations = new Array<GameEntry>();
		gameConfigurations.push(new GameEntry("BC", "2.0", "2.439", false));
		gameConfigurations.push(new GameEntry("MM", "", "2.915", false)); // I don't know Mixed Up Mother Gooses game version, need to manually look it up
	}
}
