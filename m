Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8690FB28
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 04:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744103.1151123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK76d-0003h6-Du; Thu, 20 Jun 2024 02:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744103.1151123; Thu, 20 Jun 2024 02:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK76d-0003fb-Ah; Thu, 20 Jun 2024 02:00:55 +0000
Received: by outflank-mailman (input) for mailman id 744103;
 Thu, 20 Jun 2024 02:00:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK76c-0003fR-51; Thu, 20 Jun 2024 02:00:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK76b-0002n7-PM; Thu, 20 Jun 2024 02:00:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK76b-0005bD-Bz; Thu, 20 Jun 2024 02:00:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sK76b-00052Q-Bd; Thu, 20 Jun 2024 02:00:53 +0000
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
	bh=WKtVsefQ5uQvuHYTWQPr+hwVXuI24rRuw35DnVcArzc=; b=Iw956kl9glPGzcW0KxFyT5gq0g
	YM1YKlL/aj29gSWwPqb3ngGfgsmrMMnh9rUI4bw/1P68NUm17d/pWaVfO2nYu+gYmKh/a+nDfw9D9
	PGXGUY4nKy1/PKRgZ/Yu86qR7idCgOM940Oi46kcirp6yvK80iHTpBkh9IsHsy84i8hc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186420-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186420: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=43d5c5d5f70b3f5419e7ef30399d23adf6ddfa8e
X-Osstest-Versions-That:
    xen=efa6e9f15ba943d154e8d7b29384581915b2aacd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jun 2024 02:00:53 +0000

flight 186420 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186420/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 186411

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  43d5c5d5f70b3f5419e7ef30399d23adf6ddfa8e
baseline version:
 xen                  efa6e9f15ba943d154e8d7b29384581915b2aacd

