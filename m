Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B1A2F8557
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 20:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68566.122735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0UjB-0003pl-JN; Fri, 15 Jan 2021 19:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68566.122735; Fri, 15 Jan 2021 19:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0UjB-0003pH-Et; Fri, 15 Jan 2021 19:25:45 +0000
Received: by outflank-mailman (input) for mailman id 68566;
 Fri, 15 Jan 2021 19:25:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0UjA-0003p9-Gf; Fri, 15 Jan 2021 19:25:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0UjA-0002n8-6H; Fri, 15 Jan 2021 19:25:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Uj9-0002vK-Tv; Fri, 15 Jan 2021 19:25:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Uj9-0000Nx-TR; Fri, 15 Jan 2021 19:25:43 +0000
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
	bh=Z21T1wBPmqmxxb1HwJvPmWcy4P+EiqQnvYhR7+3jJqM=; b=UXyhM2rLIE6zLOEnrsQgASREwr
	Cn38FTMr0PcZ7vrwrD0QssiRfWoqlDFrne7FF0vMQAx5Lt1kdEjMsU2xBVbni9yNPlAfuaYulYeFB
	VpVuk5BP+j9ISfG5iG9fMUX6Xho2fjTf0HNv7+kgbgt+IWslTToWERUNRwYovRwugyHs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158440-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158440: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=cc83ee4c6c3790dd98a91cc0d34162dab067bca7
X-Osstest-Versions-That:
    xen=8868a0e3f67436a5fbee750624e24a6533357f52
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 Jan 2021 19:25:43 +0000

flight 158440 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158440/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 158434
 build-armhf                   6 xen-build                fail REGR. vs. 158434

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  cc83ee4c6c3790dd98a91cc0d34162dab067bca7
baseline version:
 xen                  8868a0e3f67436a5fbee750624e24a6533357f52

Last test of basis   158434  2021-01-15 12:01:25 Z    0 days
Testing same since   158438  2021-01-15 16:00:25 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Manuel Bouyer <bouyer@netbsd.org>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
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
commit cc83ee4c6c3790dd98a91cc0d34162dab067bca7
Author: Manuel Bouyer <bouyer@netbsd.org>
Date:   Tue Jan 12 19:12:22 2021 +0100

    NetBSD: Fix lock directory path
    
    On NetBSD the lock directory is in /var/run/
    
    Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 36457d76ec11df9a798809f4bac3cddd76764158
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jan 15 16:05:03 2021 +0100

    Arm: don't hard-code grant table limits in create_domUs()
    
    I can only assume that f2ae59bc4b9b ("Rationalize max_grant_frames and
    max_maptrack_frames handling") unintentionally left Arm's create_domUs()
    set limits to explicit values, as at least some of the same constraints
    apply here.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit ced9795c6cb4165b6d231a732e5351933dbd8b38
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jan 15 16:03:56 2021 +0100

    mm: split out mfn_t / gfn_t / pfn_t definitions and helpers
    
    xen/mm.h has heavy dependencies, while in a number of cases only these
    type definitions are needed. This separation then also allows pulling in
    these definitions when including xen/mm.h would cause cyclic
    dependencies.
    
    Replace xen/mm.h inclusion where possible in include/xen/. (In
    xen/iommu.h also take the opportunity and correct the few remaining
    sorting issues.)
    
    While the change could be dropped, remove an unnecessary asm/io.h
    inclusion from xen/arch/x86/acpi/power.c. This was the initial attempt
    to address build issues with it, until it became clear that the header
    itself needs adjustment.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jan 15 16:02:13 2021 +0100

    include: don't use asm/page.h from common headers
    
    Doing so limits what can be done in (in particular included by) this per-
    arch header. Abstract out page shift/size related #define-s, which is all
    the respective headers care about. Extend the replacement / removal to
    some x86 headers as well; some others now need to include page.h (and
    they really should have before).
    
    Arm's VADDR_BITS gets dropped altogether: Its current value is clearly
    wrong for 64-bit, but the constant also isn't used anywhere right now.
    
    While Arm used vaddr_t in PAGE_OFFSET(), this use is compatible with
    that of unsigned long in the new common implementation.
    
    Also drop the dead PAGE_FLAG_MASK at this occasion.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

