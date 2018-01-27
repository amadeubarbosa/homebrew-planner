# Homebrew tap for GNOME Planner

## Homebrew Tap 

First, Homebrew (http://brew.sh) supported third-party repositories, wisely!
You just have to add this repository as another tap URL, like this:

```brew tap amadeubarbosa/planner```

## GNOME Planner 0.14.6 Formula

GNOME Planner site: https://wiki.gnome.org/Apps/Planner

Now, you can install GNOME Planner as simple as that:

```brew install gnome-planner```

# Dependencies

I used another *great* tap repository for libgnomeui from [aisipos/libgnomeui](http://github.com/aisipos/libgnomeui).

# Limitations

## Workaround for unresolved bug of GLib in MacOSX

### Stacktrace:
```
UnicodeDecodeError: 'ascii' codec can't decode byte 0xa0 in position 7: ordinal not in range(128)
Traceback (most recent call last):
  File "/usr/local/opt/glib/bin/glib-mkenums", line 709, in <module>
    process_file(fname)
  File "/usr/local/opt/glib/bin/glib-mkenums", line 441, in process_file
    line = curfile.readline()
  File "/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/codecs.py", line 302, in decode
    (result, consumed) = self._buffer_decode(data, self.errors, final)
  File "/usr/local/opt/glib/bin/glib-mkenums", line 93, in replace_and_warn
    err.object[err.start - 7:err.end + 7]))
UnicodeDecodeError: 'ascii' codec can't decode byte 0xa0 in position 7: ordinal not in range(128)
make[1]: *** [stamp-libgnometypebuiltins.h] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [libgnometypebuiltins.c] Error 1
make: *** [install-recursive] Error 1
```
### Ugly Workaround

```
--- glib-mkenums.orig	2018-01-27 10:57:22.000000000 -0200
+++ glib-mkenums	2018-01-27 10:55:34.000000000 -0200
@@ -90,7 +90,7 @@ def replace_and_warn(err):
     # 7 characters of context either side of the offending character
     print_warning('UnicodeWarning: {} at {} ({})'.format(
         err.reason, err.start,
-        err.object[err.start - 7:err.end + 7]))
+        err.end))
     return ('?', err.end)
 
 codecs.register_error('replace_and_warn', replace_and_warn)
```

### Probably best solution

https://github.com/openembedded/openembedded-core/commit/61af0b446f104c99589cd4473040ca700dba3ff3

## Python plugins

Python plugins are deactivated by default (```./configure --enable-python=no```) because I have no success specifying proper python path to original ```./configure```of gnome-planner. Patches are welcome. 

```
checking if msgfmt accepts -c... yes
checking for gmsgfmt... (cached) /usr/local/opt/gettext/bin/msgfmt
checking for xgettext... (cached) /usr/local/opt/gettext/bin/xgettext
checking for a Python interpreter with version >= 2.2... python
checking for python... /usr/bin/python
checking for python version... 2.7
checking for python platform... darwin
checking for python script directory... ${prefix}/lib/python2.7/site-packages
checking for python extension module directory... ${exec_prefix}/lib/python2.7/site-packages
checking for headers required to compile python extensions... found
checking for Python library path... find: /usr/lib/python/config/: No such file or directory
find: /usr/lib/python/: No such file or directory
find: /usr//sbin/authserver: Permission denied

configure: error: cannot find Python library path
```
