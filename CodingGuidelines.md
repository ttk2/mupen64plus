# Guidelines for Mupen64Plus Developers #

In order to maintain a high level of software quality in the Mupen64Plus project, to reduce bugs and debugging time, and to make our jobs easier and take pride in our creation, please read and consider the following guidelines for software development in the Mupen64Plus project.

## GPL Guidelines ##
  1. Include a copyright statement if you change or add any kind of source file
  1. You must include a GPL header at the start of any new source file that you add

## SVN Guidelines ##
  1. Always give a good descriptive log message when making a commit.  The SVN server will reject your commit with an error if you do not provide a log message.
  1. Make sure that the project builds cleanly before committing code.  Do not commit code which does not compile.
  1. Please fix compiler warnings before committing code
  1. Please understand and follow the proper conflict resolution process with SVN: If you get a conflict while making a commit because someone else committed since your last update, you need to do an 'svn update', then open the file and search for the block markers "<<<<".  Fix them all by manually merging, then save the file, do "svn resolved 

&lt;filename&gt;

", and then commit.  Do not blindly overwrite the previous commit's changes.

## Code Guidelines ##
  1. It is recommended to use spaces instead of tabs, and indent levels by 4 spaces. There are many different pieces of software (editors, command line tools, email clients, etc) which will be used to display the code, and many of them use different tab spacing.  For maximum compatibility, it is best to use spaces.
  1. When adding features or fixing things within the existing code, follow the style of the pre-existing code.  Keep the code neat.
  1. Feel free to fix messy code and add comments where appropriate
  1. Write concise and helpful comments in new code.  Don't explain the obvious, but tell how the code works, give units, etc
  1. Variable Naming: use short, descriptive variables names.  Use single letters for counters if you like.
  1. Remember the life cycle of source code: it's written once but read many times.  Strive to make it readable and understandable.

## Issue Tracking Guidelines ##
  * Before you begin work on a bug fix or feature, look in the issue list on this Google Code site to see if someone is already working on it or assigned to it.
  * If someone else is already working on it but you have some ideas or requirements, then post them as comments in the issue report (preferably), or email the current owner.
  * If no-one is working on the issue, then create a new issue if necessary or assign yourself as the owner to the existing issue report.
  * Use the comments in the issue report for technical discussions; enable the star in the Google Code issue list to receive email notification about this bug
  * Please do not mark an issue as fixed if there is remaining work to fulfill the described functionality
  * Before closing an issue report, please:
  1. Test the new feature thoroughly in its various usage scenarios
  1. Test in both 32-bit and 64-bit builds, if applicable
  1. Test in both GUI and NOGUI modes