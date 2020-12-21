Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B52DFF01
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 18:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57474.100578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krP4p-00055L-JQ; Mon, 21 Dec 2020 17:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57474.100578; Mon, 21 Dec 2020 17:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krP4p-00054q-Dy; Mon, 21 Dec 2020 17:34:31 +0000
Received: by outflank-mailman (input) for mailman id 57474;
 Mon, 21 Dec 2020 17:34:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krP4o-00054i-4c; Mon, 21 Dec 2020 17:34:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krP4o-00029i-0t; Mon, 21 Dec 2020 17:34:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krP4n-0005gF-Os; Mon, 21 Dec 2020 17:34:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1krP4n-0005T5-Ns; Mon, 21 Dec 2020 17:34:29 +0000
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
	bh=OzPBTuUtX6LSWGi9pHe+D+Z4zqDl14AewGVG49VXnPg=; b=qYXCSw5wZusMRP/19eNJLBcdIz
	cmDQfYfJ1zsyeNaUKrTZ0KhnOM0kk3IxLIVdg/3gPfsf5FzywYOjPi/7H/gg2cphX191FuK3d41Sj
	TvgUWEtUxXucwS216razt+9XtCyPDMb0ig3BZNaa/IEtlphynHJ9yQhWcfBJzDHfBQdY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157761-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 157761: regressions - FAIL
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
    xen=d162f36848c4a98a782cc05820b0aa7ec1ae297d
X-Osstest-Versions-That:
    xen=357db96a66e47e609c3b14768f1062e13eedbd93
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 21 Dec 2020 17:34:29 +0000

flight 157761 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157761/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 157696

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d162f36848c4a98a782cc05820b0aa7ec1ae297d
baseline version:
 xen                  357db96a66e47e609c3b14768f1062e13eedbd93

Last test of basis   157696  2020-12-18 19:01:31 Z    2 days
Testing same since   157761  2020-12-21 15:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
commit d162f36848c4a98a782cc05820b0aa7ec1ae297d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Sep 28 15:25:44 2020 +0100

    xen/x86: Fix memory leak in vcpu_create() error path
    
    Various paths in vcpu_create() end up calling paging_update_paging_modes(),
    which eventually allocate a monitor pagetable if one doesn't exist.
    
    However, an error in vcpu_create() results in the vcpu being cleaned up
    locally, and not put onto the domain's vcpu list.  Therefore, the monitor
    table is not freed by {hap,shadow}_teardown()'s loop.  This is caught by
    assertions later that we've successfully freed the entire hap/shadow memory
    pool.
    
    The per-vcpu loops in domain teardown logic is conceptually wrong, but exist
    due to insufficient existing structure in the existing logic.
    
    Break paging_vcpu_teardown() out of paging_teardown(), with mirrored breakouts
    in the hap/shadow code, and use it from arch_vcpu_create()'s error path.  This
    fixes the memory leak.
    
    The new {hap,shadow}_vcpu_teardown() must be idempotent, and are written to be
    as tolerable as possible, with the minimum number of safety checks possible.
    In particular, drop the mfn_valid() check - if these fields are junk, then Xen
    is going to explode anyway.
    
    Reported-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 6131dab5f2c8059a0fc7fd884bc6d4ff78ba44c2
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Dec 18 23:30:04 2020 +0000

    xen/Kconfig: Correct the NR_CPUS description
    
    The description "physical CPUs" is especially wrong, as it implies the number
    of sockets, which tops out at 8 on all but the very biggest servers.
    
    NR_CPUS is the number of logical entities the scheduler can use.
    
    Reported-by: hanetzer@startmail.com
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

