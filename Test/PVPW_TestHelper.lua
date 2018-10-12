--[[
  MIT License

  Copyright (c) 2018 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

local mod = pvpw
local me = {}
mod.testHelper = me

me.tag = "TestHelper"

local playerPlaceholder = "%$player%$"
local amountPlaceholder = "%$amount%$"
local dummyPlayerName = "Player"
local dummyNumber = "100"

me.eventTypeSpellPeriodicSelfDamage = "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"
me.eventTypeSpellHostilePlayerBuff = "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"
me.eventTypeSpellPeriodicHostilePlayerBuffs = "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"
me.eventTypeSpellHostilePlayerDamage = "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE"
me.eventTypeSpellPeriodicSpellHostilePlayerDamage = "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
me.eventTypeSpellAuraGoneOther = "CHAT_MSG_SPELL_AURA_GONE_OTHER"
me.eventTypeSpellSelfDamage = "CHAT_MSG_SPELL_SELF_DAMAGE"


me.testType = {
  setup = 1,
  sound = 2,
  soundDown = 3,
  parse = 4,
  parseDown = 5,
  soundAvoid = 6,
  parseAvoid = 7,
  soundSelfAvoid = 8,
  parseSelfAvoid = 9
}

--[[
  Get testtype by its numeric value

  @param {number} testType
  @return {string | nil}
    returns the testType name as string or nil if none can be found
]]--
function me.GetTestType(testType)
  for k, v in pairs(me.testType) do
    if v == testType then
      return k
    end
  end

  return nil
end

--[[
  Prepare a passed combat message by replacing player and number with dummy values

  @param {string} msg
  @return {string}
    Prepared combat message
]]--
function me.PrepareCombatMessage(msg)
  local combatMessage = msg

  -- replace with dummy player
  combatMessage = string.gsub(combatMessage, playerPlaceholder, dummyPlayerName)
  -- replace with dummy number
  combatMessage = string.gsub(combatMessage, amountPlaceholder, dummyNumber)

  return combatMessage
end

--[[
  Create new testReport

  @param {string} className
  @param {string} prefix
    prefix for the testset
  @return {table}
]]--
function me.StartNewTestSet(className, prefix)
  local testReport = {}
  -- start new testset and save reference to it
  testReport.testEntry = mod.testReporter.WriteLogFileNewTest(prefix)
  testReport.className = className

  return testReport
end

--[[
  Tests if a sound testcase can be found for each registered spell in PVPW_SpellMap

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveASoundTestForEachSpell(module, className)
  local testName = "TestShouldHaveASoundTestForEachSpell"
  local spellMap = mod.spellMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, value in pairs(spellMap) do
    -- fix lower to uppercase
    local testFunctionName = key

    testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
    testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
    testFunctionName = string.gsub(testFunctionName, "_", "")

    if type(module["TestSound" .. testFunctionName]) == "function" then
      mod.testReporter.ReportSuccessTest(className, testName, testType,
        string.format("Found sound test function for %s", testFunctionName))
    else
      mod.testReporter.ReportFailTest(className, testName, testType,
        string.format("Missing sound test function for %s", testFunctionName))
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Tests if a sound down testcase can be found if a spell is marked with having a fade sound

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveASoundDownTestForSpellsThatFade(module, className)
  local testName = "TestShouldHaveASoundDownTestForSpellsThatFade"
  local spellMap = mod.spellMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, value in pairs(spellMap) do
    -- fix lower to uppercase
    local testFunctionName = key

    testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
    testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
    testFunctionName = string.gsub(testFunctionName, "_", "")

    -- only spells that are marked as having a fade sound need to have a test
    if spellMap[key].hasFade then
      if type(module["TestSoundDown" .. testFunctionName]) == "function" then
        mod.testReporter.ReportSuccessTest(className, testName, testType,
          string.format("Found sound down test function for %s", testFunctionName))
      else
        mod.testReporter.ReportFailTest(className, testName, testType,
          string.format("Missing sound down test function for %s", testFunctionName))
      end
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Tests if there is a parse testcase for each registered spell in PVPW_SpellMap

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveAParseTestForEachSpell(module, className)
  local testName = "TestShouldHaveAParseTestForEachSpell"
  local spellMap = mod.spellMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, value in pairs(spellMap) do
    -- fix lower to uppercase
    local testFunctionName = key

    testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
    testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
    testFunctionName = string.gsub(testFunctionName, "_", "")

    if type(module["TestParse" .. testFunctionName]) == "function" then
      mod.testReporter.ReportSuccessTest(className, testName, testType,
        string.format("Found parse test function for %s", testFunctionName))
    else
      mod.testReporter.ReportFailTest(className, testName, testType,
        string.format("Missing parse test function for %s", testFunctionName))
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Tests if there is a parse down testcase for each spell that is marked with having a fade sound

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveAParseDownTestForSpellsThatFade(module, className)
  local testName = "TestShouldHaveAParseDownTestForSpellsThatFade"
  local spellMap = mod.spellMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, value in pairs(spellMap) do
    -- fix lower to uppercase
    local testFunctionName = key

    testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
    testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
    testFunctionName = string.gsub(testFunctionName, "_", "")

    -- only spells that are marked as having a fade sound need to have a test
    if spellMap[key].hasFade then
      if type(module["TestParseDown" .. testFunctionName]) == "function" then
        mod.testReporter.ReportSuccessTest(className, testName, testType,
          string.format("Found parse down test function for %s", testFunctionName))
      else
        mod.testReporter.ReportFailTest(className, testName, testType,
          string.format("Missing parse down test function for %s", testFunctionName))
      end
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Tests if there is a parse crit testcase for each spell that is marked with having the possibility to crit

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveAParseCritTestForSpellsThatCanCrit(module, className)
  local testName = "TestShouldHaveAParseCritTestForSpellsThatCanCrit"
  local spellMap = mod.spellMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, value in pairs(spellMap) do
    -- fix lower to uppercase
    local testFunctionName = key

    testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
    testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
    testFunctionName = string.gsub(testFunctionName, "_", "")

    -- only spells that are marked as being able to crit need to have a test
    if spellMap[key].canCrit then
      if type(module["TestParseCrit" .. testFunctionName]) == "function" then
        mod.testReporter.ReportSuccessTest(className, testName, testType,
          string.format("Found parse crit test function for %s", testFunctionName))
      else
        mod.testReporter.ReportFailTest(className, testName, testType,
          string.format("Missing parse crit test function for %s", testFunctionName))
      end
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Tests if there is an avoid sound testcase for each spell that is found in spellAvoidMap

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveAnEnemyAvoidSoundTestForEachSpell(module, className)
  local testName = "TestShouldHaveAnEnemyAvoidSoundTestForEachSpell"
  local spellAvoidMap = mod.spellAvoidMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, value in pairs(spellAvoidMap) do
    local testFunctionName = key

    -- ignore spells that are not marked for enemy avoid support
    if spellAvoidMap[key].enemy_avoid then
      testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
      testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
      testFunctionName = string.gsub(testFunctionName, "_", "")

      if type(module["TestSoundEnemyAvoid" .. testFunctionName]) == "function" then
        mod.testReporter.ReportSuccessTest(className, testName, testType,
          string.format("Found avoid sound test function for %s", testFunctionName))
      else
        mod.testReporter.ReportFailTest(className, testName, testType,
          string.format("Missing avoid sound test function for %s", testFunctionName))
      end
    else
      mod.logger.LogDebug(me.tag, "Ignoring EnemyAvoidSoundTest for " .. key .." because spell is excluded")
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Tests if there is a parse testcase for each spell in spellAvoidMap and its
  marked possible avoidance. E.g. dodge, parry etc.

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveAnEnemyAvoidParseTestForEachSpell(module, className)
  local testName = "TestShouldHaveAnEnemyAvoidParseTestForEachSpell"
  local spellAvoidMap = mod.spellAvoidMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, spell in pairs(spellAvoidMap) do
    local testFunctionName = key

    -- ignore spells that are not marked for enemy avoid support
    if spellAvoidMap[key].enemy_avoid then
      testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
      testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
      testFunctionName = string.gsub(testFunctionName, "_", "")

      if spell.dodge then
        if type(module["TestParseEnemyAvoidDodge" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid dodge parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid dodge parse test function for %s", testFunctionName))
        end
      end

      if spell.parry then
        if type(module["TestParseEnemyAvoidParry" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid parry parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid parry parse test function for %s", testFunctionName))
        end
      end

      if spell.immune then
        if type(module["TestParseEnemyAvoidImmune" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid immune parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid immune parse test function for %s", testFunctionName))
        end
      end

      if spell.miss then
        if type(module["TestParseEnemyAvoidMiss" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid miss parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid miss parse test function for %s", testFunctionName))
        end
      end

      if spell.block then
        if type(module["TestParseEnemyAvoidBlock" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid block parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid block parse test function for %s", testFunctionName))
        end
      end

      if spell.resist then
        if type(module["TestParseEnemyAvoidResist" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid resist parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid resist parse test function for %s", testFunctionName))
        end
      end
    else
      mod.logger.LogDebug(me.tag, "Ignoring EnemyAvoidSoundTest for " .. key .." because spell is excluded")
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Tests if there is a self avoid sound testcase for each spell that is found in spellAvoidMap

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveASelfAvoidSoundTestForEachSpell(module, className)
  local testName = "TestShouldHaveASelfAvoidSoundTestForEachSpell"
  local spellAvoidMap = mod.spellAvoidMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, value in pairs(spellAvoidMap) do
    local testFunctionName = key

    -- ignore spells that are not marked for enemy avoid support
    if spellAvoidMap[key].self_avoid then
      testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
      testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
      testFunctionName = string.gsub(testFunctionName, "_", "")

      if type(module["TestSoundSelfAvoid" .. testFunctionName]) == "function" then
        mod.testReporter.ReportSuccessTest(className, testName, testType,
          string.format("Found self avoid sound test function for %s", testFunctionName))
      else
        mod.testReporter.ReportFailTest(className, testName, testType,
          string.format("Missing self avoid sound test function for %s", testFunctionName))
      end
    else
      mod.logger.LogDebug(me.tag, "Ignoring SelfAvoidSoundTest for " .. key .." because spell is excluded")
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Tests if there is an parse testcase for each spell in spellAvoidMap and its
  marked possible avoidance. E.g. dodge, parry etc.

  @param {table} module
  @param {string} className
]]--
function me.TestShouldHaveASelfAvoidParseTestForEachSpell(module, className)
  local testName = "TestShouldHaveASelfAvoidParseTestForEachSpell"
  local spellAvoidMap = mod.spellAvoidMap.GetAllForCategory(className)
  local testType = me.testType.setup

  mod.testReporter.StartTest(className, testType, testName)

  for key, spell in pairs(spellAvoidMap) do
    local testFunctionName = key

    -- ignore spells that are not marked for enemy avoid support
    if spellAvoidMap[key].self_avoid then
      testFunctionName = string.gsub(testFunctionName, "_%a", string.upper)
      testFunctionName = string.gsub(testFunctionName, "^%l", string.upper)
      testFunctionName = string.gsub(testFunctionName, "_", "")

      if spell.dodge then
        if type(module["TestParseSelfAvoidDodge" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid dodge parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid dodge parse test function for %s", testFunctionName))
        end
      end

      if spell.parry then
        if type(module["TestParseSelfAvoidParry" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid parry parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid parry parse test function for %s", testFunctionName))
        end
      end

      if spell.immune then
        if type(module["TestParseSelfAvoidImmune" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid immune parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid immune parse test function for %s", testFunctionName))
        end
      end

      if spell.miss then
        if type(module["TestParseSelfAvoidMiss" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid miss parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid miss parse test function for %s", testFunctionName))
        end
      end

      if spell.block then
        if type(module["TestParseSelfAvoidBlock" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid block parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid block parse test function for %s", testFunctionName))
        end
      end

      if spell.resist then
        if type(module["TestParseSelfAvoidResist" .. testFunctionName]) == "function" then
          mod.testReporter.ReportSuccessTest(className, testName, testType,
            string.format("Found avoid resist parse test function for %s", testFunctionName))
        else
          mod.testReporter.ReportFailTest(className, testName, testType,
            string.format("Missing avoid resist parse test function for %s", testFunctionName))
        end
      end
    else
      mod.logger.LogDebug(me.tag, "Ignoring SelfAvoidSoundTest for " .. key .." because spell is excluded")
    end
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Test playing sound for a certain spell to the player

  @param {string} className
  @param {string} testName
  @param {string} spellName
]]--
function me.TestSound(className, testName, spellName)
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.sound
  local spellType = PVPW_CONSTANTS.SPELL_TYPES.SPELL
  local status = 0

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, spellType, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Test playing sound down for a certain spell to the player

  @param {string} className
  @param {string} testName
  @param {string} spellName
]]--
function me.TestSoundDown(className, testName, spellName)
  local _, spellData = mod.spellMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundDown
  local spellType = PVPW_CONSTANTS.SPELL_TYPES.SPELL_DOWN
  local status = 0

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, spellType, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound down for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound down for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Test playing sound enemy avoid for a certain spell to the player

  @param {string} className
  @param {string} testName
  @param {string} spellName
]]--
function me.TestSoundEnemyAvoid(className, testName, spellName)
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundAvoid
  local spellType = PVPW_CONSTANTS.SPELL_TYPES.ENEMY_AVOIDED
  local status = 0

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, spellType, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound enemy avoid for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound enemy avoid for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Test playing sound self avoid for a certain spell to the player

  @param {string} className
  @param {string} testName
  @param {string} spellName
]]--
function me.TestSoundSelfAvoid(className, testName, spellName)
  local _, spellData = mod.spellAvoidMap.SearchByName(spellName)
  local testType = mod.testHelper.testType.soundSelfAvoid
  local spellType = PVPW_CONSTANTS.SPELL_TYPES.SELF_AVOIDED
  local status = 0

  mod.testReporter.StartTest(className, testType, testName)

  status = mod.sound.PlaySound(className, spellType, spellData.soundFileName)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully played sound enemy avoid for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to play sound enemy avoid for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Test parsing a normal spell combat message

  @param {string} className
  @param {string} testName
  @param {string} spellName
  @param {string} combatMessage
  @param {string} eventType

]]--
function me.TestParse(className, testName, spellName, combatMessage, eventType)
  local testType = mod.testHelper.testType.parse
  local status = 0

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = lp.parser.ParseCombatText(combatMessage, eventType)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Test parsing a spell down combat message

  @param {string} className
  @param {string} testName
  @param {string} spellName
  @param {string} combatMessage
  @param {string} eventType
]]--
function me.TestParseDown(className, testName, spellName, combatMessage, eventType)
  local testType = mod.testHelper.testType.parseDown
  local status = 0

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = lp.parser.ParseCombatText(combatMessage, eventType)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText down for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText down for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Test parsing an enemy spell avoid combat message

  @param {string} className
  @param {string} testName
  @param {string} spellName
  @param {string} combatMessage
  @param {string} eventType
  @param {string} avoidType
]]--
function me.TestParseEnemyAvoid(className, testName, spellName, combatMessage, eventType, avoidType)
  local testType = mod.testHelper.testType.parseAvoid
  local status = 0

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = lp.parser.ParseCombatText(combatMessage, eventType)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText enemy "
        .. avoidType .. " for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText enemy "
        .. avoidType .. " for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end

--[[
  Test parsing a self spell avoid combat message

  @param {string} className
  @param {string} testName
  @param {string} spellName
  @param {string} combatMessage
  @param {string} eventType
  @param {string} avoidType
]]--
function me.TestParseSelfAvoid(className, testName, spellName, combatMessage, eventType, avoidType)
  local testType = mod.testHelper.testType.parseSelfAvoid
  local status = 0

  mod.testReporter.StartTest(className, testType, testName)

  combatMessage = mod.testHelper.PrepareCombatMessage(combatMessage)
  status, _ = lp.parser.ParseCombatText(combatMessage, eventType)

  if status == 1 then
    mod.testReporter.ReportSuccessTest(className, testName, testType,
      string.format("Successfully parsed combatText self "
        .. avoidType .. " for %s", spellName))
  else
    mod.testReporter.ReportFailTest(className, testName, testType,
      string.format("Failed to parse combatText self "
        .. avoidType .. " for %s", spellName))
  end

  mod.testReporter.EndTest(className, testType, testName)
end
