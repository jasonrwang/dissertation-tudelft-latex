# dissertation-tudelft-latex

This is a fork of the TU Delft LaTeX dissertation template found at https://www.tudelft.nl/en/tu-delft-corporate-design/downloads/.

The main changes in this document are that the folders are reorganized and made more git-ready. The `bibtex` reference manager has also been changed to `biblatex` and other packages have been included to fix some formatting glitches. Also, it's in A4 size now!

These documents, as they exist, are still highly dependent on many font packages that TeXShop or some other large version of TeX comes with, but I am running it with BasicTeX. In my own repo, which I will eventually make public, I have made other modifications to the fonts, layout, and of course, content. If you have a full LaTeX distribution or compile it online (see below), then you shouldn't need to worry about this.

## Continuous Integration/Deployment

Compiling LaTeX in the cloud has the benefit that you can ensure your file works outside of your own local environment. Though the main use will probably just be when you need to re-run everything again if you ever re–visit your thesis, if you switch computers, or if someone else wants to compile your source files for some reason.

A good practice, though not implemented in this repository because it is a template, is to keep your `master` branch clean and only do Pull Requests from other branches into `master`. Your CI/CD tools can be configured to only compile after such a Pull Request instead of for every time a repository changes!

### GitLab

GitLab has built-in CI/CD tools. If you're using this with GitLab, you'll need to configure a few things for everything to run smoothly. *If you want to use GitLab and not have it compile online, delete the* `.gitlab-ci.yml` *file*.

First, configure an SSH key–pair (e.g. run `ssh-keygen -f deploy_key -N "" -C "ci-runner@jrwang.ca"`), where you can replace `ci-runner@jrwang.ca` with your own email. It makes sense to make this something other than your primary (GitLab) email (i.e. make it easily identifiable as a bot!).

 Then, copy the contents of `deploy_key.pub` in `Settings > Repository > Deploy Keys`, and those of `deploy_key` as a the value for the variable key `SSH_PRIVATE_KEY` in `Settings > CI / CD > Variables` ([see here for a more thorough walkthrough](https://marcosschroh.github.io/posts/autobumping-with-gitlab/)).

 With this configured, every time you commit and push your file to GitLab, it should run a job and compile your main `.tex` file (along with its inputs) into a PDF and put it onto your repository!

## VS Code Integration

I run LaTeX locally rather than through a cloud service. I intend to publish a blog post soon about why and how I've set it all up. For now, note that there is a branch called *VSCode* whose `.gitignore` file includes some VS Code-friendly entries.
