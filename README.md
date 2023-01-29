# afc2d-arm64

I really hate these guys who did these piracy things with tons of disclaimers.  
I’d like to teach you an old Chinese saying, “你们这就是脱了裤子放屁——多此一举。”.

If someone give this repo a *DMCA takedown*, do as you want. I just want to tease “揶揄” these guys.

## WHY...

You just injected a dynamic library into `SpringBoard`...  
You just hooked `SpringBoard` and spawned a `killdaemon` process with root privileges...  
You just downloaded a legacy `afcd` binary from Apple’s CDN server...  
You just used `ldid` and tampered that `afcd` and renamed it to `afc2d`...  
You just restarted `lockdownd`...  
You just injected `lockdownd` and spawned `afc2d` process instead of the original `afcd`...

Let’s be more straightforward. Please, just bundle the legacy `afcd` binary directly into your package, PLEASE!!!!!!  
You just did so many magic(s), but you’re still complaining about redistributing copyrighted Apple binaries??? Oh my dear, your code just **hooked** and **injected** and **fucked** Apple’s processes thousands of times! STOP THAT 掩耳盗铃-like behavior!

## If this repo got a *DMCA takedown* by Apple’s request, how can I get the legacy `afcd` binary?

To download the original version of legacy `afcd`, use the following command:

```bash
$ curl -r 1310657433-1310666346 http://appldnld.apple.com/iOS7/031-3029.20140221.ramz3/com_apple_mobileasset_softwareupdate/92b6344e610f418586f1741231ffab482e6d49fd.zip > 92b6344e610f418586f1741231ffab482e6d49fd
$ perl -MIO::Uncompress::RawInflate -e 'undef $/; my ($in, $out) = (<>, undef); IO::Uncompress::RawInflate::rawinflate(\$in, \$out); print $out;' < 92b6344e610f418586f1741231ffab482e6d49fd > afcd
```

Then rename it to `afc2d`. That’s **identical** to `layout/usr/libexec/afc2d` in this repo.
