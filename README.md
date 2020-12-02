# Org-roam with 100k files


Luhman wrote 90k slip notes during his entire career. The goal is to test Org-roam under the similar condition.

## file generation
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

On my old machine, it costs: minutes to generate 100k files.

## testing with Org-roam

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

``` elisp
emacs -q -l ./testing-environment.el
```
