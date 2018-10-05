package tests;

import sage.agi.AGIVersion;
import sage.agi.resources.AGIFileReader;

class AGIInterpreter extends GameTestCase {
	public function new(gameEntry:GameEntry) {
		super(gameEntry);
	}

	public function testAGIVersion() {
		var agiVersion = AGIVersion.getVersion();
		assertTrue(agiVersion != null);
	}

	/**
	 * Test loading VIEW resources.
	 */
	public function testViewLoading() {
		var loader = new AGIFileReader();
		loader.loadDirectoryEntries(sage.agi.EAGIFileName.VIEW);
		var entries = loader.directoryEntries.length;

		if (gameEntry.gameID == "BC")
			assertTrue(entries == 100);
		else if (gameEntry.gameID == "MM")
			assertTrue(entries == 100);
		else
			throw "Unknown game VIEW entries.";
	}
}
