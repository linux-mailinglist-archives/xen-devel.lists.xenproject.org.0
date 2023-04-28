Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F56F1013
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 03:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527136.819396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psD2t-0002cg-UB; Fri, 28 Apr 2023 01:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527136.819396; Fri, 28 Apr 2023 01:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psD2t-0002ab-PB; Fri, 28 Apr 2023 01:37:11 +0000
Received: by outflank-mailman (input) for mailman id 527136;
 Fri, 28 Apr 2023 01:37:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psD2s-0002aR-Pa; Fri, 28 Apr 2023 01:37:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psD2s-0004Gr-EK; Fri, 28 Apr 2023 01:37:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psD2s-0004z1-4P; Fri, 28 Apr 2023 01:37:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1psD2s-0006RE-3n; Fri, 28 Apr 2023 01:37:10 +0000
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
	bh=A5Rw1pdz6glX+Wipd68utgA0QTwGmHdnTNzEjGCbABc=; b=BGonZOohCeejTo5NlUVTifBVYF
	/zs9RyQS3fEkd0on7kOSeSJddyOkoybg+czGkdeW/ncZJY4hupsNuH16lR0Mv4KZUeu36oFapOMg8
	q6pafzNE3k7JYunqbpK3kSlaFOFFMOjOwWr2YjsYLF/gRRYtqeGnXx+ZpzufVkR4s3eo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180453-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180453: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8e974df445807bb4a3629ca51145c7d74ee85c8f
X-Osstest-Versions-That:
    xen=dde20f7dc182fdfeeb6c55648979326bb982ca8c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Apr 2023 01:37:10 +0000

flight 180453 xen-unstable-smoke real [real]
flight 180456 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180453/
http://logs.test-lab.xenproject.org/osstest/logs/180456/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm     18 guest-start/debian.repeat fail REGR. vs. 180435

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8e974df445807bb4a3629ca51145c7d74ee85c8f
baseline version:
 xen                  dde20f7dc182fdfeeb6c55648979326bb982ca8c

Last test of basis   180435  2023-04-26 17:01:58 Z    1 days
Testing same since   180453  2023-04-27 21:02:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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

