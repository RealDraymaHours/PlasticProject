global.kUp = keyboard_check(ord("W"));
global.kLeft = keyboard_check(ord("A"));
global.kRight = keyboard_check(ord("D"));
global.kDown = keyboard_check(ord("S"));

global.kAction = keyboard_check(vk_space);
global.kActionRelease = keyboard_check_released(vk_space);
global.kRun = keyboard_check(vk_shift);

/*
if global.kRun
{
	global.kAction = false;
	global.kActionRelease = false;
}
*/

#region Camera



#endregion