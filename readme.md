# dissertation-tudelft-latex

This is a fork of the TU Delft LaTeX dissertation template found at https://www.tudelft.nl/en/tu-delft-corporate-design/downloads/.

The main changes in this document are that the folders are reorganized and made more git-ready. The `bibtex` reference manager has also been changed to `biblatex` and other packages have been included to fix some formatting glitches. Also, it's in A4 size now!

These documents, as they exist, are still highly dependent on many font packages that TeXShop or some other large version of TeX comes with, but I am running it with BasicTeX. In my own repo, which I will eventually make public, I have made other modifications to the fonts, layout, and of course, content. If you have a full LaTeX distribution or compile it online (see below), then you shouldn't need to worry about this.

If you are compiling locally, just run `make` in your terminal, which should run `xelatex` and `biber` a few times iteratively (automagically) until it works! `make clean` will remove all the temporary and auxiliary files in your workspace.

## Including SVGs

The `svg` LaTeX package allows `\includesvg` or `\includeinkscape` to be used to directly include SVGs into the compiled document. However, this process requires many external dependencies and more steps to set up. The package's documentation is a bit confusing to read, but [this Stackoverflow post](https://tex.stackexchange.com/a/74693/201491) (of course) is a great explanation of its workflow. In summary, it requires a user to either have [Inkscape 1.0](https://inkscape.org/release/inkscape-1.0/) (previous or beta builds won't work) or [Imagemagick](https://imagemagick.org/script/download.php) installed. Both are very useful tools to have in general.

If you are using macOS, there is an additional step required after you install Inkscape (that is not documented well online). You need to allow the LaTeX compiler access Inkscape through the command line either by adding the program as an alias or to PATH. On macOS Catalina, this is done with `alias inkscape="/Applications/Inkscape.app/Contents/MacOS/inkscape" && source ~/.zshrc` or `sudo ln -s /Applications/Inkscape.app/Contents/MacOS/inkscape /usr/local/bin`.

Next, you will need to tell the `svg` package to load Inkscape with its absolute file path. In `0_dissertation.cls`, uncomment the line `\RequirePackage[inkscapeexe=/Applications/Inkscape.app/Contents/MacOS/inkscape,inkscapearea=page]{svg}`.

Lastly, note that if the SVG contains text (labels, titles, etc.) that contain the underscore '_', then it will make the whole compilation quite unhappy. The `svg` package can deal with some of these, but not all. In this case, one can add a flag to the package to tell it to maintain the original text. The downside here is that the font may become inconsistent.

For example, to include some file named `graph.svg` (not yet included), use `\includesvg[inkscapelatex=false,width=\textwidth]{04_chapter-1/figures/graph}`.

## Continuous Integration/Deployment

Compiling LaTeX in the cloud has the benefit that you can ensure your file works outside of your own local environment. Though the main use will probably just be when you need to re-run everything again if you ever re–visit your thesis, if you switch computers, or if someone else wants to compile your source files for some reason.

A good practice, though not fully implemented in this repository because it is a template, is to keep your `master` branch clean and only do Pull Requests from other branches into `master`. Your CI/CD tools can be configured to only compile after such a Pull Request instead of for every time a repository changes!

### GitLab [![GitLab CI Status](https://gitlab.com/jasonrwang/dissertation-tudelft-latex/badges/master/pipeline.svg)](https://www.gitlab.com/jasonrwang/dissertation-tudelft-latex)

GitLab has built-in CI/CD tools. If you're using this with GitLab (you need only need a GitLab account and can keep your thesis private), you'll need to configure a few things for everything to run smoothly. *If you want to use GitLab and not have it compile online, delete the* `.gitlab-ci.yml` *file*.

First, configure an SSH key–pair (e.g. run `ssh-keygen -f deploy_key -N "" -C "ci-runner@jrwang.ca"`), where you can replace `ci-runner@jrwang.ca` with your own email. It makes sense to make this something other than your primary (GitLab) email (i.e. make it easily identifiable as a bot!).

 Then, copy the contents of `deploy_key.pub` in `Settings > Repository > Deploy Keys`, and those of `deploy_key` as a the value for the variable key `SSH_PRIVATE_KEY` in `Settings > CI / CD > Variables` ([see here for a more thorough walkthrough](https://marcosschroh.github.io/posts/autobumping-with-gitlab/)).

 With this configured, every time you commit and push your file to GitLab, it should run a job and compile your main `.tex` file (along with its inputs) into a PDF and put it onto your repository!

### GitHub

*Coming soon...*

This option requires TravisCI or CircleCI, which means you have to make or configure more accounts. TravisCI also only provides free CI time for open–source repositories. Make sure you are OK with make your own project public if you want to go down that route.

## VS Code Integration

I run LaTeX locally rather than through a cloud service. I wrote [a blog post](https://jrwang.ca/2020/01/13/latex-vscode-git/) about why and how I've set it all up. This is why the `.gitignore` file includes some VS Code-friendly entries too.

## Changelog

* v1.2.3 Now supports SVG on the fly using the LaTeX `svg` package (requires Inkscape or Imagemagick – see above)
* v1.2.2 References now work properly across chapters and readme updated with blog and `make clean` info
* v1.2.1 Built in continuous integration (CI)
* v1.2 Added another chapter 2 as a barebones example
* v1.1 Restructured folders and files to be git compatible
* v1.0 TU Delft Template
 