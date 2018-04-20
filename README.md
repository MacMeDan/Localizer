#  Localizer

### Purpose:
    To make Localization simple, automatic, and pain free.

## Usage
### Recommended:

1. Generate the executable script
2. Add Script to base of your project
3. Run script on build

### Alternative: 
 Run the project and use the CLI ( Command Line interface ) to interact with the program. 

# Executable Script

To generate a executable script you have to combine all necessary pieces of this project into a single executable. By default the executable automatically executes a modified version of option `6 Find Strings in file` of the command line tool but instead of prompting for the path it takes the path to a folder as a parameter. It will then look for any file within that folder that is of type `.swift` and scan it for unlocalized strings.

You can modify the scripts as you please to suite your own needs and regenerate the executable script.

To create an executable you will need to combine all dependencies including extensions. To create the `Localizer` executable that is found in this project you just need to navigate thought `terminal` to this project on your computer. Then run this command :
`swiftc FileLocalizer.swift extensions/url.swift extensions/Strings.swift -o Localizer`

This creates an executable named `Localizer`. To use this script you preface it with `./` then the script `Localizer` add a space to seperate the script from the parameter then add the parameter which is a path to a folder in your project.
`./Localizer "/Users/macmedan/Swift/auto-source-inspection/InspectionTool/views"`

Then watch the magic happen. Make sure to review all changes that have been made to your project and that they are correct. Open a new issue and submit a fix if there is a way to improve the project.

## Generated Resources usage
Inside the main project you can access `localized strings` like this
`R.{stringInCammelCase}`

EX: `self.title = R.awesomeTitle`
this will return a localized version of "Awesome Title"

There are a few ways to use this project. You can just run the `command line tool` ie just run the project. or for more advanced usage you can create an executable so that you can run this script anytime you would like.


## Command Line tool usage

Specify the source file
Specify the destination file
Specify the destination for the generated ResourceFile.swift


### Displayed options

### Please select an option:
1) Add new entry with auto generated key
2) Add new entry with specified key
3) Generate Resources
4) Generate Strings
5) Generate Strings Sorted by Value not Key
6) Find Strings in file


### 1 Add new entry with auto generated key

auto generates a key based off of the string you entered by  `camelCased` the phrase and removing spaces.
Adds that entry to the `Localizable.strings` file.

### 2 Add new entry with specified key
lets you specify a key and value
Adds that entry to the `Localizable.strings` file.

### 3 Generate Resources
Creates the `Resources.swift` based off of the contents of the `Localizable.strings` file

### 4 Generate Strings
Takes the source file specified and generates a new `Localizable.strings`
1) by parsing the values for each entry.
2) Auto generating a `camelCased` key
3) Adding a comment and the [key: value] to the`Localizable.strings` file.

### 5 Generate Strings Sorted by Value not Key
This option takes your Localizable.Strings file and sorts it by the `Value` of the entry

### 6 Find Strings in file
1) Asks for the path to a file
2) Parses the file for any Strings wrapped in the `"` Character
3) Generates and sorts alphabetically an entry into the `Localizable.strings` file
4) Generates an Entry into the `Resources.swift`  `enum`
5) Replaces the `String` with a reference to the Resource IE `R.newGeneratedKey` so you don’t have to.




## Useful resources:
[Scripting in Swift is Pretty Awesome](https://krakendev.io/blog/scripting-in-swift)
[mokacoding](http://www.mokacoding.com/blog/better-build-phase-scripts/)
[Awesome XCode Scripts](https://github.com/aashishtamsya/awesome-xcode-scripts#detect-fixme-todo-error-tag-on-swift-script)
[Continuous Integration: Scripting Xcode Builds](https://code.tutsplus.com/tutorials/continuous-integration-scripting-xcode-builds--pre-25512)
[Shell Script Basics](https://developer.apple.com/library/content/documentation/OpenSource/Conceptual/ShellScripting/shell_scripts/shell_scripts.html)
[Secret variables in Xcode AND your CI for fun and profit 💌](https://medium.com/flawless-app-stories/secret-variables-in-xcode-and-your-ci-for-fun-and-profit-d387a50475d7)
[Swift Scripting Redux: Localization](https://academy.realm.io/posts/altconf-ayaka-nonaka-swift-scripting-redux-localization/)
[How to Pass Arguments to a Bash-Script](https://www.lifewire.com/pass-arguments-to-bash-script-2200571)
[Swift Scripting Part 1: Command Line Arguments and Using Foundation](http://keitaito.com/blog/2017/01/15/swift-scripting-part-1-command-line-arguments.html)
