#!/bin/bash
#
# namenotes.sh - names Simplenote note files based on their first lines
# Copyright 2013 Bill Havanki
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# ---
#
# Run on the files generated by splitnotes.sh: namenotes.sh x??
# Each note file will be renamed with its first line, which is the custom for
# Simplenote.

for f in "$@"
do
  title=$(grep -A 1 "Note Contents:" "$f" | tail -n -1)
  if [[ -z $title ]]; then
    continue
  fi
  mv "$f" "$title.txt"
done