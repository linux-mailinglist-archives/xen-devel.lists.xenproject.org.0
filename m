Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CF46C871B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 21:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514440.796671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfoP6-0002I2-B6; Fri, 24 Mar 2023 20:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514440.796671; Fri, 24 Mar 2023 20:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfoP6-0002GH-8C; Fri, 24 Mar 2023 20:52:52 +0000
Received: by outflank-mailman (input) for mailman id 514440;
 Fri, 24 Mar 2023 20:52:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfoP4-0002G7-Tj; Fri, 24 Mar 2023 20:52:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfoP4-0004a9-Rt; Fri, 24 Mar 2023 20:52:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfoP4-0004E3-Fr; Fri, 24 Mar 2023 20:52:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pfoP4-0005Os-FM; Fri, 24 Mar 2023 20:52:50 +0000
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
	bh=k9jZLN/3OipvgPisRGHaDTNsyuEsO6IoJ/pXuRJ30uM=; b=WZJJWO7tG7cOvm7i0oCi57SY7j
	0FwbsAHUaUPSdbhLJQ7Sig8pfxGDkrfiic29ng17+21eEqUYj6xBuiinRDZc9136vGNQJi1g0yXsI
	nu9cwrkl2d82o7KcXhSxeE/Ttt4GGXlTy2CGQ9hSPhz4vjIa2mo2tGnjNAhQncgkMjL4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179931-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 179931: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=054acfc4443cda51bc000c2e3ba08d9fd1bd77f1
X-Osstest-Versions-That:
    xen=715b92ba30f792e326bdd37b5a4969da9c5d4a6c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Mar 2023 20:52:50 +0000

flight 179931 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179931/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 179926

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  054acfc4443cda51bc000c2e3ba08d9fd1bd77f1
baseline version:
 xen                  715b92ba30f792e326bdd37b5a4969da9c5d4a6c

Last test of basis   179926  2023-03-24 14:01:58 Z    0 days
Testing same since   179929  2023-03-24 17:00:25 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          starved 
 test-arm64-arm64-xl-xsm                                      pass    
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
commit 054acfc4443cda51bc000c2e3ba08d9fd1bd77f1
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Tue Mar 21 13:33:42 2023 -0400

    misc: Replace git:// and http:// with https://
    
    Obtaining code over an insecure transport is a terrible idea for
    blatently obvious reasons.  Even for non-executable data, insecure
    transports are considered deprecated.
    
    This patch enforces the use of secure transports in misc places.
    All URLs are known to work.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 04988f1c595330fd39cdac2c6034ebb30616557e
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Tue Mar 21 13:33:40 2023 -0400

    configure: Replace git:// and http:// with https://
    
    Obtaining code over an insecure transport is a terrible idea for
    blatently obvious reasons.  Even for non-executable data, insecure
    transports are considered deprecated.
    
    This patch enforces the use of secure transports in the build system.
    Some URLs returned 301 or 302 redirects, so I replaced them with the
    URLs that were redirected to.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 47ee23f05ac945e5fedf118b8e85af95c5da3276
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Tue Mar 21 13:33:38 2023 -0400

    configure: Do not try to use broken links
    
    The upstream URLs for zlib, PolarSSL, and the TPM emulator do not work
    anymore, so do not attempt to use them.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit e1d75084443f676be681fdaf47585cc9a5f5b820
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Tue Mar 21 13:33:36 2023 -0400

    build: Change remaining xenbits.xen.org link to HTTPS
    
    Obtaining code over an insecure transport is a terrible idea for
    blatently obvious reasons.  Even for non-executable data, insecure
    transports are considered deprecated.
    
    This patch enforces the use of secure transports for all xenbits.xen.org
    URLs.  All altered links have been tested and are known to work.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit eb23eef476bf44f933fcff42e55119473a1d6e19
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Tue Mar 21 13:33:34 2023 -0400

    build: Use HTTPS for all xenbits.xen.org Git repos
    
    Obtaining code over an insecure transport is a terrible idea for
    blatently obvious reasons.  Even for non-executable data, insecure
    transports are considered deprecated.
    
    This patch enforces the use of secure transports for all xenbits git
    repositories.  It was generated with the following shell script:
    
        git ls-files -z |
        xargs -0 -- sed -Ei -- 's@(git://xenbits\.xen\.org|http://xenbits\.xen\.org/git-http)/@https://xenbits.xen.org/git-http/@g'
    
    All altered links have been tested and are known to work.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 79493f2b33eeeccc78db25435181a03f5c46b3e6
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 15 18:24:19 2021 +0100

    xen/trace: Minor code cleanup
    
     * Delete trailing whitespace
     * Replace an opencoded DIV_ROUND_UP()
     * Drop bogus smp_rmb() - spin_lock_irqsave() has full smp_mb() semantics.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 2992f4dcd5e981360cef3fe0e7aef670d5e02eb9
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 15 17:01:43 2021 +0100

    xen/credit2: Remove tail padding from TRC_CSCHED2_* records
    
    All three of these records have tail padding, leaking stack rubble into the
    trace buffer.  Introduce an explicit _pad field and have the compiler zero the
    padding automatically.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

commit 83af664db3366d9c3047abd67655dce1796d005c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 15 16:49:01 2021 +0100

    xen/memory: Remove tail padding from TRC_MEM_* records
    
    Four TRC_MEM_* records supply custom structures with tail padding, leaking
    stack rubble into the trace buffer.  Three of the records were fine in 32-bit
    builds of Xen, due to the relaxed alignment of 64-bit integers, but
    POD_SUPERPAGE_SPLITER was broken right from the outset.
    
    We could pack the datastructures to remove the padding, but xentrace_format
    has no way of rendering the upper half of a 16-bit field.  Instead, expand all
    16-bit fields to 32-bit.
    
    For POD_SUPERPAGE_SPLINTER, introduce an order field as it is relevant
    information, and to match DECREASE_RESERVATION, and so it doesn't require a
    __packed attribute to drop tail padding.
    
    Update xenalyze's structures to match, and introduce xentrace_format rendering
    which was absent previously.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

commit 6835f93573ad282a7cb01a6af9ee5c3add5cb4a8
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Sep 16 10:24:26 2021 +0100

    xen/trace: Don't over-read trace objects
    
    In the case that 'extra' isn't a multiple of uint32_t, the calculation rounds
    the number of bytes up, causing later logic to read unrelated bytes beyond the
    end of the object.
    
    Also, asserting that the object is within TRACE_EXTRA_MAX, but truncating it
    in release builds is rude.  Instead, reject any out-of-spec records, leaving
    enough of a message to identify the faulty caller.
    
    There is one buggy trace record, TRC_RTDS_BUDGET_BURN.  As it must remain
    __packed (as cur_budget is misaligned), change bool has_extratime to uint32_t
    to compensate.
    
    It turns out that the new printk() can also be hit by HVMOP_xentrace, because
    the hypercall is broken.  It cannot be used outside of custom debugging, as
    none of the tooling was ever updated to understand TRC_GUEST, nor is there any
    evidence of hypercall ever being used in public.
    
    While the hypercall was clearly intended to be used with units if uint32_t's,
    that's not how the API/ABI works - Xen will in fact read the entire structure
    rather than the initialised subset out of guest memory (most likely, stack
    rubble), then copy up to 3 bytes of it (rounding up to the next uint32_t) into
    the real tracebuffer.
    
    There are several possible ways to fix this, but as the hypercall, and does
    not plausibly have any users, go with the one that is least logic in Xen, by
    rejecting tracing attempts that are not of uint32_t size.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

