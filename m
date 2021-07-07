Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7E3BE968
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152288.281364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18E1-00008c-NQ; Wed, 07 Jul 2021 14:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152288.281364; Wed, 07 Jul 2021 14:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18E1-00006W-I8; Wed, 07 Jul 2021 14:08:29 +0000
Received: by outflank-mailman (input) for mailman id 152288;
 Wed, 07 Jul 2021 14:08:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m18E0-00006M-Ah; Wed, 07 Jul 2021 14:08:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m18Dz-0005B9-VR; Wed, 07 Jul 2021 14:08:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m18Dz-000493-Np; Wed, 07 Jul 2021 14:08:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m18Dz-0008R0-NK; Wed, 07 Jul 2021 14:08:27 +0000
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
	bh=HicMAfhVsDdH2gvGxpieMiWjQlQyh6xb/Qboi5fcKOI=; b=TlIN6rtdXgb+UmISLhhsfu4RpT
	ide3srYpwDw7eB56WE6oklfyPG0dx0bN5+q0Sx9X4WrTPmH72m0/Y/QtpEzo6ciYxZdBgIYAnQcLg
	9m+Bkbmv6/p7VpjXMKfK5kpYHqrLRpGdc8+jzZln6WW+mRKgfjDP2kN/0rpRusWqLZiY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163401-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 163401: regressions - trouble: blocked/fail
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=b8d27e5b3391f4f90744f6ce75c02bd2661f7788
X-Osstest-Versions-That:
    xen=4473f3601098a2c3cf5ab89d5a29504772985e3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jul 2021 14:08:27 +0000

flight 163401 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163401/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 163326
 build-arm64-xsm               6 xen-build                fail REGR. vs. 163326
 build-armhf                   6 xen-build                fail REGR. vs. 163326

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  b8d27e5b3391f4f90744f6ce75c02bd2661f7788
baseline version:
 xen                  4473f3601098a2c3cf5ab89d5a29504772985e3a

Last test of basis   163326  2021-07-06 09:01:40 Z    1 days
Failing since        163328  2021-07-06 13:01:47 Z    1 days   16 attempts
Testing same since   163398  2021-07-07 11:00:30 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michal Orzel <michal.orzel@arm.com>
  Olaf Hering <olaf@aepfle.de>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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
