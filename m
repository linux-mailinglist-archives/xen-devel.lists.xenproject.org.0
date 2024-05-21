Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F00B8CA725
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 05:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726482.1130761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9GV0-0008WP-4u; Tue, 21 May 2024 03:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726482.1130761; Tue, 21 May 2024 03:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9GV0-0008Un-29; Tue, 21 May 2024 03:49:14 +0000
Received: by outflank-mailman (input) for mailman id 726482;
 Tue, 21 May 2024 03:49:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9GUy-0008Ud-BY; Tue, 21 May 2024 03:49:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9GUy-0001JT-62; Tue, 21 May 2024 03:49:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9GUx-0003fF-SO; Tue, 21 May 2024 03:49:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s9GUx-00028n-Rx; Tue, 21 May 2024 03:49:11 +0000
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
	bh=UW9T21fOHhSL4xmDBcuSEio2u4DulyZTDdbaTl6QsQw=; b=IZIqeNugImrs6WqbhzXNxzEbBf
	W/Y1ENrw90vdRskogvofwwVwtfFoGgpu1FAY4ZlAdjxLSNFu2O3MeHiHpK4XkVSnYwLrZAlhaA8be
	snw14KfbguMv8j/9mK4GZtS9RS8NrTxwvnv9iqTIekN7p1S3K061Tj+YnOqGt30sWE54=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186050-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186050: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9c5444b01ad51369bc09197a442a93d87b4b76f2
X-Osstest-Versions-That:
    xen=26b122e3bf8f3921d87312fbf5e7e13872ae92b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 May 2024 03:49:11 +0000

flight 186050 xen-unstable-smoke real [real]
flight 186053 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186050/
http://logs.test-lab.xenproject.org/osstest/logs/186053/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 186048

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9c5444b01ad51369bc09197a442a93d87b4b76f2
baseline version:
 xen                  26b122e3bf8f3921d87312fbf5e7e13872ae92b0

Last test of basis   186048  2024-05-20 18:02:09 Z    0 days
Testing same since   186050  2024-05-20 22:02:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
commit 9c5444b01ad51369bc09197a442a93d87b4b76f2
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Sep 20 13:40:21 2021 +0100

    xen/trace: Drop old trace API
    
    With all users updated to the new API, drop the old API.  This includes all of
    asm/hvm/trace.h, which allows us to drop some includes.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>

commit aa60520cd37f0f81cec543af37b89c342e915dbd
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Sep 21 19:55:47 2021 +0100

    xen/trace: Removal final {__,}trace_var() users in favour of the new API
    
    The cycles parameter (which gets removed as a consequence) determines whether
    trace() or trace_time() is used.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>

commit 26da08059eef35e6ce1a308dbe276e8ef6a6c5b1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Sat Sep 18 00:31:27 2021 +0100

    xen: Switch to new TRACE() API
    
    (Almost) no functional change.
    
     * In irq_move_cleanup_interrupt(), use the 'me' local variable rather than
       calling smp_processor_id() again.  This manifests as a minor code
       improvement.
     * In vlapic_update_timer() and lapic_rearm(), introduce a new 'timer_period'
       local variable to simplify the expressions used for both the trace and
       create_periodic_time() calls.
    
    All other differences in the compiled binary are to do with line numbers
    changing.
    
    Some conversion notes:
     * HVMTRACE_LONG_[234]D() and TRACE_2_LONG_[234]D() were latently buggy.  They
       blindly discard extra parameters, but luckily no users are impacted.  They
       are also obfuscated wrappers, depending on exactly one or two parameters
       being TRC_PAR_LONG() to compile successfully.
     * HVMTRACE_LONG_1D() behaves unlike its named companions, and takes exactly
       one 64bit parameter which it splits manually.  It's one user,
       vmx_cr_access()'s LMSW path, is gets adjusted.
     * TRACE_?D() and TRACE_2_LONG_*() change to TRACE_TIME() as cycles is always
       enabled.
     * HVMTRACE_ND() is opencoded for VMENTRY/VMEXIT records to include cycles.
       These are converted to TRACE_TIME(), with the old modifier parameter
       expressed as an OR at the callsite.  One callsite, svm_vmenter_helper() had
       a nested tb_init_done check, which is dropped.  (The optimiser also spotted
       this, which is why it doesn't manifest as a binary difference.)
     * All uses of *LONG() are either opencoded or swapped to using a struct, to
       avoid MISRA issues.
     * All HVMTRACE_?D() change to TRACE() as cycles is explicitly skipped.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>

commit d64693df1ab98f5278cf32ab3e0c12295237c42b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Sep 20 14:07:43 2021 +0100

    xen/sched: Clean up trace handling
    
    There is no need for bitfields anywhere - use more sensible types.  There is
    also no need to cast 'd' to (unsigned char *) before passing it to a function
    taking void *.  Switch to new trace_time() API.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>

commit df50666449a4ef0bc28f3118dc8adf1ecf5ba4a1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 17 16:28:19 2021 +0100

    xen/rt: Clean up trace handling
    
    Most uses of bitfields and __packed are unnecessary.  There is also no need to
    cast 'd' to (unsigned char *) before passing it to a function taking void *.
    Switch to new trace_time() API.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>

commit ab8bc198507de47429e0b06dfd4e31c0d9461a34
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 15 17:01:43 2021 +0100

    xen/credit2: Clean up trace handling
    
    There is no need for bitfields anywhere - use types with an explicit width
    instead.  There is also no need to cast 'd' to (unsigned char *) before
    passing it to a function taking void *.  Switch to new trace_time() API.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

commit e978b462ec9a74ec90788fca0b9d37707e1f79c4
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Sep 20 13:36:12 2021 +0100

    xen/trace: Introduce new API
    
    trace() and trace_time(), in function form for struct arguments, and macro
    form for simple uint32_t list arguments.
    
    This will be used to clean up the mess of macros which exists throughout the
    codebase, as well as eventually dropping __trace_var().
    
    There is intentionally no macro to split a 64-bit parameter in the new API,
    for MISRA reasons.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: George Dunlap <george.dunlap@cloud.com>
(qemu changes not included)

