if global.kActionRelease && !global.kRun && !instance_exists(oFadeToEnding)
{
	if !instance_exists(oTextbox)
	{
		sysNPC.say.Table.dialog();
	}
}