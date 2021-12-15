Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3008475748
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 12:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247332.426472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxS3f-0002h7-6q; Wed, 15 Dec 2021 11:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247332.426472; Wed, 15 Dec 2021 11:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxS3f-0002f8-32; Wed, 15 Dec 2021 11:02:51 +0000
Received: by outflank-mailman (input) for mailman id 247332;
 Wed, 15 Dec 2021 11:02:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxS3d-0002ey-Fa; Wed, 15 Dec 2021 11:02:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxS3c-0001gl-G9; Wed, 15 Dec 2021 11:02:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxS3c-0000bF-8K; Wed, 15 Dec 2021 11:02:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mxS3c-0003Yo-7s; Wed, 15 Dec 2021 11:02:48 +0000
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
	bh=25DTJbVRP8gtnznZQuG0w8y+8aRb6pZArL6ItBRUi+4=; b=V05TXT3Avrv+qjFHA7q46bKBdr
	NEZU9+nrNdRQ1+y0n3H8Fylaux/Pfby4GiIPeQOYNtLMAPGRbuREydPM92R3296N/OyW41Fi0hTBG
	PTNjBww1bIIKKC5jRIHMW8F1IoUAYxRKuJ/IBvq79RI14ACSWFkR1zD9YPRofjFI4LHI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167428-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167428: regressions - ALL FAIL
X-Osstest-Failures:
    xen-unstable-coverity:coverity-amd64:coverity-upload:fail:regression
X-Osstest-Versions-This:
    xen=249e0f1d8f203188ccdcced5a05c2149739e1566
X-Osstest-Versions-That:
    xen=df3e1a5efe700a9f59eced801cac73f9fd02a0e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Dec 2021 11:02:48 +0000

flight 167428 xen-unstable-coverity real [real]
flight 167430 xen-unstable-coverity real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167428/
http://logs.test-lab.xenproject.org/osstest/logs/167430/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                7 coverity-upload          fail REGR. vs. 167384

version targeted for testing:
 xen                  249e0f1d8f203188ccdcced5a05c2149739e1566
baseline version:
 xen                  df3e1a5efe700a9f59eced801cac73f9fd02a0e2

Last test of basis   167384  2021-12-12 09:20:52 Z    3 days
Testing same since   167428  2021-12-15 09:21:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Paul Durrant <paul@xen.org>

jobs:
 coverity-amd64                                               fail    


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
commit 249e0f1d8f203188ccdcced5a05c2149739e1566
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Dec 13 20:33:42 2021 +0000

    x86/cpuid: Fix TSXLDTRK definition
    
    TSXLDTRK lives in CPUID leaf 7[0].edx, not 7[0].ecx.
    
    Bit 16 in ecx is LA57.
    
    Fixes: a6d1b558471f ("x86emul: support X{SUS,RES}LDTRK")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 1382241fe880d48e109f2056cec052bb3919a9d1
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Dec 14 09:50:07 2021 +0100

    perfc: drop calls_to_multicall performance counter
    
    The calls_to_multicall performance counter is basically redundant to
    the multicall hypercall counter. The only difference is the counting
    of continuation calls, which isn't really that interesting.
    
    Drop the calls_to_multicall performance counter.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 668dd44902bbaf52f8e7214e0da060b6ec962e88
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Dec 14 09:49:23 2021 +0100

    x86/perfc: add hypercall performance counters for hvm, correct pv
    
    The HVM hypercall handler is missing incrementing the per hypercall
    counters. Add that.
    
    The counters for PV are handled wrong, as they are not using
    perf_incra() with the number of the hypercall as index, but are
    incrementing the first hypercall entry (set_trap_table) for each
    hypercall. Fix that.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 7b99e7258559c9caa235d9faf323b22c68e4a581
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 14 09:48:17 2021 +0100

    x86emul: drop "seg" parameter from insn_fetch() hook
    
    This is specified (and asserted for in a number of places) to always be
    CS. Passing this as an argument in various places is therefore
    pointless. The price to pay is two simple new functions, with the
    benefit of the PTWR case now gaining a more appropriate error code.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Paul Durrant <paul@xen.org>

commit c49ee0329ff3de98722fd74ed5ba6d9665701e54
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 14 09:47:31 2021 +0100

    SUPPORT.md: limit security support for hosts with very much memory
    
    Sufficient and in particular regular testing on very large hosts cannot
    currently be guaranteed. Anyone wanting us to support larger hosts is
    free to propose so, but will need to supply not only test results, but
    also a test plan.
    
    This is a follow-up to XSA-385.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 53ed194539ddbea4f6aecb1b7c2f33aa8c0201d9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 14 09:46:48 2021 +0100

    x86/monitor: don't open-code hvm_has_set_descriptor_access_exiting()
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed by: Alexandru Isaila <aisaila@bitdefender.com>

commit 7dc0233f534f64e7f3ee71e74e05dd5ab8a24808
Author: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Date:   Tue Dec 14 09:44:44 2021 +0100

    vpci: fix function attributes for vpci_process_pending
    
    vpci_process_pending is defined with different attributes, e.g.
    with __must_check if CONFIG_HAS_VPCI enabled and not otherwise.
    Fix this by defining both of the definitions with __must_check.
    
    Fixes: 14583a590783 ("7fbb096bf345 kconfig: don't select VPCI if building a shim-only binary")
    Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit d828caa9aeee80c59a35f662f875f6573e9b532f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Dec 13 17:50:48 2021 +0000

    tools/libfsimage: Fix SONAME
    
    This gets missed on each release.  Follow the same example as libs.mk and pick
    the version up dynamically.
    
    Fixes: a5706b80f42e ("Set version to 4.17: rerun autogen.sh")
    Suggested-by: Anthony PERARD <anthony.perard@citrix.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
(qemu changes not included)

