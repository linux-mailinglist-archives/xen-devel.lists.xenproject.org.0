Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C728C7A57FC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 05:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604308.941594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiRgy-0004jv-M5; Tue, 19 Sep 2023 03:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604308.941594; Tue, 19 Sep 2023 03:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiRgy-0004hz-J2; Tue, 19 Sep 2023 03:46:28 +0000
Received: by outflank-mailman (input) for mailman id 604308;
 Tue, 19 Sep 2023 03:46:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiRgw-0004hn-OG; Tue, 19 Sep 2023 03:46:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiRgw-00059C-EY; Tue, 19 Sep 2023 03:46:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiRgw-0002T8-6R; Tue, 19 Sep 2023 03:46:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qiRgw-0002qt-5x; Tue, 19 Sep 2023 03:46:26 +0000
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
	bh=B1HuEpr9aj7DBtjLoTGkldnN7hZiuYnO31xrxn6mbK8=; b=sy+/3zOtMSDelwJgTWYM6dsQ1w
	dcpYKP8BOVIZpdPtbyrH/j4e6f3taqsUL9DgJUCu9F0wq8WLrAbXeoaIYctPBDM/uvx2yo0aYQmIc
	k6GocVf//7AOseu7R5G6CJAxNQDU921TLjmQli15a34Dg60fM7UkzrOI8848qhTG5FHw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183039-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183039: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b5926c6ecf05c28ee99c6248c42d691ccbf0c315
X-Osstest-Versions-That:
    xen=2ea38251eb67639be7aa9d7b64084b1be0230273
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Sep 2023 03:46:26 +0000

flight 183039 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183039/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 183030
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot    fail REGR. vs. 183030

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b5926c6ecf05c28ee99c6248c42d691ccbf0c315
baseline version:
 xen                  2ea38251eb67639be7aa9d7b64084b1be0230273

Last test of basis   183030  2023-09-18 14:02:00 Z    0 days
Testing same since   183031  2023-09-18 17:01:55 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-libvirt                                     fail    


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
commit b5926c6ecf05c28ee99c6248c42d691ccbf0c315
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 30 20:24:25 2023 +0100

    x86/spec-ctrl: Mitigate the Zen1 DIV leakage
    
    In the Zen1 microarchitecure, there is one divider in the pipeline which
    services uops from both threads.  In the case of #DE, the latched result from
    the previous DIV to execute will be forwarded speculatively.
    
    This is an interesting covert channel that allows two threads to communicate
    without any system calls.  In also allows userspace to obtain the result of
    the most recent DIV instruction executed (even speculatively) in the core,
    which can be from a higher privilege context.
    
    Scrub the result from the divider by executing a non-faulting divide.  This
    needs performing on the exit-to-guest paths, and ist_exit-to-Xen.
    
    Alternatives in IST context is believed safe now that it's done in NMI
    context.
    
    This is XSA-439 / CVE-2023-20588.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit de1d265001397f308c5c3c5d3ffc30e7ef8c0705
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 15 12:13:51 2023 +0100

    x86/amd: Introduce is_zen{1,2}_uarch() predicates
    
    We already have 3 cases using STIBP as a Zen1/2 heuristic, and are about to
    introduce a 4th.  Wrap the heuristic into a pair of predicates rather than
    opencoding it, and the explanation of the heuristic, at each usage site.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 3ee6066bcd737756b0990d417d94eddc0b0d2585
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 13 13:53:33 2023 +0100

    x86/spec-ctrl: Issue VERW during IST exit to Xen
    
    There is a corner case where e.g. an NMI hitting an exit-to-guest path after
    SPEC_CTRL_EXIT_TO_* would have run the entire NMI handler *after* the VERW
    flush to scrub potentially sensitive data from uarch buffers.
    
    In order to compensate, issue VERW when exiting to Xen from an IST entry.
    
    SPEC_CTRL_EXIT_TO_XEN already has two reads of spec_ctrl_flags off the stack,
    and we're about to add a third.  Load the field into %ebx, and list the
    register as clobbered.
    
    %r12 has been arranged to be the ist_exit signal, so add this as an input
    dependency and use it to identify when to issue a VERW.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 21bdc25b05a0f8ab6bc73520a9ca01327360732c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 13 12:20:12 2023 +0100

    x86/entry: Track the IST-ness of an entry for the exit paths
    
    Use %r12 to hold an ist_exit boolean.  This register is zero elsewhere in the
    entry/exit asm, so it only needs setting in the IST path.
    
    As this is subtle and fragile, add check_ist_exit() to be used in debugging
    builds to cross-check that the ist_exit boolean matches the entry vector.
    
    Write check_ist_exit() it in C, because it's debug only and the logic more
    complicated than I care to maintain in asm.
    
    For now, we only need to use this signal in the exit-to-Xen path, but some
    exit-to-guest paths happen in IST context too.  Check the correctness in all
    exit paths to avoid the logic bit-rotting.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 7aa28849a1155d856e214e9a80a7e65fffdc3e58
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Sep 13 13:48:16 2023 +0100

    x86/entry: Adjust restore_all_xen to hold stack_end in %r14
    
    All other SPEC_CTRL_{ENTRY,EXIT}_* helpers hold stack_end in %r14.  Adjust it
    for consistency.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 45f00557350dc7d0756551069803fc49c29184ca
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 30 20:11:50 2023 +0100

    x86/spec-ctrl: Improve all SPEC_CTRL_{ENTER,EXIT}_* comments
    
    ... to better explain how they're used.
    
    Doing so highlights that SPEC_CTRL_EXIT_TO_XEN is missing a VERW flush for the
    corner case when e.g. an NMI hits late in an exit-to-guest path.
    
    Leave a TODO, which will be addressed in subsequent patches which arrange for
    VERW flushing to be safe within SPEC_CTRL_EXIT_TO_XEN.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 7125429aafb9e3c9c88fc93001fc2300e0ac2cc8
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 1 11:38:44 2023 +0100

    x86/spec-ctrl: Turn the remaining SPEC_CTRL_{ENTRY,EXIT}_* into asm macros
    
    These have grown more complex over time, with some already having been
    converted.
    
    Provide full Requires/Clobbers comments, otherwise missing at this level of
    indirection.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 694bb0f280fd08a4377e36e32b84b5062def4de2
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Sep 12 17:03:16 2023 +0100

    x86/spec-ctrl: Fold DO_SPEC_CTRL_EXIT_TO_XEN into it's single user
    
    With the SPEC_CTRL_EXIT_TO_XEN{,_IST} confusion fixed, it's now obvious that
    there's only a single EXIT_TO_XEN path.  Fold DO_SPEC_CTRL_EXIT_TO_XEN into
    SPEC_CTRL_EXIT_TO_XEN to simplify further fixes.
    
    When merging labels, switch the name to .L\@_skip_sc_msr as "skip" on its own
    is going to be too generic shortly.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 1c18d73774533a55ba9d1cbee8bdace03efdb5e7
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Sep 12 15:06:49 2023 +0100

    x86/spec-ctrl: Fix confusion between SPEC_CTRL_EXIT_TO_XEN{,_IST}
    
    c/s 3fffaf9c13e9 ("x86/entry: Avoid using alternatives in NMI/#MC paths")
    dropped the only user, leaving behind the (incorrect) implication that Xen had
    split exit paths.
    
    Delete the unused SPEC_CTRL_EXIT_TO_XEN and rename SPEC_CTRL_EXIT_TO_XEN_IST
    to SPEC_CTRL_EXIT_TO_XEN for consistency.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

