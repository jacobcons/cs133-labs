#!/bin/bash
echo "$*"
expr $(echo $* | sed 's/ / + /g')
exit 0
