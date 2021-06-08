Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F139F5D8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 13:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138435.256262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqaNO-0002ek-4b; Tue, 08 Jun 2021 11:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138435.256262; Tue, 08 Jun 2021 11:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqaNO-0002bM-0T; Tue, 08 Jun 2021 11:58:34 +0000
Received: by outflank-mailman (input) for mailman id 138435;
 Tue, 08 Jun 2021 11:58:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNwb=LC=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1lqaNL-0002bG-FU
 for xen-devel@lists.xen.org; Tue, 08 Jun 2021 11:58:31 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 635c59f1-bd40-4832-9773-d2cd63b752cc;
 Tue, 08 Jun 2021 11:58:28 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:49928
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>) id 1lqZzE-0001G7-2i
 for xen-devel@lists.xen.org; Tue, 08 Jun 2021 13:33:36 +0200
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
X-Inumbo-ID: 635c59f1-bd40-4832-9773-d2cd63b752cc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fw5TXSv6M+94NkFz+iCJQdAFLvUv4VOjZG+qjBxeC80=; b=TFsXqkLOn9nfrc1KmSD/+cAJzD
	4VS0xUhAqJGJei2E1uywH9lrBl2kgg/wRtgkLEiCE07BLPn5Ows6/TW7e1HOaFHT6WuxsSTlij8wZ
	rfkmC88xrhuMdX8Zy3KEkEqgkY+xtGC6YLcvkhaUtZ6W81vgs9bUPpC9LmZ4NxoPcMEo=;
To: Xen-devel <xen-devel@lists.xen.org>
From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: =?UTF-8?Q?xen-unstable_build-failure=3a_xg=5fcpuid=5fx86=2ec=3a99?=
 =?UTF-8?B?OjQyOiBlcnJvcjog4oCYSU5JVF9TUEVDSUFMX0ZFQVRVUkVT4oCZIHVuZGVjbGFy?=
 =?UTF-8?Q?ed_=28first_use_in_this_function=29=3b_did_you_mean_=e2=80=98INIT?=
 =?UTF-8?B?X1BWX01BWF9GRUFUVVJFU+KAmT8=?=
Message-ID: <39b24aaf-a785-6dae-23fa-c9a787760565@eikelenboom.it>
Date: Tue, 8 Jun 2021 13:28:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: nl-NL
Content-Transfer-Encoding: 8bit

L.S.,

I seem to be running into a build error with current xen-unstable.

--
Sander

echo '#if 0' >>/usr/src/new/xen-unstable/xen/include/asm-x86/asm-macros.h.new
echo '.endif' >>/usr/src/new/xen-unstable/xen/include/asm-x86/asm-macros.h.new
cat asm-macros.i >>/usr/src/new/xen-unstable/xen/include/asm-x86/asm-macros.h.new
echo '#endif' >>/usr/src/new/xen-unstable/xen/include/asm-x86/asm-macros.h.new
if ! cmp -s /usr/src/new/xen-unstable/xen/include/asm-x86/asm-macros.h.new /usr/src/new/xen-unstable/xen/include/asm-x86/asm-macros.h; then mv -f /usr/src/new/xen-unstable/xen/include/asm-x86/asm-macros.h.new /usr/src/new/xen-unstable
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
make[3]: Leaving directory '/usr/src/new/xen-unstable/xen/arch/x86'
make -f /usr/src/new/xen-unstable/xen/Rules.mk include/asm-x86/asm-offsets.h
make[3]: Entering directory '/usr/src/new/xen-unstable/xen'
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
gcc -MMD -MP -MF ./.asm-offsets.s.d -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs -O1 -fno-omit-frame-pointer -nostdinc
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
if ! cmp -s asm-offsets.s.new asm-offsets.s; then mv -f asm-offsets.s.new asm-offsets.s; else rm -f asm-offsets.s.new; fi
gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_L
make[3]: Leaving directory '/usr/src/new/xen-unstable/xen'
make -f /usr/src/new/xen-unstable/xen/Rules.mk -C arch/x86 /usr/src/new/xen-unstable/xen/xen
make[3]: Entering directory '/usr/src/new/xen-unstable/xen/arch/x86'
gcc  -DPIC -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=_
gcc  -DPIC -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=_
gcc  -DPIC -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Og -fno-omit-frame-pointer -D__XEN_INTERFACE_VERSION__=_
xg_cpuid_x86.c: In function ‘xc_get_static_cpu_featuremask’:
xg_cpuid_x86.c:99:42: error: ‘INIT_SPECIAL_FEATURES’ undeclared (first use in this function); did you mean ‘INIT_PV_MAX_FEATURES’?
  #define MASK(x) [XC_FEATUREMASK_ ## x] = INIT_ ## x ## _FEATURES
                                           ^~~~~
xg_cpuid_x86.c:102:9: note: in expansion of macro ‘MASK’
          MASK(SPECIAL),
          ^~~~
xg_cpuid_x86.c:99:42: note: each undeclared identifier is reported only once for each function it appears in
  #define MASK(x) [XC_FEATUREMASK_ ## x] = INIT_ ## x ## _FEATURES
                                           ^~~~~
xg_cpuid_x86.c:102:9: note: in expansion of macro ‘MASK’
          MASK(SPECIAL),
          ^~~~
make[6]: *** [/usr/src/new/xen-unstable/tools/libs/guest/../../../tools/Rules.mk:145: xg_cpuid_x86.o] Error 1
make[6]: *** Waiting for unfinished jobs....
sed "s!\(^\| \)$PWD/! !" .asm-macros.i.d >.asm-macros.i.d2.tmp && mv -f .asm-macros.i.d2.tmp .asm-macros.i.d2
make[6]: Leaving directory '/usr/src/new/xen-unstable/tools/libs/guest'
make[5]: *** [/usr/src/new/xen-unstable/tools/libs/../../tools/Rules.mk:161: subdir-install-guest] Error 2
make[5]: Leaving directory '/usr/src/new/xen-unstable/tools/libs'
make[4]: *** [/usr/src/new/xen-unstable/tools/libs/../../tools/Rules.mk:156: subdirs-install] Error 2
make[4]: Leaving directory '/usr/src/new/xen-unstable/tools/libs'
make[3]: *** [/usr/src/new/xen-unstable/tools/../tools/Rules.mk:161: subdir-install-libs] Error 2
make[3]: Leaving directory '/usr/src/new/xen-unstable/tools'
make[2]: *** [/usr/src/new/xen-unstable/tools/../tools/Rules.mk:156: subdirs-install] Error 2
make[2]: Leaving directory '/usr/src/new/xen-unstable/tools'
make[1]: *** [Makefile:66: install] Error 2
make[1]: Leaving directory '/usr/src/new/xen-unstable/tools'
make: *** [Makefile:140: install-tools] Error 2
make: *** Waiting for unfinished jobs....

