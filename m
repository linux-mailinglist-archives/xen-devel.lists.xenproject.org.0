Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC64909E2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 15:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258179.444351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9SYy-0008KD-8t; Mon, 17 Jan 2022 14:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258179.444351; Mon, 17 Jan 2022 14:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9SYy-0008Hg-5s; Mon, 17 Jan 2022 14:00:48 +0000
Received: by outflank-mailman (input) for mailman id 258179;
 Mon, 17 Jan 2022 14:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9SYw-0008HW-Tr; Mon, 17 Jan 2022 14:00:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9SYw-0004zi-Ri; Mon, 17 Jan 2022 14:00:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n9SYw-0001m4-LM; Mon, 17 Jan 2022 14:00:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n9SYw-0002dN-Kx; Mon, 17 Jan 2022 14:00:46 +0000
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
	bh=F5fblpja85gMxgTqy4N9HhKzgvX3z+mNQxJbEpGxriI=; b=XuLfJ3z5mVLHfHjHsdC2vch4LC
	IcXmXt4A4IxHcNDNiPa73fneJc8vru5CvDt3spX1lOELrZ3hXXJjlNJwQKsuOQILZgW/S1/8/Y/8e
	fQb0m+9xNdcaJGMhPf/nwYVvP8CQ9eLF+7MchhBLMREVEDlxUy+4vtLxOGttRH9N81qw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167723-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 167723: trouble: broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:host-install(5):broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=27a63cdac3880c918848430eb25181437d5795e9
X-Osstest-Versions-That:
    xen=9ce0a5e207f3968e65d0af33a15bee5bdf5c8a7f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jan 2022 14:00:46 +0000

flight 167723 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167723/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 167690

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  27a63cdac3880c918848430eb25181437d5795e9
baseline version:
 xen                  9ce0a5e207f3968e65d0af33a15bee5bdf5c8a7f

Last test of basis   167690  2022-01-13 17:00:27 Z    3 days
Testing same since   167723  2022-01-17 09:03:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          broken  
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

broken-job test-armhf-armhf-xl broken
broken-step test-armhf-armhf-xl host-install(5)

Not pushing.

------------------------------------------------------------
commit 27a63cdac3880c918848430eb25181437d5795e9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jan 17 09:45:04 2022 +0100

    x86/HVM: convert remaining hvm_funcs hook invocations to alt-call
    
    The aim being to have as few indirect calls as possible (see [1]),
    whereas during initial conversion performance was the main aspect and
    hence rarely used hooks didn't get converted. Apparently one use of
    get_interrupt_shadow() was missed at the time.
    
    While doing this, drop NULL checks ahead of CPU management and .nhvm_*()
    calls when the hook is always present. Also convert the
    .nhvm_vcpu_reset() call to alternative_vcall(), as the return value is
    unused and the caller has currently no way of propagating it.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>
    
    [1] https://lists.xen.org/archives/html/xen-devel/2021-11/msg01822.html

commit 299deb9dd93e5aae2f3b24ec001214458077a185
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jan 14 11:03:03 2022 +0100

    build: adjust include/xen/compile.h generation
    
    Prior to 19427e439e01 ("build: generate "include/xen/compile.h" with
    if_changed") running "make install-xen" as root would not have printed
    the banner under normal circumstances. Its printing would instead have
    indicated that something was wrong (or during a normal build the lack
    of printing would do so).
    
    Further aforementioned change had another undesirable effect, which I
    didn't notice during review: Originally compile.h would have been
    re-generated (and final binaries re-linked) when its dependencies were
    updated after an earlier build. This is no longer the case now, which
    means that if some other file also was updated, then the re-build done
    during "make install-xen" would happen with a stale compile.h (as its
    updating is suppressed in this case).
    
    Restore the earlier behavior for both aspects.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
(qemu changes not included)

