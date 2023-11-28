Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C07FB22C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 07:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642745.1002421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ryO-0006wb-GL; Tue, 28 Nov 2023 06:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642745.1002421; Tue, 28 Nov 2023 06:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ryO-0006uh-By; Tue, 28 Nov 2023 06:53:32 +0000
Received: by outflank-mailman (input) for mailman id 642745;
 Tue, 28 Nov 2023 06:53:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7ryN-0006uQ-Bp; Tue, 28 Nov 2023 06:53:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7ryN-0000ka-5R; Tue, 28 Nov 2023 06:53:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7ryM-0001yS-SU; Tue, 28 Nov 2023 06:53:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r7ryM-0004wc-Rw; Tue, 28 Nov 2023 06:53:30 +0000
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
	bh=5Afrvf1EgdQpNP7qj5C1fr96j6E84njS4ATXMTGvpvE=; b=7MGub7zg9ZWcdPgyZQ2qqPgL+9
	6CRZ70el7j572kkWWp7ySEQzLhpqKwJpZu1nFHapI+zGU5GNffPWdqX7GBgt3XCGBYx0Os68E8+Ba
	pNMo3/YdkaRJjTrLvVFL77ylZHgZC2ZSPP/UFhEpzXDGN1GR1iUwBW4LK1ncZHt0nLTU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183878-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183878: regressions - all pass
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build/dist-test:fail:regression
    xen-unstable-smoke:build-arm64-xsm:xen-build/dist-test:fail:regression
    xen-unstable-smoke:build-armhf:xen-build/dist-test:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=72d51813d631fe27d37736b7a55eeec08f246983
X-Osstest-Versions-That:
    xen=80c153c48b255bae61948827241c26671207cf4e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Nov 2023 06:53:30 +0000

flight 183878 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183878/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   7 xen-build/dist-test      fail REGR. vs. 183851
 build-arm64-xsm               7 xen-build/dist-test      fail REGR. vs. 183851
 build-armhf                   7 xen-build/dist-test      fail REGR. vs. 183851

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  72d51813d631fe27d37736b7a55eeec08f246983
baseline version:
 xen                  80c153c48b255bae61948827241c26671207cf4e

Last test of basis   183851  2023-11-24 09:03:53 Z    3 days
Failing since        183871  2023-11-27 14:00:26 Z    0 days    3 attempts
Testing same since   183874  2023-11-27 19:00:27 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
  Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Simone Ballarin  <simone.ballarin@bugseng.com>
  Simone Ballarin <simone.ballarin@bugseng.com>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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
commit 72d51813d631fe27d37736b7a55eeec08f246983
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Nov 27 15:18:48 2023 +0100

    x86: amend cpu_has_xen_{ibt,shstk}
    
    ... to evaluate to false at compile-time when the respective Kconfig
    control is off, thus allowing the compiler to eliminate then-dead code.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 17754972fa98bff2dfdec09b8094f54530bafcb8
Author: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Date:   Mon Nov 27 15:17:56 2023 +0100

    x86/atomic: address violations of MISRA C:2012 Rule 11.8
    
    Edit casts that unnecessarily remove const qualifiers
    to comply with Rule 11.8.
    The type of the provided pointer may be const qualified.
    No functional change.
    
    Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
    Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit fc63c0ebefe7e9d166b07971273c1de62428eb18
Author: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Date:   Mon Nov 27 15:17:32 2023 +0100

    AMD/IOMMU: address violations of MISRA C:2012 Rule 11.8
    
    Drop an unnecessary cast discarding a const qualifier, to comply with
    Rule 11.8. The type of the formal parameter ivhd_block is const
    qualified.
    
    No functional change.
    
    Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
    Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit fe26cb2dd20fa864deb05e4b278bc9993ba120e6
Author: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Date:   Mon Nov 27 15:17:07 2023 +0100

    x86/boot/reloc: address violations of MISRA C:2012 Rule 11.8
    
    Add missing const qualifier in casting to comply with Rule 11.8.
    Argument tag is typically const qualified.
    No functional change.
    
    Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
    Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 09c2fe438da1dfc83f70d921b52240bea576615f
