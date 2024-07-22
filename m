Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44063938DD5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761663.1171665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqpA-0002Sr-9i; Mon, 22 Jul 2024 11:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761663.1171665; Mon, 22 Jul 2024 11:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqpA-0002QE-74; Mon, 22 Jul 2024 11:03:24 +0000
Received: by outflank-mailman (input) for mailman id 761663;
 Mon, 22 Jul 2024 11:03:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVqp9-0002Q1-Ht; Mon, 22 Jul 2024 11:03:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVqp9-0004G3-9A; Mon, 22 Jul 2024 11:03:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sVqp8-0000NH-R6; Mon, 22 Jul 2024 11:03:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sVqp8-0001ra-Qk; Mon, 22 Jul 2024 11:03:22 +0000
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
	bh=Z14KLS4z6ZTPXKrgv0G6WBKPYIlmf4nRM2rVbbYQcfg=; b=6SyZoblHgFj1MowsuV+FOb/ZDV
	OAdJ3XlEYN4bc18OHjocqnGo5W3VEmRS1f4ok37YNhrHFU2FEVM8qDSWZtH0gR10LPPK5ijRXT1NY
	iPrs5k7TBcuvyqaNQbb3mW8nM/93XPpJk3TG4J4cypocvUh4qEbxOGqpsyO84oljlzhg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186935-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186935: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c674c77f69684bfa57e3c61d6dbf404c13953f34
X-Osstest-Versions-That:
    xen=e5182b40cf4bbb89292d66b8f3047a9ee913a90a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Jul 2024 11:03:22 +0000

flight 186935 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186935/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 186913

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c674c77f69684bfa57e3c61d6dbf404c13953f34
baseline version:
 xen                  e5182b40cf4bbb89292d66b8f3047a9ee913a90a

Last test of basis   186913  2024-07-19 14:00:22 Z    2 days
Testing same since   186935  2024-07-22 08:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergiy Kibrik <Sergiy_Kibrik@epam.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Victor Lira <victorm.lira@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
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
commit c674c77f69684bfa57e3c61d6dbf404c13953f34
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jul 22 09:41:03 2024 +0200

    x86: don't open-code [gm]fn_to_[gm]addr()
    
    At least in pure address calculation use the intended basic construct
    instead of opend-coded left-shifting by PAGE_SHIFT. Leave alone page
    table entry calculations for now, as those aren't really calculating
    addresses.
    
    No functional change.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 8d5dc7d7df92d8d7f9450cee0bab57dceefa26c5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jul 22 09:40:24 2024 +0200

    x86/mm: drop gfn_to_paddr()
    
    This really is gfn_to_gaddr() in disguise; no need to have two variants
    of the same logic.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 0e3642514719c0659f2af44b1bbe8aba63d4a2ed
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jul 22 09:39:40 2024 +0200

    x86: drop REX64_PREFIX
    
    While we didn't copy the full Linux commentary, Linux commit
    7180d4fb8308 ("x86_64: Fix 64bit FXSAVE encoding") is quite explicit
    about gas 2.16 supporting FXSAVEQ / FXRSTORQ. As that's presently our
    minimal required version, we can drop the workaround that was needed for
    yet older gas.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit af67ae49ce8f7298bf52345558490013a9d044b3
Author: Tamas K Lengyel <tamas@tklengyel.com>
Date:   Mon Jul 22 09:38:28 2024 +0200

    Add libfuzzer target to fuzz/x86_instruction_emulator
    
    This target enables integration into oss-fuzz. Changing invalid input return
    to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
    missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
    build.
    
    Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 4b09c30b0f778160523045396f7fff631a24bc1c
Author: Victor Lira <victorm.lira@amd.com>
Date:   Mon Jul 22 09:37:45 2024 +0200

    common/sched: address a violation of MISRA C Rule 8.7
    
    Rule 8.7: "Functions and objects should not be defined with external
    linkage if they are referenced in only one translation unit".
    
    This patch fixes this by adding the static specifier.
    No functional changes.
    
    Reported-by: Stewart Hildebrand stewart.hildebrand@amd.com
    Signed-off-by: Victor Lira <victorm.lira@amd.com>
    Acked-by: George Dunlap <george.dunlap@cloud.com>

commit c1059b4799d4ce3378b6722e01d66422f0b63977
Author: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Date:   Mon Jul 22 09:37:11 2024 +0200

    public/sysctl: address violations of MISRA C: 2012 Rule 7.3
    
    This addresses violations of MISRA C:2012 Rule 7.3 which states as
    following: The lowercase character `l' shall not be used in a literal
    suffix.
    
    Changed moreover suffixes 'u' in 'U' for better readability next to
    the 'L's.
    
    No functional change.
    
    Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit d3029dba8e13b36adc0a513581850bbc9b51feda
Author: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Date:   Mon Jul 22 09:36:35 2024 +0200

    x86/cpufreq: clean up stale powernow_cpufreq_init()
    
    Remove useless declaration, eliminating a MISRA C:2012 Rule 8.6
    violation: The routine itself was removed by following commit long time
    ago:
    
       222013114 x86: Fix RevF detection in powernow.c
    
    No functional change.
    
    Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 8c000b8fd3caf9c1ff615fc15429e13271b26849
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Jul 22 09:36:21 2024 +0200

    SUPPORT.md: update Xen version
    
    Update the Xen version to 4.20
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 7b6c1ba3b1c98dc17d076e058260167449a334b0
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Jul 22 09:36:09 2024 +0200

    MAINTAINERS: drop CPU POOLS section
    
    The CPU POOLS sections in MAINTAINERS can be dropped, as the SCHEDULING
    section has the same maintainers and it is covering the CPU POOLS files
    as well.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 820034ef91675517901f48da2f26b77146b07a73
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jul 22 09:35:42 2024 +0200

    MAINTAINERS: drop separate x86/mm section
    
    Let the subtree fall under general x86 maintainership instead, then also
    properly reflecting Roger's role there.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

