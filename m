Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFAA2DF2D0
	for <lists+xen-devel@lfdr.de>; Sun, 20 Dec 2020 03:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57034.99805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqorp-0001uQ-T2; Sun, 20 Dec 2020 02:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57034.99805; Sun, 20 Dec 2020 02:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqorp-0001u1-PV; Sun, 20 Dec 2020 02:54:41 +0000
Received: by outflank-mailman (input) for mailman id 57034;
 Sun, 20 Dec 2020 02:54:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m++8=FY=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1kqorn-0001tw-QQ
 for xen-devel@lists.xenproject.org; Sun, 20 Dec 2020 02:54:39 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b207d17-41db-4c37-b5d5-8589f35b5102;
 Sun, 20 Dec 2020 02:54:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r3so7201368wrt.2
 for <xen-devel@lists.xenproject.org>; Sat, 19 Dec 2020 18:54:38 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5b207d17-41db-4c37-b5d5-8589f35b5102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=psbuNFNDTLaA7idW4QnjNXBPSq/YUVA99FKXxDGY9I4=;
        b=WS1/Qvrf8FmUEteFX2bq/v+EhFCgoMqoj4YdcTYhSt385LK28Dm8EjHu8w3YsqgkYD
         VeyoYuzJXXMVb68T+n23JR/MUxQgnomdSbEl+1za91tkugJb9otH2NBOCynPVvkBUywj
         cHfBof7Xv7+lhCRyEfNb3fEUsAOR1YYwFUjE2cX+eVVezaZWkSUOQIxfCotcE3Kaa3oF
         EZutKyYo1aKim6HyUM9Y/F8YnXj3+pJunYT65NNLIMm+R6HN6+1jfhP8jbZagVZrlXlr
         n/RoLdPbmB6uwxua829Ar7O3N7zQr+2Og7tkrD8pHOFvstEgkhhMucLSfpuLQyodaLYG
         ZTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=psbuNFNDTLaA7idW4QnjNXBPSq/YUVA99FKXxDGY9I4=;
        b=C/mOgAwXG3NI+5LUDE2IIcWXcDq+eitSmA+F6SPxeuoTx8MjUhDcCv/kpj2IIm/tqA
         Sik8o8IFRoTmph9jAxSQTbevq2dvZREjwrH7b7ljFHYQ+Qj3L9XMgyTcYZwRTPP6QW74
         8XQWs1mtgF0NEGiurngrLpowamczsaETIlqxFhrjqetys0tNgRyWBsna/24d7lEsUWK8
         VYShTffuDLguz9g/+Yh20dCx/ztc/ChzORlvqeHvEkruNAqPz4efz3/uPn1+lDDxOPbM
         ohAUhICB4CSe7z522l8C66rwaCWMHehiVgrxOGxxEYsHlqu7Nqx4Bn9IQFEGEa5tC08v
         ZjFg==
X-Gm-Message-State: AOAM533VHLNFKgHgabRgwxQCxGRwOC67UcUhpfYMN7EGlwoAt/TlVw0g
	OFctewwHXzA3mHWMGAbUch8jItnzzXnRyel2SahA/hMcBpdlYA==
X-Google-Smtp-Source: ABdhPJxa/N2q9fX/Pe93JAhrx22OnFLDErBoyhvbpAGZ24V/n2MWh8+2AdAbUzr7S+CzazgViBaGfHLc139zS93SsDE=
X-Received: by 2002:a5d:5147:: with SMTP id u7mr11983561wrt.114.1608432877567;
 Sat, 19 Dec 2020 18:54:37 -0800 (PST)
MIME-Version: 1.0
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Sun, 20 Dec 2020 10:54:26 +0800
Message-ID: <CABwOO=dLaL-BLf+GDo71_Btq1R8L5=XmofSs+oHE+P-qx+M49A@mail.gmail.com>
Subject: Xen Release 4.14.0: Couple of "all warnings being treated as errors"
 issues and ongoing docs/man issue in make world
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Looking to build 4.14.0 on an LFS 10.0 system, so with GCC 10.2.0.

The "all warnings being treated as errors" I'm sure, will have been
picked up by now, but the issue with the man pages is something
I have been seeing for a while now.

The configure options are a little idiosyncratic but I can't see why they
would unmask the issues seen here, but, for completeness

  ./configure --prefix=/usr    \
  --disable-seabios          \
  --disable-qemu-traditional \
  --disable-rombios          \
  --disable-stubdom

after which,

make PYTHON=/usr/bin/python3 world

first generates these four

libxlu_pci.c:32:18: error: 'func' may be used uninitialized in this
function [-Werror=maybe-uninitialized]
   32 |     pcidev->func = func;
      |     ~~~~~~~~~~~~~^~~~~~
libxlu_pci.c:51:29: note: 'func' was declared here
   51 |     unsigned dom, bus, dev, func, vslot = 0;
      |                             ^~~~
libxlu_pci.c:31:17: error: 'dev' may be used uninitialized in this
function [-Werror=maybe-uninitialized]
   31 |     pcidev->dev = dev;
      |     ~~~~~~~~~~~~^~~~~
libxlu_pci.c:51:24: note: 'dev' was declared here
   51 |     unsigned dom, bus, dev, func, vslot = 0;
      |                        ^~~
libxlu_pci.c:30:17: error: 'bus' may be used uninitialized in this
function [-Werror=maybe-uninitialized]
   30 |     pcidev->bus = bus;
      |     ~~~~~~~~~~~~^~~~~
