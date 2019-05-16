# Nomad Deploy

A Python 3 script that renders Jinja template and schedules a new job on Nomad

## Building
Easy! Run:

    python setup.py sdist bdist_wheel && twine upload dist/*

You have to be logged in and have the correct access right to `nomad-deploy` in pip.

## Installing
Even easier:

    pip install nomad-deploy

Now `nomad-deploy` command is available system-wide.

## Running
After installing `nomad-deploy` with pip, running it is easy

    nomad-deploy --varFile variables.yml template.nomad

Available keys:
* `--var "FOO=BAR"` - set variable value, can be specified more than once to set more variables
* `--varFile "variables.yml"` - load variables from a Yaml file
* `--render` - output resulting template to stdout
* `--dry` - do not run the job, only test if resources can be allocated
* `--recursive` - if you're using variables in the varFile, you can recursively re-render the template until there are no more substitutions you can make; this will break control statements in template file
