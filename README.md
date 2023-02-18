# mirrorboard-mac

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat)](https://github.com/RichardLitt/standard-readme)
[![GitHub license](https://img.shields.io/github/license/qubist/mirrorboard-mac.svg)](https://github.com/qubist/mirrorboard-mac/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/qubist/mirrorboard-mac.svg)](https://github.com/qubist/mirrorboard-mac/stargazers)
[![Twitter](https://img.shields.io/twitter/url/https/github.com/qubist/mirrorboard-mac.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fqubist%2Fmirrorboard-mac)

Intuitive one-handed typing on macOS by mirroring the keyboard while spacebar is held

## Table of Contents

* [Background](#background)
* [Install](#install)
  * [Extra configuration](#extra-configuration)
* [Usage](#usage)
* [Notes](#notes)

## Background
Inspired by Randall Munroe of [xkcd](https://blog.xkcd.com/2007/08/14/mirrorboard-a-one-handed-keyboard-layout-for-the-lazy/) and informed by many others across the internet, I've created an implementation of this concept for macOS.

Karabiner-Elements powers this. It's a wonderful piece of software that's completely free, open source, and great for any type of keyboard modification you might want to do on a Mac.

## Install
1. Download and install [Karabiner-Elements](https://pqrs.org/osx/karabiner/)
2. Open this URL in your browser to import the mirrorboard-mac complex modification into karabiner: `karabiner://karabiner/assets/complex_modifications/import?url=https://github.com/qubist/mirrorboard-mac/raw/master/mirrorboard-mac.json`
 You can also download [the JSON file of the complex modification](mirrorboard-mac.json) from this repo and import it manually by adding it to `~/.config/karabiner/assets/complex_modifications`
3. Open the Karabiner-Elements Preferences window, and enable (or add and enable) the mirrorboard-mac rule in the Complex Modifications tab.

Your keyboard should now be mirror-able! Test it out by holding the spacebar and typing something.

### Extra configuration

I found that having the spacebar output a space only on key-up was manageable, but awkward at times. Here's how to make a keyboard shortcut that could toggle the keyboard mirroring functionality on and off:

1. In the Karabiner-Elements Preferences window, Remove the mirrorboard-mac modification we added in step 3 of [the installation](#install). Don't worry, it'll still be installed, it's just no longer enabled. We'll add it back soon enough.
2. Go to the Misc tab and turn the "Show profile name in menu bar" option on. (Strictly you don't need to do this, but it will be how we can see whether mirroring is on or off.)
3. Next, we need to create two profiles that we can switch between to enable and disable mirroring.

 If you're only using Karabiner-Elements for this, go to the Profile tab and create a new profile.

 If you also use Karabiner-Elements for things besides mirrorboard-mac, you'll need to duplicate your profile so you don't lose your other modifications when switching mirroring on and off. There's no way to do this in the GUI, so you'll have to open the file karabiner.json in `~/.config/karabiner/` and copy-and-paste to duplicate the the item inside the first set of curly braces after `"profiles":` **Now you should have two profiles that are exactly the same, either empty or both containing duplicate copies of your pre-existing Karabiner-Elements configuration.** Name one "Mirroring" and one "Default" or something like that. I have mine named "␣●" and "␣○" so that they take up less space on my menu bar.

4. Now, add the mirrorboard-mac modification back to one of your profiles.

 **At this stage, we can enable and disable keyboard mirroring by selecting between our two profiles from the display in the menu bar. But this isn't enough!**

5. We want a keyboard shortcut that can toggle between our two profiles. To do this, we need to create an Automator automation. Open Automator and create a new automation: File &gt; New. Choose "Service" and set Service recieves to "no input" in "any application". Then add the action "Run Shell Script". Select `/usr/bin/perl` in the list of Shells and then enter [this Perl script](toggle_profiles.pl) into the text field. Then replace all the all-caps sections starting with `YOUR_` with your own data.

6. Test if this is working by hitting Run. **This should toggle between your profiles!** Save it if it's working.

7. Now go into System Preferences &gt; Keyboard &gt; Shortcuts &gt; Services. If you scroll to near the bottom, you should see the Automation you just made as an item there under the "General" heading. Select it and add a shortcut of your choosing.

8. Go to System Preferences &gt; Security & Privacy &gt; Privacy and add Automator to the list of apps that are allowed to control your computer.

9. Done! Your keyboard shortcut should now toggle between mirrorboard-mac being enabled and being disabled.

## Usage

Hold space while typing to mirror the keyboard.

## Notes

The keyboard layout in the Karabiner-Elements modification file is set up for ANSI keyboards. It should be easy to modify for ISO keyboards.

It also should be compatible with many, many keyboard layouts like the ones you can choose from and switch between in System Preferences. For example, I use the Dvorak keyboard layout by adding the Dvorak Input Source in system preferences. With no modifications, this Karabiner-Elements modification still works for me. This is because Karabiner-Elements reads inputs, and modifies them, directly from the keyboard, before they are transformed by layouts you've applied through System Preferences (see this in action by switching to an alternate layout through System Preferences, opening Karabiner-EventViewer, and watching all your keystrokes match up with what's written on your keyboard).

## Contribute 

Pull requests are accepted.

## License

[MIT License](/LICENSE)
