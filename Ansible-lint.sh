#!/bin/bash
#Program:
#      install Ansible-lint: https://github.com/willthames/ansible-lint
#History:
# 2016/06/06 Shujin Wu Version 1.0

pip install ansible-lint

git clone https://github.com/willthames/ansible-lint
export PYTHONPATH=$PYTHONPATH:`pwd`/ansible-lint/lib
export PATH=$PATH:`pwd`/ansible-lint/bin

#
# Usage: ansible-lint playbook.yml|roledirectory ...
#       eg. ansible-lint examples/example.yml

# Options:
#   --version             show program's version number and exit
#   -h, --help            show this help message and exit
#   -L                    list all the rules
#   -q                    quieter, although not silent output
#   -p                    parseable output in the format of pep8
#   -r RULESDIR           specify one or more rules directories using one or
#                         more -r arguments. Any -r flags override the default
#                         rules in ['/path/to/ansible-
#                         lint/lib/ansiblelint/rules'], unless -R is also used.
#   -R                    Use default rules ['/path/to/ansible-
#                         lint/lib/ansiblelint/rules'] in addition to any extra
#                         rules directories specified with -r. There is no need
#                         to specify this if no -r flags are used
#   -t TAGS               only check rules whose id/tags match these values
#   -T                    list all the tags
#   -x SKIP_LIST          only check rules whose id/tags do not match these
#                         values
#   --exclude=EXCLUDE_PATHS
#                         path to directories or files to skip. This option is
#                         repeatable.
# ----------------------------------------------------------------------------
# False positives
#-----------------------------------------------------------------------------
# - name: this would typically fire CommandsInsteadOfArgumentRule
#   command: warn=no chmod 644 X

# - name: this would typically fire CommandsInsteadOfModuleRule
#   command: git pull --rebase
#   args:
#     warn: False

# - name: this would typically fire GitHasVersionRule
#   git: src=/path/to/git/repo dest=checkout 
#   tags:
#   - skip_ansible_lint
#----------------------------------------------------------------------------
