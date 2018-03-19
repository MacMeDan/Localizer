#  Localizer

The purpose of this project is to help with managing Localized strings in a way that gives ease of use, safety and autocompletion.

## Usage

There are a few ways to use this projcet. You can just run the `commandline tool` ie just run the project.
or
for more advanced usage you can create an exicutable so that you can run this script anytime you would like.

## Command Line tool usage

Specify the source file
Specify the destination file
Specify the destination for the generated `ResourceFile.swift`

### Displayed options

### Please select an option:
1) Add new entry with auto gernerated key
2) Add new entry with specified key
3) Generate Resources
4) Generate Strings
5) Generate Strings Sorted by Value not Key
6) Find Strings in file


### 1 Add new entry with auto gernerated key

auto generates a key based off of the string you entered by  `camelCaseing` the phrase and removeing spaces.
Adds that entry to the `locolizable.strings` file.

### 2 Add new entry with specified key
lets you specify a key and value
Adds that entry to the `locolizable.strings` file.

### 3 Generate Resources
Creates the `Resources.swift` based off of the contents of the `locolizable.strings` file

### 4 Generate Strings
Takes the source file specified and generates a new `Localizable.stirngs`
1) by parsing the values for each entry.
2) Auto generating a `camleCased` key
3) Adding a comment and the [key: value] to the`Localizable.stirngs` file.

### 5 Generate Strings Sorted by Value not Key
This option takes your Localizable.Strings file and sorts it by the `Value` of the entry

### 6 Find Strings in file
1) Asks for the path to a file
2) Parses the file for any Strings wrapped in the `"` Charicter
3) Generates and sorts alphabetically an entry into the `Localizable.strings` file
4) Generates an Entry into the `Resources.swift` `enum`
5) Replaces the `String` with a referance to the Resource IE `R.newGeneratedKey` so you dont have to.

# Exicutable Script

To generate a exicutable script you have to combine all neccecery pieces of this project into a single exicutable. By default the exicutable automatically exicutes a modified version of option `6 Find Strings in file` of the command line tool but instead of prompting for the path it takes the path to a folder as a parameter. It will then look for any file within that folder that is of type `.swift` and scan it for unlocalised strings.

You can modifiy the scripts as you please to sute your own needs and regenerate the exicutable script.

To create an exicutable you will need to combine all dependencies including extentions. To create the `Locolizer` exicutable that is found in this project you just need to navigage throught `terminal` to this project on your computer. Then run this command :
`swiftc FileLocalizer.swift extensions/url.swift extensions/Strings.swift -o Localizer`

This creates an exicutable named `Localizer`. To use this script you preface it with `./` then the script `Localizer` add a space to seperate the script from the parameter then add the parameter which is a path to a folder in your project.
`./Localizer "/Users/macmedan/Swift/auto-source-inspection/InspectionTool/views"`

Then watch the majic happen. Make sure to review all changes that have been made to your project and that they are correct. Open a new issue and submit a fix if there is a way to improve the project. 

## Generated Resources usage
Inside the main project you can access `locolized strings` like this
`R.{stringInCammelCase}`

EX: `self.title = R.awesomeTitle`
this will return a locolised version of "Awesome Title"


## Useful resources
[Scripting in Swift is Pretty Awesome](https://krakendev.io/blog/scripting-in-swift)
[mokacoding](http://www.mokacoding.com/blog/better-build-phase-scripts/)
[Awesome XCode Scripts](https://github.com/aashishtamsya/awesome-xcode-scripts#detect-fixme-todo-error-tag-on-swift-script)
[Continuous Integration: Scripting Xcode Builds](https://code.tutsplus.com/tutorials/continuous-integration-scripting-xcode-builds--pre-25512)
[Shell Script Basics](https://developer.apple.com/library/content/documentation/OpenSource/Conceptual/ShellScripting/shell_scripts/shell_scripts.html)
[Secret variables in Xcode AND your CI for fun and profit 💌](https://medium.com/flawless-app-stories/secret-variables-in-xcode-and-your-ci-for-fun-and-profit-d387a50475d7)
[Swift Scripting Redux: Localization](https://academy.realm.io/posts/altconf-ayaka-nonaka-swift-scripting-redux-localization/)
[How to Pass Arguments to a Bash-Script](https://www.lifewire.com/pass-arguments-to-bash-script-2200571)
[Swift Scripting Part 1: Command Line Arguments and Using Foundation](http://keitaito.com/blog/2017/01/15/swift-scripting-part-1-command-line-arguments.html)