Author: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Date:   Mon Nov 27 15:16:43 2023 +0100

    x86/platform_hypercall: address violations of MISRA C:2012 Rule 11.8
    
    Add const qualifier in cast that unnecessarily removes it
    to comply with Rule 11.8.
    The variable info is declared with a const qualified type.
    No functional change.
    
    Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
    Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 82182ad7b46e0f7a3856bb12c7a9bf2e2a4570bc
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Nov 27 15:16:01 2023 +0100

    livepatch: do not use .livepatch.funcs section to store internal state
    
    Currently the livepatch logic inside of Xen will use fields of struct
    livepatch_func in order to cache internal state of patched functions.  Note
    this is a field that is part of the payload, and is loaded as an ELF section
    (.livepatch.funcs), taking into account the SHF_* flags in the section
    header.
    
    The flags for the .livepatch.funcs section, as set by livepatch-build-tools,
    are SHF_ALLOC, which leads to its contents (the array of livepatch_func
    structures) being placed in read-only memory:
    
    Section Headers:
      [Nr] Name              Type             Address           Offset
           Size              EntSize          Flags  Link  Info  Align
    [...]
      [ 4] .livepatch.funcs  PROGBITS         0000000000000000  00000080
           0000000000000068  0000000000000000   A       0     0     8
    
    This previously went unnoticed, as all writes to the fields of livepatch_func
    happen in the critical region that had WP disabled in CR0.  After 8676092a0f16
    however WP is no longer toggled in CR0 for patch application, and only the
    hypervisor .text mappings are made write-accessible.  That leads to the
    following page fault when attempting to apply a livepatch:
    
    ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
    CPU:    4
    RIP:    e008:[<ffff82d040221e81>] common/livepatch.c#apply_payload+0x45/0x1e1
    [...]
    Xen call trace:
       [<ffff82d040221e81>] R common/livepatch.c#apply_payload+0x45/0x1e1
       [<ffff82d0402235b2>] F check_for_livepatch_work+0x385/0xaa5
       [<ffff82d04032508f>] F arch/x86/domain.c#idle_loop+0x92/0xee
    
    Pagetable walk from ffff82d040625079:
     L4[0x105] = 000000008c6c9063 ffffffffffffffff
     L3[0x141] = 000000008c6c6063 ffffffffffffffff
     L2[0x003] = 000000086a1e7063 ffffffffffffffff
     L1[0x025] = 800000086ca5d121 ffffffffffffffff
    
    ****************************************
    Panic on CPU 4:
    FATAL PAGE FAULT
    [error_code=0003]
    Faulting linear address: ffff82d040625079
    ****************************************
    
    Fix this by moving the internal Xen function patching state out of
    livepatch_func into an area not allocated as part of the ELF payload.  While
    there also constify the array of livepatch_func structures in order to prevent
    further surprises.
    
    Note there's still one field (old_addr) that gets set during livepatch load.  I
    consider this fine since the field is read-only after load, and at the point
    the field gets set the underlying mapping hasn't been made read-only yet.
    
    Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET is active')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

commit 46f2e2c3bcd5b17dae0fd1e45ed8619d6c047b55
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Mon Nov 27 15:15:09 2023 +0100

    xen/mm: address violations of MISRA C:2012 Rules 8.2 and 8.3
    
    Add missing parameter names and uniform the interfaces of
    modify_xen_mappings() and modify_xen_mappings_lite().
    
    No functional change.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit b82b867a6694368b9a74ed00397b2393d129a24d
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Mon Nov 27 15:14:00 2023 +0100

    x86/mm: preparation work to uniform modify_xen_mappings* interfaces
    
    The objective is to use parameter name "nf" to denote "new flags"
    in all the modify_xen_mappings* functions.
    Since modify_xen_mappings_lite() is currently using "nf" as identifier
    for a local variable, bad things could happen if new uses of such
    variable are committed while a renaming patch is waiting for the
    approval.
    To avoid such danger, as first thing rename the local variable from
    "nf" to "flags".
    
    No functional change.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit fbcec32d6d3ea0ac329301925b317478316209ed
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Wed Nov 22 16:39:55 2023 +0000

    x86/mem_sharing: Release domain if we are not able to enable memory sharing
    
    In case it's not possible to enable memory sharing (mem_sharing_control
    fails) we just return the error code without releasing the domain
    acquired some lines above by rcu_lock_live_remote_domain_by_id().
    
    Fixes: 72f8d45d69b8 ("x86/mem_sharing: enable mem_sharing on first memop")
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit b9eeb1992676ec83cee285b97fee94d03eaa9836
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Wed Nov 22 16:26:20 2023 +0000

    x86/mem_sharing: Fix typo in comment
    
    ambigious -> ambiguous
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
(qemu changes not included)