Last test of basis   186411  2024-06-19 12:00:22 Z    0 days
Testing same since   186412  2024-06-19 15:03:58 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
commit 43d5c5d5f70b3f5419e7ef30399d23adf6ddfa8e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jun 19 14:11:07 2024 +0200

    xen: avoid UB in guest handle arithmetic
    
    At least XENMEM_memory_exchange can have huge values passed in the
    nr_extents and nr_exchanged fields. Adding such values to pointers can
    overflow, resulting in UB. Cast respective pointers to "unsigned long"
    while at the same time making the necessary multiplication explicit.
    Remaining arithmetic is, despite there possibly being mathematical
    overflow, okay as per the C99 spec: "A computation involving unsigned
    operands can never overflow, because a result that cannot be represented
    by the resulting unsigned integer type is reduced modulo the number that
    is one greater than the largest value that can be represented by the
    resulting type." The overflow that we need to guard against is checked
    for in array_access_ok().
    
    Note that in / down from array_access_ok() the address value is only
    ever cast to "unsigned long" anyway, which is why in the invocation from
    guest_handle_subrange_okay() the value doesn't need casting back to
    pointer type.
    
    In compat grant table code change two guest_handle_add_offset() to avoid
    passing in negative offsets.
    
    Since {,__}clear_guest_offset() need touching anyway, also deal with
    another (latent) issue there: They were losing the handle type, i.e. the
    size of the individual objects accessed. Luckily the few users we
    presently have all pass char or uint8 handles.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 267122a24c499d26278ab2dbdfb46ebcaaf38474
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Apr 30 16:14:36 2021 +0100

    x86/defns: Clean up X86_{XCR0,XSS}_* constants
    
    With the exception of one case in read_bndcfgu() which can use ilog2(),
    the *_POS defines are unused.  Drop them.
    
    X86_XCR0_X87 is the name used by both the SDM and APM, rather than
    X86_XCR0_FP.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 71cacfb035f4a78ee10970dc38a3baa04d387451
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Apr 30 20:17:55 2021 +0100

    x86/cpuid: Fix handling of XSAVE dynamic leaves
    
    First, if XSAVE is available in hardware but not visible to the guest, the
    dynamic leaves shouldn't be filled in.
    
    Second, the comment concerning XSS state is wrong.  VT-x doesn't manage
    host/guest state automatically, but there is provision for "host only" bits to
    be set, so the implications are still accurate.
    
    Introduce xstate_compressed_size() to mirror the uncompressed one.  Cross
    check it at boot.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit fdb7e77fea4cb1c98dc51dd891a47f7e94612ad4
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Apr 30 20:17:55 2021 +0100

    x86/cpu-policy: Simplify recalculate_xstate()
    
    Make use of xstate_uncompressed_size() helper rather than maintaining the
    running calculation while accumulating feature components.
    
    The rest of the CPUID data can come direct from the raw cpu policy.  All
    per-component data form an ABI through the behaviour of the X{SAVE,RSTOR}*
    instructions.
    
    Use for_each_set_bit() rather than opencoding a slightly awkward version of
    it.  Mask the attributes in ecx down based on the visible features.  This
    isn't actually necessary for any components or attributes defined at the time
    of writing (up to AMX), but is added out of an abundance of caution.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit df09dfb94de66f7523837c050616a382aa2c7d17
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Apr 30 20:17:55 2021 +0100

    x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
    
    We're soon going to need a compressed helper of the same form.
    
    The size of the uncompressed image depends on the single element with the
    largest offset + size.  Sadly this isn't always the element with the largest
    index.
    
    Name the per-xstate-component cpu_policy struture, for legibility of the logic
    in xstate_uncompressed_size().  Cross-check with hardware during boot, and
    remove hw_uncompressed_size().
    
    This means that the migration paths don't need to mess with XCR0 just to
    sanity check the buffer size.  It also means we can drop the "fastpath" check
    against xfeature_mask (there to skip some XCR0 writes); this path is going to
    be dead logic the moment Xen starts using supervisor states itself.
    
    The users of hw_uncompressed_size() in xstate_init() can (and indeed need) to
    be replaced with CPUID instructions.  They run with feature_mask in XCR0, and
    prior to setup_xstate_features() on the BSP.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit a09022a09e1a79b3f9574993993bfad803b32596
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu May 23 00:55:34 2024 +0100

    x86/boot: Collect the Raw CPU Policy earlier on boot
    
    This is a tangle, but it's a small step in the right direction.
    
    In the following change, xstate_init() is going to start using the Raw policy.
    
    calculate_raw_cpu_policy() is sufficiently separate from the other policies to
    safely move like this.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit d31a111940de5431c8bf465b1d38b89f1130a24b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Feb 21 17:56:57 2020 +0000

    x86/xstate: Cross-check dynamic XSTATE sizes at boot
    
    Right now, xstate_ctxt_size() performs a cross-check of size with CPUID in for
    every call.  This is expensive, being used for domain create/migrate, as well
    as to service certain guest CPUID instructions.
    
    Instead, arrange to check the sizes once at boot.  See the code comments for
    details.  Right now, it just checks hardware against the algorithm
    expectations.  Later patches will cross-check Xen's XSTATE calculations too.
    
    Introduce more X86_XCR0_* and X86_XSS_* constants CPUID bits.  This is to
    maximise coverage in the sanity check, even if we don't expect to
    use/virtualise some of these features any time soon.  Leave HDC and HWP alone
    for now; we don't have CPUID bits from them stored nicely.
    
    Only perform the cross-checks when SELF_TESTS are active.  It's only
    developers or new hardware liable to trip these checks, and Xen at least
    tracks "maximum value ever seen in xcr0" for the lifetime of the VM, which we
    don't want to be tickling in the general case.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 9e6dbbe8bf400aacb99009ddffa91d2a0c312b39
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed May 22 17:23:54 2024 +0100

    x86/xstate: Fix initialisation of XSS cache
    
    The clobbering of this_cpu(xcr0) and this_cpu(xss) to architecturally invalid
    values is to force the subsequent set_xcr0() and set_msr_xss() to reload the
    hardware register.
    
    While XCR0 is reloaded in xstate_init(), MSR_XSS isn't.  This causes
    get_msr_xss() to return the invalid value, and logic of the form:
    
        old = get_msr_xss();
        set_msr_xss(new);
        ...
        set_msr_xss(old);
    
    to try and restore said invalid value.
    
    The architecturally invalid value must be purged from the cache, meaning the
    hardware register must be written at least once.  This in turn highlights that
    the invalid value must only be used in the case that the hardware register is
    available.
    
    Fixes: f7f4a523927f ("x86/xstate: reset cached register values on resume")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit aba98c8d671bd290e978ec154d0baf042e093a65
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 14 13:05:40 2024 +0100

    xen/arch: Centralise __read_mostly and __ro_after_init
    
    These living in cache.h is inherited from Linux, but cache.h is not a terribly
    appropriately location for them to live.
    
    __read_mostly is an optimisation related to data placement in order to avoid
    having shared data in cachelines that are likely to be written to, but it
    really is just a section of the linked image separating data by usage
    patterns; it has nothing to do with cache sizes or flushing logic.
    
    Worse, __ro_after_init was only in xen/cache.h because __read_mostly was in
    arch/cache.h, and has literally nothing whatsoever to do with caches.
    
    Move the definitions into xen/sections.h, which in particular means that
    RISC-V doesn't need to repeat the problematic pattern.  Take the opportunity
    to provide a short descriptions of what these are used for.
    
    For now, leave TODO comments next to the other identical definitions.  It
    turns out that unpicking cache.h is more complicated than it appears because a
    number of files use it for transitive dependencies.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 82f480944718d9e8340a6ac1af41ece7851115bf
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 18 13:48:35 2024 +0100

    xen/irq: Address MISRA Rule 8.3 violation
    
    When centralising irq_ack_none(), different architectures had different names
    for the parameter.  As it's type is struct irq_desc *, it should be named
    desc.  Make this consistent.
    
    No functional change.
    
    Fixes: 8aeda4a241ab ("arch/irq: Make irq_ack_none() mandatory")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
(qemu changes not included)

