import haxe.unit.TestRunner;
import haxe.io.Path;

class Main {
	static function main() {
		// Determine the original OS of the game to test.
		var gameOS = "dos";
		var osTypes = [
			"DOS",
			"AMIGA"
			// ADD OTHER Supported platforms
		];

		//if (Sys.args().length != 1)
		//	throw "Specify a valid OS type.";

		for (arg in Sys.args()) {
			if (osTypes.indexOf(arg.toUpperCase()) != -1)
				gameOS = arg.toUpperCase();
			else
				throw 'Invalid OS type specified: $arg';
		}

		gameOS = "dos";

		// Point the current working directory to the AGIDATA folder
		// that contains the games.
		var path = Path.join([Sys.getCwd(), "AGIDATA", gameOS.toUpperCase()]);
		if (!sys.FileSystem.exists(path.toString()))
			throw "Cannot find the AGIDATA folder relative to this executable.";

		Sys.setCwd(path.toString());

		var gameTestConfigurator = new GameConfigurator();
		gameTestConfigurator.detectGames();
		var tests = gameTestConfigurator.buildTests();

		var runner = new TestRunner();

		for (test in tests)
			runner.add(test);

		runner.run();
	}
}
