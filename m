Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B354511C6A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 18:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315285.533753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkgh-0001EX-Q6; Wed, 27 Apr 2022 16:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315285.533753; Wed, 27 Apr 2022 16:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkgh-0001Bv-NE; Wed, 27 Apr 2022 16:38:47 +0000
Received: by outflank-mailman (input) for mailman id 315285;
 Wed, 27 Apr 2022 16:38:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njkgg-0001Bl-04; Wed, 27 Apr 2022 16:38:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njkgf-00026P-UP; Wed, 27 Apr 2022 16:38:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njkgf-0001aT-5f; Wed, 27 Apr 2022 16:38:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1njkgf-0003L0-5D; Wed, 27 Apr 2022 16:38:45 +0000
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
	bh=/XOwyAwDuWYdDl01EHnYRYEeWFe1AQ38zgGgSUuj0lQ=; b=gAaMDkIOLN1uB/V+JwQoKWqMXp
	d31WN1MbiNEZKqnTq4EJe+FK5w5XPwiYZ/01TGL1ecEV8zDUUcx2sQn8IBD3R6DD8IOK0Ft9oWt5m
	sO9Yrw2yd7EOv7wBBJNgKe9Q/giJALmpeTh5gp7F2C3VB8EFO2cmt8/lMwYepwtsV+b0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169781-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169781: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
X-Osstest-Versions-That:
    xen=163071b1800304c962756789b4ef0ddb978059ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Apr 2022 16:38:45 +0000

flight 169781 xen-unstable-smoke real [real]
flight 169785 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169781/
http://logs.test-lab.xenproject.org/osstest/logs/169785/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 169773

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
baseline version:
 xen                  163071b1800304c962756789b4ef0ddb978059ba

Last test of basis   169773  2022-04-27 08:01:54 Z    0 days
Testing same since   169781  2022-04-27 12:01:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Vrabel <dvrabel@amazon.co.uk>
  Julien Grall <jgrall@amazon.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
commit fa6dc0879ffd3dffffaea2837953c7a8761a9ba0
Author: David Vrabel <dvrabel@amazon.co.uk>
Date:   Tue Apr 26 10:33:01 2022 +0200

    page_alloc: assert IRQs are enabled in heap alloc/free
    
    Heap pages can only be safely allocated and freed with interrupts
    enabled as they may require a TLB flush which may send IPIs (on x86).
    
    Normally spinlock debugging would catch calls from the incorrect
    context, but not from stop_machine_run() action functions as these are
    called with spin lock debugging disabled.
    
    Enhance the assertions in alloc_xenheap_pages() and
    alloc_domheap_pages() to check interrupts are enabled. For consistency
    the same asserts are used when freeing heap pages.
    
    As an exception, when only 1 PCPU is online, allocations are permitted
    with interrupts disabled as any TLB flushes would be local only. This
    is necessary during early boot.
    
    Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit fbd2445558beff90eb9607308f0845b18a7a2b5a
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Apr 26 21:06:29 2022 +0100

    xen/arm: alternative: Don't call vmap() within stop_machine_run()
    
    Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
    alloc/free" extended the checks in the buddy allocator to catch
    any use of the helpers from context with interrupts disabled.
    
    Unfortunately, the rule is not followed in the alternative code and
    this will result to crash at boot with debug enabled:
    
    (XEN) Xen call trace:
    (XEN)    [<0022a510>] alloc_xenheap_pages+0x120/0x150 (PC)
    (XEN)    [<00000000>] 00000000 (LR)
    (XEN)    [<002736ac>] arch/arm/mm.c#xen_pt_update+0x144/0x6e4
    (XEN)    [<002740d4>] map_pages_to_xen+0x10/0x20
    (XEN)    [<00236864>] __vmap+0x400/0x4a4
    (XEN)    [<0026aee8>] arch/arm/alternative.c#__apply_alternatives_multi_stop+0x144/0x1ec
    (XEN)    [<0022fe40>] stop_machine_run+0x23c/0x300
    (XEN)    [<002c40c4>] apply_alternatives_all+0x34/0x5c
    (XEN)    [<002ce3e8>] start_xen+0xcb8/0x1024
    (XEN)    [<00200068>] arch/arm/arm32/head.o#primary_switched+0xc/0x1c
    
    The interrupts will be disabled by the state machine in stop_machine_run(),
    hence why the ASSERT is hit.
    
    For now the patch extending the checks has been reverted, but it would
    be good to re-introduce it (allocation with interrupts disabled is not
    desirable).
    
    So move the re-mapping of Xen to the caller of stop_machine_run().
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Cc: David Vrabel <dvrabel@amazon.co.uk>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

