Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DC3BDF9A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 01:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151765.280400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0uA5-0004QT-O8; Tue, 06 Jul 2021 23:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151765.280400; Tue, 06 Jul 2021 23:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0uA5-0004NF-ID; Tue, 06 Jul 2021 23:07:29 +0000
Received: by outflank-mailman (input) for mailman id 151765;
 Tue, 06 Jul 2021 23:07:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0uA3-0004N5-Ey; Tue, 06 Jul 2021 23:07:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0uA3-00041v-96; Tue, 06 Jul 2021 23:07:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m0uA3-0003l9-1a; Tue, 06 Jul 2021 23:07:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m0uA3-0005dM-18; Tue, 06 Jul 2021 23:07:27 +0000
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
	bh=b9KXAOtw3/ZrXSN1uNoqhIvOqXmgVDDqARC36KokyUM=; b=lpE1ZFGGU4GbXnbDL0Dej6j8Hs
	TbxWJtcLFJU8VoT9DHCwCGXCF5KGAYqPTdh8xgL1oJhvPXVleXwNMm1ilFMoZZAdGLqHenJ+pihJ3
	s/+3MuYM0xsQh44Z/37nQHXvZuBFsS2JOBnY2Vc1IpMcYfYSHb2JHBnHH0HAQDK6lLbE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163366-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 163366: regressions - trouble: blocked/fail
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
    xen=f17a73b3c0264c62dd6b5dae01ed621c051c3038
X-Osstest-Versions-That:
    xen=4473f3601098a2c3cf5ab89d5a29504772985e3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Jul 2021 23:07:27 +0000

flight 163366 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163366/

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
 xen                  f17a73b3c0264c62dd6b5dae01ed621c051c3038
baseline version:
 xen                  4473f3601098a2c3cf5ab89d5a29504772985e3a

Last test of basis   163326  2021-07-06 09:01:40 Z    0 days
Testing same since   163328  2021-07-06 13:01:47 Z    0 days    8 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michal Orzel <michal.orzel@arm.com>
  Olaf Hering <olaf@aepfle.de>

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

