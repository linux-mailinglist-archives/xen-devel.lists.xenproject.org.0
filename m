Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E04E2EABA5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61962.109356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmBL-0001Wq-Nx; Tue, 05 Jan 2021 13:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61962.109356; Tue, 05 Jan 2021 13:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmBL-0001WF-FU; Tue, 05 Jan 2021 13:15:27 +0000
Received: by outflank-mailman (input) for mailman id 61962;
 Tue, 05 Jan 2021 13:15:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwmBJ-0001W5-KH; Tue, 05 Jan 2021 13:15:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwmBJ-00014x-H4; Tue, 05 Jan 2021 13:15:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kwmBJ-0005wP-At; Tue, 05 Jan 2021 13:15:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kwmBJ-0000tu-AN; Tue, 05 Jan 2021 13:15:25 +0000
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
	bh=9JaKbTFYQJz45fAQcZXiDGF5RJrHgN+qvqdbfWqMMmQ=; b=Y/qVPJIRzpByeVy/S01y4lN39t
	UcqsbOKfqd703nqFn51YxPxErBf5HdIxz5j2xT3VRdk4rrFm3Q/odmWIyC1KsSiZMjRshve7pZ7YH
	kFFfWCrWwWHI32WqhksY499IOSB+ai1x67uTGYceQS17lofOa4552YNFmhZyUixtQQC0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158152-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158152: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6ea3e32a5e0e6ba0f568aa5fd5a6b016c0c21ca0
X-Osstest-Versions-That:
    xen=7ba2ab495be54f608cb47440e1497b2795bd301a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 Jan 2021 13:15:25 +0000

flight 158152 xen-unstable-smoke real [real]
flight 158156 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/158152/
http://logs.test-lab.xenproject.org/osstest/logs/158156/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 158134

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6ea3e32a5e0e6ba0f568aa5fd5a6b016c0c21ca0
baseline version:
 xen                  7ba2ab495be54f608cb47440e1497b2795bd301a

Last test of basis   158134  2021-01-04 15:01:26 Z    0 days
Testing same since   158142  2021-01-05 02:00:25 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      pass    
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
commit 6ea3e32a5e0e6ba0f568aa5fd5a6b016c0c21ca0
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Dec 17 15:38:08 2020 +0000

    xen/arm: Activate TID3 in HCR_EL2
    
    Activate TID3 bit in HCR register when starting a guest.
    This will trap all coprecessor ID registers so that we can give to guest
    values corresponding to what they can actually use and mask some
    features to guests even though they would be supported by the underlying
    hardware (like SVE or MPAM).
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 73ff36144014218f796f7e07c1224a1c580012d1
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Dec 17 15:38:07 2020 +0000

    xen/arm: Add CP10 exception support to handle MVFR
    
    Add support for cp10 exceptions decoding to be able to emulate the
    values for MVFR0, MVFR1 and MVFR2 when TID3 bit of HSR is activated.
    This is required for aarch32 guests accessing MVFR registers using
    vmrs and vmsr instructions.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 8f81064a07c64952931eafdd9a9a3017ed6ffd26
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Dec 17 15:38:06 2020 +0000

    xen/arm: Add handler for cp15 ID registers
    
    Add support for emulation of cp15 based ID registers (on arm32 or when
    running a 32bit guest on arm64).
    The handlers are returning the values stored in the guest_cpuinfo
    structure for known registers and RAZ for all reserved registers.
    In the current status the MVFR registers are no supported.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    [Stefano: fix code style]
    Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 07b9acea116e8329d613004766b8606756986db5
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Dec 17 15:38:05 2020 +0000

    xen/arm: Add handler for ID registers on arm64
    
    Add vsysreg emulation for registers trapped when TID3 bit is activated
    in HSR.
    The emulation is returning the value stored in cpuinfo_guest structure
    for know registers and is handling reserved registers as RAZ.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 3669a1cb95983dc1c01be46e7df5dd9357d7b973
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Dec 17 15:38:04 2020 +0000

    xen/arm: create a cpuinfo structure for guest
    
    Create a cpuinfo structure for guest and mask into it the features that
    we do not support in Xen or that we do not want to publish to guests.
    
    Modify some values in the cpuinfo structure for guests to mask some
    features which we do not want to allow to guests (like AMU) or we do not
    support (like SVE).
    Modify some values in the guest cpuinfo structure to guests to hide some
    processor features:
    - SVE as this is not supported by Xen and guest are not allowed to use
    this features (ZEN is set to 0 in CPTR_EL2).
    - AMU as HCPTR_TAM is set in CPTR_EL2 so AMU cannot be used by guests
    All other bits are left untouched.
    - RAS as this is not supported by Xen.
    
    The code is trying to group together registers modifications for the
    same feature to be able in the long term to easily enable/disable a
    feature depending on user parameters or add other registers modification
    in the same place (like enabling/disabling HCR bits).
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 2d66a1f095f716e4bf7e47d61e1d1de13e99167a
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Dec 17 15:38:03 2020 +0000

    xen/arm: Add arm64 ID registers definitions
    
    Add coprocessor registers definitions for all ID registers trapped
    through the TID3 bit of HSR.
    Those are the one that will be emulated in Xen to only publish to guests
    the features that are supported by Xen and that are accessible to
    guests.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 9cfdb489af810f71acb7dcdb87075dc7b3b313a0
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Dec 17 15:38:02 2020 +0000

    xen/arm: Add ID registers and complete cpuinfo
    
    Add definition and entries in cpuinfo for ID registers introduced in
    newer Arm Architecture reference manual:
    - ID_PFR2: processor feature register 2
    - ID_DFR1: debug feature register 1
    - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
    - ID_ISA6: ISA Feature register 6
    Add more bitfield definitions in PFR fields of cpuinfo.
    Add MVFR2 register definition for aarch32.
    Add MVFRx_EL1 defines for aarch32.
    Add mvfr values in cpuinfo.
    Add some registers definition for arm64 in sysregs as some are not
    always know by compilers.
    Initialize the new values added in cpuinfo in identify_cpu during init.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit a9f1f03b2710f5ce84f69c1c4516349531053fac
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Dec 17 15:38:01 2020 +0000

    xen/arm: Use READ_SYSREG instead of 32/64 versions
    
    Modify identify_cpu function to use READ_SYSREG instead of READ_SYSREG32
    or READ_SYSREG64.
    
    All aarch32 specific registers (for example ID_PFR0_EL1) are 64bit when
    accessed from aarch64 with upper bits read as 0, so it is right to
    access them as 64bit registers on a 64bit platform.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

