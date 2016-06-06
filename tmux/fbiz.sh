#!/bin/sh

SESSION_NAME=backend

tmux has-session -t $SESSION_NAME

if [ $? != 0 ]
then
  tmux -2 new-session -d -s $SESSION_NAME
  tmux rename-window -t $SESSION_NAME:1 'halfback'
  tmux send-keys -t $SESSION_NAME 'cd ~/Work/fashionbiz/halfback' Enter
fi

SESSION_NAME=frontend

tmux has-session -t $SESSION_NAME

if [ $? != 0 ]
then
  tmux -2 new-session -d -s $SESSION_NAME

  tmux rename-window -t $SESSION_NAME:1 'COL'
  tmux send-keys -t $SESSION_NAME:1 'cd ~/Work/fashionbiz/biz-collection' Enter

  tmux new-window -t $SESSION_NAME:2 -n 'CPR'
  tmux send-keys -t $SESSION_NAME:2 'cd ~/Work/fashionbiz/biz_corporates' Enter

  tmux new-window -t $SESSION_NAME:3 -n 'SMK'
  tmux send-keys -t $SESSION_NAME:3 'cd ~/Work/fashionbiz/syzmik' Enter

  tmux new-window -t $SESSION_NAME:4 -n 'FFC'
  tmux send-keys -t $SESSION_NAME:4 'cd ~/Work/fashionbiz/fbz-frontend-core' Enter
fi
