# Org-roam with 100k files


Niklas Luhmann wrote 90k slip notes during his entire career. The goal is to test Org-roam under the similar condition.

## motivation

- Can I use Org-roam with 100k files?
- Can I run it smoothly? 
- If not, what is the level of compromise?
- What is the latency when create a new note at 100k files?

## details
### file generation
Put this script under `./10000-org-linked-files`

```
#!/bin/bash

for f in *.org; do cp -- "$f" "ori-$f"; done
for f in ori-*.org; do cp -- "$f" "group_1-$f"; done
for f in ori-*.org; do cp -- "$f" "group_2-$f"; done
for f in ori-*.org; do cp -- "$f" "group_3-$f"; done
for f in ori-*.org; do cp -- "$f" "group_4-$f"; done
for f in ori-*.org; do cp -- "$f" "group_5-$f"; done
for f in ori-*.org; do cp -- "$f" "group_6-$f"; done
for f in ori-*.org; do cp -- "$f" "group_7-$f"; done
for f in ori-*.org; do cp -- "$f" "group_8-$f"; done
for f in ori-*.org; do cp -- "$f" "group_9-$f"; done
for f in ori-*.org; do cp -- "$f" "group_10-$f"; done

```

Then execute it. The total number of the files will be 10 times larger.

The total number of files will be: 10 * 10000 = 100000 = 100k

Time to generate files:

It costs 1 hour and 36 minutes to generate 100k files.

check the result:

```sh
$ find . -type f | wc -l
120003
```

### testing with Org-roam

``` elisp
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(use-package ivy)

(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/org/org-roam")
  (org-roam-completion-system 'ivy)
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph-show))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))
```


Emacs: 27.1

## Data
| Action      | Time    | 
| :------------- | :----------: |
|  File generations |  1 h 36 m  | 
| Renaming title   | 1 h 59 m  |
| index org-roam.db | |

### indexing time
After loading emacs with this:
`emacs -q -l ./testing-environment.el`

Make sure `org-roam.db` deleted.

Use command:

`M-x org-roam-find-file` (this will frozen emacs) The time is estimated by upper bond, i.e. when I see emacs starts to count the file number.

During executing, commands are monitor via `top`.

- after 1 hour 25 m, `find` no longer exists instead `emacs-27.1` is being executed

After seeing the mini-buffer's update, a time counter starts to run. It's a rough estimation. 
