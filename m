Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6701B233CA6
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 02:42:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1J66-0004bi-Ft; Fri, 31 Jul 2020 00:40:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Hgf=BK=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1k1J64-0004bd-IU
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 00:40:28 +0000
X-Inumbo-ID: 6cb3d5a2-d2c6-11ea-8df7-bc764e2007e4
Received: from syrinx.knorrie.org (unknown [2001:888:2177::4d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cb3d5a2-d2c6-11ea-8df7-bc764e2007e4;
 Fri, 31 Jul 2020 00:40:26 +0000 (UTC)
Received: from [IPv6:2a02:a213:2b80:f000::12] (unknown
 [IPv6:2a02:a213:2b80:f000::12])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id 61607609C2677
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 02:40:25 +0200 (CEST)
To: xen-devel <xen-devel@lists.xenproject.org>
From: Hans van Kranenburg <hans@knorrie.org>
Subject: =?UTF-8?Q?4=2e14=2e0_FTBFS_for_Debian_unstable=2c_libxlu=5fpci=2ec_?=
 =?UTF-8?B?KOKVr8Kw4pahwrDvvInila/vuLUg4pS74pSB4pS7?=
Autocrypt: addr=hans@knorrie.org; keydata=
 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
Message-ID: <dab05ef3-4ce8-2177-893d-61168d897821@knorrie.org>
Date: Fri, 31 Jul 2020 02:40:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi!

News from the Debian Xen team (well, that's still only Ian and me). We
still have Xen 4.11 in Debian unstable and stable (Buster) now, but at
this point I really want to start working on the preparations for the
next Debian release which will happen in about a little bit less than a
year from now.

So, the 4.14.0 release is a good moment to kick it off. In february 2020
Ian and I already spent a day to move the Debian packaging to 4.13, and
the result has been laying around for a bit. Now I'm forwarding it to
4.14.0 and I really want to get this in Debian so users can start
playing around with it and have enough time to either contribute new
things (like cross-building for raspberry pi4!) etc.

All the yolo WIP stuff without anything cleaned up is here:
https://salsa.debian.org/xen-team/debian-xen/-/commits/knorrie/4.14

Unfortunately, it FTBFS in an unexpected way, since I cannot relate this
to any of our additional patches or anything.

This is the last part of the output with the failure:

---- >8 ----

gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
-Wstrict-prototypes -Wdeclaration-after-statement
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
-fomit-frame-pointer
-D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP
-MF .libxlu_pci.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE  -g -O2
-fdebug-prefix-map=/home/knorrie/build/xen/debian-xen=.
-fstack-protector-strong -Wformat -Werror=format-security -Wdate-time
-D_FORTIFY_SOURCE=2 -Werror -Wno-format-zero-length
-Wmissing-declarations -Wno-declaration-after-statement
-Wformat-nonliteral -I. -fPIC -pthread
-I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/libxc/include
-I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/libs/toollog/include
-I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/include
-I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/libs/foreignmemory/include
-I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/include
-I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/libs/devicemodel/include
-I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/include
-I/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/include
-D__XEN_TOOLS__   -c -o libxlu_pci.o libxlu_pci.c
libxlu_pci.c: In function 'xlu_pci_parse_bdf':
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
make[6]: ***
[/home/knorrie/build/xen/debian-xen/tools/libxl/../../tools/Rules.mk:218:
libxlu_pci.o] Error 1
make[6]: Leaving directory '/home/knorrie/build/xen/debian-xen/tools/libxl'
make[5]: ***
[/home/knorrie/build/xen/debian-xen/tools/../tools/Rules.mk:242:
subdir-install-libxl] Error 2
make[5]: Leaving directory '/home/knorrie/build/xen/debian-xen/tools'
make[4]: ***
[/home/knorrie/build/xen/debian-xen/tools/../tools/Rules.mk:237:
subdirs-install] Error 2
make[4]: Leaving directory '/home/knorrie/build/xen/debian-xen/tools'
make[3]: *** [Makefile:72: install] Error 2
make[3]: Leaving directory '/home/knorrie/build/xen/debian-xen/tools'
make[2]: *** [Makefile:134: install-tools] Error 2
make[2]: Leaving directory '/home/knorrie/build/xen/debian-xen'
make[1]: *** [debian/rules:205: override_dh_auto_build] Error 2
make[1]: Leaving directory '/home/knorrie/build/xen/debian-xen'
make: *** [debian/rules:153: build] Error 2
dpkg-buildpackage: error: debian/rules build subprocess returned exit
status 2

---- >8 ----

I lost all of the other output already, but if needed, I can just cause
it again and provide a full build log with all specific package versions
of compilers etc. Anyway, it just used all the current stuff in Debian
unstable.

Knorrie

P.S. The next big thing to fix in the packaging before it can go into
Debian unstable is no usage of python 2 anywhere. I might ask some
questions about that later.