libxlu_pci.c:51:19: note: 'bus' was declared here
   51 |     unsigned dom, bus, dev, func, vslot = 0;
      |                   ^~~
libxlu_pci.c:29:20: error: 'dom' may be used uninitialized in this
function [-Werror=maybe-uninitialized]
   29 |     pcidev->domain = domain;
      |     ~~~~~~~~~~~~~~~^~~~~~~~
libxlu_pci.c:51:14: note: 'dom' was declared here
   51 |     unsigned dom, bus, dev, func, vslot = 0;
      |              ^~~
cc1: all warnings being treated as errors
make[5]: *** [/usr/src/xen/xen-4.14.0/tools/libxl/../../tools/Rules.mk:216:
libxlu_pci.o] Error 1
make[5]: Leaving directory '/usr/src/xen/xen-4.14.0/tools/libxl'

which I "fixed" by adding an

  -Wno-maybe-uninitialized

to the CFLAGS in the tools/libxl Makefile

after which the make world then goes on to fail here

libxl_utils.c: In function 'libxl__prepare_sockaddr_un':
libxl_utils.c:1262:5: error: 'strncpy' specified bound 108 equals
destination size [-Werror=stringop-truncation]
 1262 |     strncpy(un->sun_path, path, sizeof(un->sun_path));
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/usr/src/xen/xen-4.14.0/tools/libxl/../../tools/Rules.mk:216:
libxl_utils.o] Error 1
make[5]: Leaving directory '/usr/src/xen/xen-4.14.0/tools/libxl'
make[4]: *** [/usr/src/xen/xen-4.14.0/tools/../tools/Rules.mk:240:
subdir-install-libxl] Error 2
make[4]: Leaving directory '/usr/src/xen/xen-4.14.0/tools'
make[3]: *** [/usr/src/xen/xen-4.14.0/tools/../tools/Rules.mk:235:
subdirs-install] Error 2
make[3]: Leaving directory '/usr/src/xen/xen-4.14.0/tools'
make[2]: *** [Makefile:72: install] Error 2
make[2]: Leaving directory '/usr/src/xen/xen-4.14.0/tools'
make[1]: *** [Makefile:134: install-tools] Error 2
make[1]: Leaving directory '/usr/src/xen/xen-4.14.0'
make: *** [Makefile:170: world] Error 2

which I fixed by setting

                -Wno-maybe-uninitialized -Wno-stringop-truncation

as the extra CFLAGS in the modified tools/libxl Makefile

After that point, the build gets as far as

make[2]: Leaving directory '/usr/src/xen/xen-4.14.0/tools'
make -C docs install
make[2]: Entering directory '/usr/src/xen/xen-4.14.0/docs'
/usr/bin/pod2man --release=4.14.0 --name=xenhypfs -s 1 -c "Xen"
man/xenhypfs.1.pod man1/xenhypfs.1
Can't write-open man1/xenhypfs.1: No such file or directory at
/usr/bin/pod2man line 69.
make[2]: *** [Makefile:176: man1/xenhypfs.1] Error 2
make[2]: Leaving directory '/usr/src/xen/xen-4.14.0/docs'
make[1]: *** [Makefile:153: install-docs] Error 2
make[1]: Leaving directory '/usr/src/xen/xen-4.14.0'
make: *** [Makefile:170: world] Error 2

and this is the interesting bit.

Firstly, nothing that the make ins being run from the top-level
docs directory, looking at

pkg xen:xen-4.14.0> ls docs/
INDEX            configure.ac       man/
Makefile         designs/           misc/
README.colo      features/          parse-support-md*
README.remus     figs/              process/
README.source    gen-html-index     specs/
admin-guide/     glossary.rst       support-matrix-generate*
conf.py          guest-guide/       xen-headers*
config.status*   hypervisor-guide/
configure*       index.rst


shows that there isn't a man1 subdir within the source tree?

Furthermore, looking at

pkg xen:xen-4.14.0> ls docs/man/
xen-pci-device-reservations.7.pod  xentop.1.pod
xen-pv-channel.7.pod               xentrace.8.pod
xen-tscmode.7.pod                  xentrace_format.1.pod
xen-vbd-interface.7.pandoc         xl-disk-configuration.5.pod
xen-vtpm.7.pod                     xl-network-configuration.5.pod
xen-vtpmmgr.7.pod                  xl-numa-placement.7.pod
xenhypfs.1.pod                     xl.1.pod
xenstore-chmod.1.pod               xl.1.pod.in
xenstore-ls.1.pod                  xl.cfg.5.pod
xenstore-read.1.pod                xl.cfg.5.pod.in
xenstore-write.1.pod               xl.conf.5.pod
xenstore.1.pod                     xlcpupool.cfg.5.pod

suggests that all of the man pages POS files, that one might
expect, given the make output above, to be in man1, man5,
man7 and man8 subdirs, are all in the one "man" directory.

I have seen this "docs/man? failure" with 'make world' in a few past
builds and have found, in the past, that splitting out the 'make world'
into these two parts, with a creation of the seemingly expected dirs
in between, vis:

make clean

mkdir docs/man1 docs/man5 docs/man7 docs/man8

make  dist

has then seen the build complete.

I am thinking though, that the 'make world' should just work,
out of the tarball ?

So is there something missing that should be re-arranging the
man page sources into seperate manN subirs, or should the
pod2man command be given different arguments?

Hoping that info is of some use to you,
Kevin

