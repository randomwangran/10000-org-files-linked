# push-to-the-extreme-100k-file-challenge

Luhman wrote 90k slip notes during his entire career. The goal is to test Org-roam under the similar condition.

Put this script under ./10000-org-linked-files
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

10 * 10000 = 100000 = 100k
