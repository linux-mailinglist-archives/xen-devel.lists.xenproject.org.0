Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A194677F4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237626.412153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8Pz-0006B9-UI; Fri, 03 Dec 2021 13:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237626.412153; Fri, 03 Dec 2021 13:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8Pz-00069K-R5; Fri, 03 Dec 2021 13:16:03 +0000
Received: by outflank-mailman (input) for mailman id 237626;
 Fri, 03 Dec 2021 13:16:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mt8Py-00069A-GY; Fri, 03 Dec 2021 13:16:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mt8Py-0004yS-CO; Fri, 03 Dec 2021 13:16:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mt8Py-00083v-5f; Fri, 03 Dec 2021 13:16:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mt8Py-0005tT-57; Fri, 03 Dec 2021 13:16:02 +0000
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
	bh=8oomaWCObGV6U3MuPTcheTzH7HImV29Q2ktY7BWzlZs=; b=yfstF/Qy+j2SrpTVSg+HQpJWWn
	plcNL269q4M6CDuLw/KG8pq0I9aWM95j1m5l8HFrJEBFubk3tu8GzpvxbD/a2r40dIp+ieOj7WHpR
	nTUmnmg/8q+kh2x+QuBmN0naiblXc2Np1vRUF9KhddkMeT64NYm3LDMFfUWq53RUa468=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167073-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 167073: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=05657c6d1821dfc4e9a618767a942b3555406046
X-Osstest-Versions-That:
    xen=e7f147bf4ac725492962a501da72f5ab6be682db
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Dec 2021 13:16:02 +0000

flight 167073 xen-unstable-smoke real [real]
flight 167086 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167073/
http://logs.test-lab.xenproject.org/osstest/logs/167086/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166958

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  05657c6d1821dfc4e9a618767a942b3555406046
baseline version:
 xen                  e7f147bf4ac725492962a501da72f5ab6be682db

