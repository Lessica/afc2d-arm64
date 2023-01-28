I really hate these guys who did these piracy things with tons of disclaimers.  
I’d like to teach you an old Chinese saying, “你们这就是脱了裤子放屁——多此一举。”.

If someone give this repo a DMCA take down, do as you want. I just want to tease “揶揄” these guys.

To download the original version of legacy `afcd`, use the following command:

```bash
$ curl -r 1310657433-1310666346 http://appldnld.apple.com/iOS7/031-3029.20140221.ramz3/com_apple_mobileasset_softwareupdate/92b6344e610f418586f1741231ffab482e6d49fd.zip > 92b6344e610f418586f1741231ffab482e6d49fd
$ perl -MIO::Uncompress::RawInflate -e 'undef $/; my ($in, $out) = (<>, undef); IO::Uncompress::RawInflate::rawinflate(\$in, \$out); print $out;' < 92b6344e610f418586f1741231ffab482e6d49fd > afcd
```

Then rename it to `afc2d`. That’s identical to `layout/usr/libexec/afc2d` in this repo.