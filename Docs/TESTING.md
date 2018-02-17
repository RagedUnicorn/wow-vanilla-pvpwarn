# Testing

> The PVPWarn addon has a lot of tests to test the functionality of the parser and playing the respective sound files for warnings. However testing in a World of Warcraft environment is very limited and differs in how applications are usually tested.

The tests inside the test folder are split into the different categories that are available for the player to choose. This includes not only classes but also items and a misc category. Additionally there is a TestReporter that is responsible for creating a report of the tests by writing readable output into the chat window or a sort of log file.

## Test Types

The tests can be split into two different test categories sound and parsing. Sound tests are testing the availability and ability to play a certain sound file. While parse tests try to parse a certain combat message. The tests can be further split into different types of sound and parsing tests.

| Type              | Description                                                                                |
| ----------------- | ------------------------------------------------------------------------------------------ |
| Sound             | Testing a normal sound in response to a detected enemy spell                               |
| Sound down        | Testing the fading of an enemy spell and playing the fade sound of the respective spell    |
| Sound enemy avoid | Testing a sound in response to a spell that is avoided by an enemy                         |
| Sound self avoid  | Testing a sound in response to a spell that is avoided by the player itself                |
| Parse             | Testing the parsing of a normal enemy spell combat message                                 |
| Parse down        | Testing the parsing of a fading spell combat message                                       |
| Parse enemy avoid | Testing the parsing of an avoided spell by an enemy player                                 |
| Parse self avoid  | Testing the parsing of an avoided spell by the player itself                               |

## Testreporter

Some notes to the TestReporter:

The TestReporter was written because there is no provided way by Blizzard to test WoW-Addons. The reporter is not highly advanced and lacks functionalities that can be found in other languages and the available testing frameworks. However there is no such framework for WoW.

To visualize the result of the tests the reporter logs directly into the chat message window. To be able to read the results it might be necessary to disable other inputs into this window and making sure the addon is not set to debugging mode - see `PVPW_Logger.lua` to set the loglevel. The reporter logs what test is going to run, whether the test was successful or not and the end of a test.

The TestReporter also contains certain functionality to play sound files. While parsing tests are fast to run sound tests take some time because we need to prevent overlaying sound warnings into each other. Because of this problem the reporter puts such tests into a queue and plays them one after another. This is also mimicking how the addon itself works when playing warnings to the player.

## How to Run Tests

By default the test files are not included into the project file. Make sure that all of the files inside `./Test` are included in PVPWarn.toc.

Tests can either be run separately or all together. `PVPW_TestAll.lua` is used to test through all tests and provides a global function to start the tests `__PVPW__TEST_ALL()`.

Running functions from the chat message window can be done with `/run`

`/run __PVPW__TEST_ALL()`

Playing through all tests takes quite some time. Because of this every category can be played separate on its own. Every category provides some global functions to start all of the category tests or just some of the tests.

| Function                                        | Description                                                                                       |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test                   | Run all tests of the specific category                                                            |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Sound             | Check if there is a testcase to play sound for all entries in SpellMap                            |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Sound_Down        | Check if there is a testcase to play sound down for all entries in SpellMap                       |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Sound_Enemy_Avoid | Check if there is a testcase to play enemy avoid sound for all entries in SpellAvoidMap           |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Sound_Self_Avoid  | Check if there is a testcase to play self avoid sound for all entries in SpellAvoidMap            |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Parse             | Check if there is a testcase to parse combat message for all entries in spellMap                  |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Parse_Down        | Check if there is a testcase to parse down combat message for all entries in spellMap             |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Parse_Crit        | Check if there is a testcase to parse crit combat message for all entries in spellMap             |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Parse_Enemy_Avoid | Check if there is a testcase to parse enemy avoid combat message for all entries in spellAvoidMap |
| __PVPW__TEST\_[CATEGORY]\_[LOCALE]__Test_Parse_Self_Avoid  | Check if there is a testcase to parse self avoid combat message for all entries in spellAvoidMap  |

## Testing different Locale

The addon supports currently german and english locale. To run the tests either a german and english client are required or one can manipulate `GetLocale` function to run the tests.

The addon checks on upstart what locale the client is and loads different functions and data based on the locale. As an example both spellMap and spellAvoidMap load only the data required for the current locale. To trick the addon into thinking the client has a different locale than it actualy has we can manipulate the GetLocale function.

See `Code\PVPW_Core.lua` for a reference

```lua
local _G = getfenv(0)

function _G.GetLocale()
  return "deDE"
end
```

By overriding the GetLocale function we can return whatever locale we want. It is important to do this very early before the actual addon initializing otherwise the wrong functions and data might already have loaded. After that `/run __PVPW__TEST_ALL()` can be used to run the tests. The addon will use only the chosen locale tests.

***Note:*** This only works for running the tests because all the combat messages that are parsed are hardcoded. As soon as a real event is received and it doesn't match it will not work.

## Playing Sound Tests

For playing sounds some preconditions have to be meet otherwise the tests fail.

* Keep focus on WoW Window
  * WoW is only able to play sound to the player if the window is active. During a test run the focus of the window should not be lost otherwise tests will fail.
* Enable master sound in WoW settings
  * Make sure to enable master sound for WoW otherwise the addon will warn you about not being able to play sound to the player and tests will fail.

![](/Docs/pvpw_enable_sound.jpg)

## Logging Tests to File

Logging to a file from within WoW is very limited. For this to work savedvariables are used to store big blobs of text.

Configure the `PVPWarn.toc` file with the PVPWarnlog variable:


```
## SavedVariables: PVPWarnOptions, PVPWarnLog
## SavedVariablesPerCharacter: PVPWarnOptions, PVPWarnLog
```

Make sure that the variable itself is initialized (this is done in `PVPW_Core.lua`)

```lua
PVPWarnLog = {}
```

Additionally the TestReporter has to be configured to log to a logFile

```lua
local writeLogFile = true
```

After running a test and logging out the report should be inside the addon configuration file.

`[World of Warcraft installation-folder]/WTF/Account/[username]/[servername]/[charactername]/SavedVariables/PVPWarn.lua`

***Note:*** The file will be big if all tests were ran make sure to search for Keywords such as `fail` and `missing`.

**Notes:**

The TestReport also allows to reset the content of this savedvariables with the function `ClearSavedTestReports`. Calling this function before starting the tests might be the best way to be able to read the report afterwards. However the TestReporter is able to store multiple different reports.

Because of the limitation of how WoW writes text to files it is necessary to at least logout with the current loggedin character. Make sure that you do a clean logout and not forcing to close the game by alt + f4 or something similar otherwise the result cannot be written to the file and will be lost.

## Debugging

If a test fails and further debugging is needed it might be necessary to set the loglevel for the logger inside the different categories. As of now the full category tests set the loglevel to 1 (error) to prevent cluttering of the output. However this can be changed for the purpose of debugging the tests but has to be done manually in each testclass.
