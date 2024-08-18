---
title: Asahi Linux Fedora Checklist
published: true
date: 18/08/2024
rss_only: true
---

- `$` -> Normal user mode
- `$!` -> Root user mode

### Post Install Fedora

- Setup the root password for admin access for other tasks

  - ```bash
    $ sudo su
    $! passwd
    ```

- If you wish to re-map the keys of the macbook, run the following

  - ```bash
    $! echo 'options hid-apple swap_fn_leftctrl=1' > /etc/modprobe.d/keyboard.conf
    $! dracut -f # will get stuck for a bit, let it work everything out
    ```

- Edit GRUB to give you a timeout of at least 5 seconds

  - ```bash
    $! vim /etc/default/grub
    ```
  - update `GRUB_TIMEOUT` to be around `5`
  - run the `update-grub` command
  - ```bash
    $! update-grub
    ```
