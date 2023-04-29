Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E34C6F24BA
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 14:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527627.820303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psjza-0008Ki-0A; Sat, 29 Apr 2023 12:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527627.820303; Sat, 29 Apr 2023 12:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psjzZ-0008Hc-T2; Sat, 29 Apr 2023 12:47:57 +0000
Received: by outflank-mailman (input) for mailman id 527627;
 Sat, 29 Apr 2023 12:47:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psjzX-0008HS-VL; Sat, 29 Apr 2023 12:47:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psjzX-000548-M5; Sat, 29 Apr 2023 12:47:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psjzX-0007xC-65; Sat, 29 Apr 2023 12:47:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1psjzX-0005ih-5c; Sat, 29 Apr 2023 12:47:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=ijaHJmv/HMztDBKRzNvZQJCiZr315DECEZuR0n2DrVo=; b=haOwZMn0ewah4NQlBvvTgAe5Pj
	rtege8+RPeMZQshm4lnz7sw8TVODl3HyXPF7T2ff831Lxpv7T9T0lMLE2Oc1BgxL0um19/oegPA3P
	bRUUs+Bkj70P9lLjzvxZiRe8Qfxte+c19SFzV4DH7x0Jg+4dJfUjtmbCZQ48ppXUcrnQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180475-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 180475: regressions - trouble: blocked/broken/fail/pass/starved
X-Osstest-Failures:
    xen-unstable:build-armhf:<job status>:broken:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:regression
    xen-unstable:build-armhf:host-build-prep:fail:regression
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=8e974df445807bb4a3629ca51145c7d74ee85c8f
X-Osstest-Versions-That:
    xen=dde20f7dc182fdfeeb6c55648979326bb982ca8c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Apr 2023 12:47:55 +0000

flight 180475 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180475/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. vs. 180452
 build-armhf                   5 host-build-prep          fail REGR. vs. 180452

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180452
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180452
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180452
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180452
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180452
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180452
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180452
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180452
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180452
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  8e974df445807bb4a3629ca51145c7d74ee85c8f
baseline version:
 xen                  dde20f7dc182fdfeeb6c55648979326bb982ca8c

Last test of basis   180452  2023-04-27 18:45:25 Z    1 days
Testing same since   180475  2023-04-28 18:13:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          starved 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
 test-armhf-armhf-xl-vhd                                      blocked 
 test-amd64-i386-xl-vhd                                       pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary

broken-job build-armhf broken

Not pushing.

------------------------------------------------------------
commit 8e974df445807bb4a3629ca51145c7d74ee85c8f
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Wed Apr 26 02:16:16 2023 +0200

    automation: include tail of serial log in the gitlab outout
    
    Make it a bit easier to see what has failed.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 3822b16a17dfa6396009c4acaf2ae660f933566f
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Wed Apr 26 02:16:15 2023 +0200

    automation: PCI passthrough tests on ADL hw
    
    Add simple PCI passthrough test to both PV and HVM domU. It passes
    through a network adapter (the only one in the system), gets an IP via
    DHCP (first basic test) and then ping the gateway (second basic test).
    Finally, if device is supposed to use MSI or MSI-X (as set in the
    PCIDEV_INTR test variable), check if it's in use via /proc/interrupts.
    
    On the current runner, the device in question is this:
    03:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I225-V [8086:15f3] (rev 03)
            Subsystem: Micro-Star International Co., Ltd. [MSI] Device [1462:7d25]
            Flags: bus master, fast devsel, latency 0, IRQ 18
            Memory at 50400000 (32-bit, non-prefetchable) [size=1M]
            Memory at 50500000 (32-bit, non-prefetchable) [size=16K]
            Capabilities: [40] Power Management version 3
            Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
            Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
            Capabilities: [a0] Express Endpoint, MSI 00
            Capabilities: [100] Advanced Error Reporting
            Capabilities: [140] Device Serial Number ...
            Capabilities: [1c0] Latency Tolerance Reporting
            Capabilities: [1f0] Precision Time Measurement
            Capabilities: [1e0] L1 PM Substates
            Kernel driver in use: igc
            Kernel modules: igc
    
    With the current Xen version, it uses MSI-X under PV and MSI under HVM.
    
    This patch moves domU config to a variable, to make it configurable on
    per-test basis. Add also a few comments for visual separation of tests.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 937e73feca9abaea06ec496cd93f8da8bd3b70bf
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Wed Apr 26 02:16:14 2023 +0200

    automation: wait for the login prompt as test end marker
    
    The login prompt is printed after all the startup (test) scripts, wait
    for that instead of "passed" marker. And only then check if test passed.
    Before this patch there was a race: "passed" marker could be already
    printed, but the final check would fail because login prompt wasn't
    there yet.
    
    Also, modify etc/issue in domU rootfs to avoid confusing the one from
    domU with the dom0's one. Use the dom0 one as test end marker.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit ac58d7fda63fecc6fae24f7824dbe033d001833e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Apr 26 15:34:30 2023 +0100

    CI: Remove all use of /bin/false as a ROM
    
    As the recent work to get PCI Passthrough testing working shows, putting
    `/bin/false` as a ROM into guest context doesn't work so well.
    
    For all ROM paths where we're skipping the build, use a slightly-plausible but
    likely non-existent path instead.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 09c7179f0a2c66d4d1716cc41c498349bf78811b
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Thu Apr 27 14:25:59 2023 +0100

    xen/misra: xen-analysis.py: fix return error on PhaseExceptions
    
    Currently the script return code is 0 even if an exception is
    found, because the return code is written only if the exception
    object has the errorcode member.
    
    Fix the issue returning the errorcode member in case it exists,
    otherwise use a generic value different from 0.
    
    Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

