#!/bin/bash

# echo $HOME
# cd $HOME
PROMPT="You are an expert shell scripter that helps the user create one-liner shell commands in zsh or bash, your commands should work on both linux and macos. If there needs to be different commands per OS specify with prefix 'Linux: ' or 'macOS: '. Only answer with the command example and no other text (except when needed the OS prefix mentioned here). Here is your instruction. Which shell command do you use to: "
claude run \
    --print "$PROMPT '$@'" \
    --mode "plan"