commit b8d27e5b3391f4f90744f6ce75c02bd2661f7788
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 7 12:35:54 2021 +0200

    x86/mem-sharing: mov {get,put}_two_gfns()
    
    There's no reason for every CU including p2m.h to have these two
    functions compiled, when they're both mem-sharing specific right now and
    for the foreseeable future.
    
    Largely just code movement, with some style tweaks, the inline-s
    dropped, and "put" being made consistent with "get" as to their NULL
    checking of the passed in pointer to struct two_gfns.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit 09af2d01a2fe6a0af08598bdfe12c9707f4d82ba
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 7 12:35:12 2021 +0200

    x86/mem-sharing: ensure consistent lock order in get_two_gfns()
    
    While the comment validly says "Sort by domain, if same domain by gfn",
    the implementation also included equal domain IDs in the first part of
    the check, thus rending the second part entirely dead and leaving
    deadlock potential when there's only a single domain involved.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit 980d6acf1517f0602e6dcf05ea922cf14c95e9c0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 7 12:32:45 2021 +0200

    IOMMU: make DMA containment of quarantined devices optional
    
    Containing still in flight DMA was introduced to work around certain
    devices / systems hanging hard upon hitting a "not-present" IOMMU fault.
    Passing through (such) devices (on such systems) is inherently insecure
    (as guests could easily arrange for IOMMU faults of any kind to occur).
    Defaulting to a mode where admins may not even become aware of issues
    with devices can be considered undesirable. Therefore convert this mode
    of operation to an optional one, not one enabled by default.
    
    This involves resurrecting code commit ea38867831da ("x86 / iommu: set
    up a scratch page in the quarantine domain") did remove, in a slightly
    extended and abstracted fashion. Here, instead of reintroducing a pretty
    pointless use of "goto" in domain_context_unmap(), and instead of making
    the function (at least temporarily) inconsistent, take the opportunity
    and replace the other similarly pointless "goto" as well.
    
    In order to key the re-instated bypasses off of there (not) being a root
    page table this further requires moving the allocate_domain_resources()
    invocation from reassign_device() to amd_iommu_setup_domain_device() (or
    else reassign_device() would allocate a root page table anyway); this is
    benign to the second caller of the latter function.
    
    In VT-d's domain_context_unmap(), instead of adding yet another
    "goto out" when all that's wanted is a "return", eliminate the "out"
    label at the same time.
    
    Take the opportunity and also limit the control to builds supporting
    PCI.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit f17a73b3c0264c62dd6b5dae01ed621c051c3038
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:08 2021 +0200

    tools/migration: unify type checking for data pfns in migration stream
    
    Introduce a helper which decides if a given pfn type has data
    in the migration stream.
    
    No change in behaviour intended, except for invalid page types which now
    have a safer default.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 5588ebcfca774477cf823949e5703b0ac48818cc
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:07 2021 +0200

    tools/migration: unify type checking for data pfns in the VM
    
    Introduce a helper which decides if a given pfn in the migration
    stream is backed by memory.
    
    This highlights more clearly that type XEN_DOMCTL_PFINFO_XALLOC (a
    synthetic toolstack-only type used between Xen 4.2 to 4.5 which
    indicated a dirty page on the sending side for which no data will be
    send in the initial iteration) does get populated in the VM.
    
    No change in behaviour intended, except for invalid page types which now
    have a safer default.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 9e59d9f8ee3808acde9833192211da25f66d8cc2
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:05 2021 +0200

    tools/migration: unify known page type checking
    
    Users of xc_get_pfn_type_batch may want to sanity check the data
    returned by Xen. Add helpers for this purpose:
    
    is_known_page_type verifies the type returned by Xen on the saving
    side, or the incoming type for a page on the restoring side, is known
    by the save/restore code.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit a27976a1080d537fb1f212a8f9133d60daa0025b
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:01 2021 +0200

    tools/python: fix Python3.4 TypeError in format string
    
    Using the first element of a tuple for a format specifier fails with
    python3.4 as included in SLE12:
        b = b"string/%x" % (i, )
    TypeError: unsupported operand type(s) for %: 'bytes' and 'tuple'
    
    It happens to work with python 2.7 and 3.6.
    To support older Py3, format as strings and explicitly encode as ASCII.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

commit c8f88810db2a25d6aacf65c1c60bc4f5d848a483
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 1 11:56:00 2021 +0200

    tools/python: handle libxl__physmap_info.name properly in convert-legacy-stream
    
    The trailing member name[] in libxl__physmap_info is written as a
    cstring into the stream. The current code does a sanity check if the
    last byte is zero. This attempt fails with python3 because name[-1]
    returns a type int. As a result the comparison with byte(\00) fails:
    
      File "/usr/lib/xen/bin/convert-legacy-stream", line 347, in read_libxl_toolstack
        raise StreamError("physmap name not NUL terminated")
      StreamError: physmap name not NUL terminated
    
    To handle both python variants, cast to bytearray().
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

commit 918b8842a852e0e7446286f546724b1c63c56c66
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Mon Jul 5 08:39:52 2021 +0200

    arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    Modify type of hsr, cpsr, spsr_el1 to uint64_t.
    Previously we relied on the padding after spsr_el1.
    As we removed the padding, modify the union to be 64bit so we don't corrupt spsr_fiq.
    No need to modify the assembly code because the accesses were based on 64bit
    registers as there was a 32bit padding after spsr_el1.
    
    Remove 32bit padding in cpu_user_regs before spsr_fiq
    as it is no longer needed due to upper union being 64bit now.
    Add 64bit padding in cpu_user_regs before spsr_el1
    because the kernel frame should be 16-byte aligned.
    
    Change type of cpsr to uint64_t in the public outside interface
    "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
    Increment XEN_DOMCTL_INTERFACE_VERSION.
    
    Change type of cpsr to uint64_t in the public outside interface
    "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

