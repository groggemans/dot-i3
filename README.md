# dot-i3
My i3 configuration

Feel free to use it as a starting point for your own i3 configuration!

## Install
**Requirements:** [Ellipsis][ellipsis] `(>=v1.9.4)`,
[ellipsis-compiler][ellipsis-compiler], [Ansible][ansible] (optionally)

``` shell
$ ellipsis install groggemans/dot-i3
```
*([Ellipsis-Compiler][ellipsis-compiler] will also be installed if needed)*

If Ansible is available, a prompt will ask if you want to install the related
software packages (default=no). A non-interactive tty will skip the prompt and
won't install the packages. Your script should then call the install/uninstall
playbook if wanted.

## Key-bindings
`TODO`

## Author
By [G. Roggemans][groggemans]

## License
MIT

[ellipsis-compiler]:    https://github.com/ellipsis/ellipsis-compiler

[ellipsis]:             https://github.com/ellipsis/ellipsis
[ansible]:              https://github.com/ansible/ansible
[groggemans]:           https://github.com/groggemans