Last test of basis   166958  2021-11-30 12:00:32 Z    3 days
Failing since        166977  2021-12-01 17:08:21 Z    1 days    9 attempts
Testing same since   167051  2021-12-03 00:00:28 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Ayan Kumar Halder <ayankuma@xilinx.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Vikram Garhwal <fnu.vikram@xilinx.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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
commit 05657c6d1821dfc4e9a618767a942b3555406046
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Nov 29 20:11:01 2021 +0000

    x86/boot: Support __ro_after_init
    
    For security hardening reasons, it advantageous to make setup-once data
    immutable after boot.  Borrow __ro_after_init from Linux.
    
    On x86, place .data.ro_after_init at the start of .rodata, excluding it from
    the early permission restrictions.  Re-apply RO restrictions to the whole of
    .rodata in init_done(), attempting to reform the superpage if possible.
    
    For architectures which don't implement __ro_after_init explicitly, variables
    merges into .data.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 8de86b5cd4353bf2cc415e4563f973f071b4e8a3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Nov 29 20:04:11 2021 +0000

    x86/boot: Adjust .text/.rodata/etc permissions in one place
    
    At the moment, we have two locations selecting restricted permissions, not
    very far apart on boot, dependent on opposite answers from using_2M_mapping().
    The later location however can shatter superpages if needed, while the former
    cannot.
    
    Collect together all the permission adjustments at the slightly later point in
    boot, as we likely need to shatter a superpage to support __ro_after_init.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit c182e89d0b341d2efc930c2e1211d3e866c0effb
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Nov 29 19:01:50 2021 +0000

    x86/boot: Drop xen_virt_end
    
    The calculation in __start_xen() for xen_virt_end is an opencoding of
    ROUNDUP(_end, 2M).  This is __2M_rwdata_end as provided by the linker script.
    
    This corrects the bound calculations in arch_livepatch_init() and
    update_xen_mappings() to not enforce 2M alignment when Xen is not compiled
    with CONFIG_XEN_ALIGN_2M.
    
    Furthermore, since 52975142d154 ("x86/boot: Create the l2_xenmap[] mappings
    dynamically"), there have not been extraneous mappings to delete, meaning that
    the call to destroy_xen_mappings() has been a no-op.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit ffa5d037c78fe175f31373deec0759ff8cc8d66c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Nov 29 19:52:05 2021 +0000

    x86/boot: Fix data placement around __high_start()
    
    multiboot_ptr should be in __initdata - it is only used on the BSP path.
    Furthermore, the .align 8 then .long means that stack_start is misaligned.
    
    Move both into setup.c, which lets the compiler handle the details correctly,
    as well as providing proper debug information for them.
    
    Declare stack_start in setup.h and avoid extern-ing it locally in smpboot.c.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 3099ff3ce15481b4f1536470cb87ac0ebf82b7bb
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Nov 29 19:19:43 2021 +0000

    x86/boot: Better describe the pagetable relocation loops
    
    The first loop relocates all reachable non-leaf entries in idle_pg_table[],
    which includes l2_xenmap[511]'s reference to l1_fixmap_x[].
    
    The second loop relocates only leaf mappings in l2_xenmap[], so update the
    skip condition to be opposite to the first loop.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a15b143a5f1c20dc6893bc3e50873e308ef61d87
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Nov 29 16:09:08 2021 +0000

    x86/boot: Drop incorrect mapping at l2_xenmap[0]
    
    It has been 4 years since the default load address changed from 1M to 2M, and
    _stext ceased residing in l2_xenmap[0].  We should not be inserting an unused
    mapping.
    
    To ensure we don't create mappings accidentally, loop from 0 and obey
    _PAGE_PRESENT on all entries.
    
    Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 MiB")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit eb41074692094dff1413efb44fa4928a9140aa41
Author: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Date:   Tue Nov 30 18:12:38 2021 +0000

    bitops: Fix incorrect value in comment
    
    GENMASK(30, 21) should be 0x7fe00000. Fixed this in the comment
    in bitops.h.
    
    Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    [Tweak text, to put an end to any further bikeshedding]
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 6c1c97e24f830a921a23e3b9694e20493c9986ee
Author: Ian Jackson <iwj@xenproject.org>
Date:   Wed Dec 1 18:07:40 2021 +0000

    CHANGELOG.md: Start new "unstable" section
    
    I have just forward-ported the CHANGELOG.md updates from the
    stable-4.16 branch.  But we need a new section for work in this
    release cycle.
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>

commit eef266eb770128db0d5258009b744f0e0c31c9bd
Author: Ian Jackson <iwj@xenproject.org>
Date:   Tue Nov 30 11:40:21 2021 +0000

    CHANGELOG.md: Set 4.16 version and date
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>
    (cherry picked from commit 36aa64095d0419d52d2466405ac13b9858463f48)

commit e058b2d4e5e2ad7ad03941d36ef9243291b35671
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Wed Nov 24 12:24:03 2021 +0100

    CHANGELOG: add missing entries for work during the 4.16 release cycle
    
    Document some of the relevant changes during the 4.16 release cycle.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
    (cherry picked from commit e2544a28beacd854f295095d102a8773743ac917)

commit 9012687f05adf96440316ce338514db574ebfde0
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Tue Nov 16 15:06:24 2021 +0000

    arm/efi: Improve performance requesting filesystem handle
    
    Currently, the code used to handle and possibly load from the filesystem
    modules defined in the DT is allocating and closing the filesystem handle
    for each module to be loaded.
    
    To improve the performance, the filesystem handle pointer is passed
    through the call stack, requested when it's needed only once and closed
    if it was allocated.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit ad9cf6bde5b90d4c1e5a79a2803e98d6344c27d7
Author: Vikram Garhwal <fnu.vikram@xilinx.com>
Date:   Thu Nov 11 23:27:20 2021 -0800

    Update libfdt to v1.6.1
    
    Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dtc.
    This update is done to support device tree overlays.
    
    A few minor changes are done to make it compatible with Xen:
        fdt_overlay.c: overlay_fixup_phandle()
    
            Replace strtoul() with simple_strtoul() as strtoul() is not available in
            Xen lib and included lib.h.
    
            Change char *endptr to const char *endptr. This change is required for
            using simple_strtoul().
    
        libfdt_env.h:
            Remaining Xen changes to libfdt_env.h carried over from existing
            libfdt (v1.4.0)
    
    Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
    Tested-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

