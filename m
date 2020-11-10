Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C0A2AE005
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 20:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23916.50902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcZaK-000118-Ov; Tue, 10 Nov 2020 19:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23916.50902; Tue, 10 Nov 2020 19:45:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcZaK-00010j-LR; Tue, 10 Nov 2020 19:45:44 +0000
Received: by outflank-mailman (input) for mailman id 23916;
 Tue, 10 Nov 2020 19:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcZaJ-00010c-MK
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 19:45:43 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee755c8b-0585-4e03-84d8-605fbe0ea29c;
 Tue, 10 Nov 2020 19:45:41 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcZaH-0000gs-JY; Tue, 10 Nov 2020 19:45:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcZaH-0005El-Ch; Tue, 10 Nov 2020 19:45:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcZaH-0003cc-CD; Tue, 10 Nov 2020 19:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcZaJ-00010c-MK
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 19:45:43 +0000
X-Inumbo-ID: ee755c8b-0585-4e03-84d8-605fbe0ea29c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ee755c8b-0585-4e03-84d8-605fbe0ea29c;
	Tue, 10 Nov 2020 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=iejRnIAKA1QY4FZVL/mv+9MF3RW6AVBTBb7wVsnc8D8=; b=pguw+9SQ2IzLGxzmgGUoVO/eF3
	THW8Jy7jWgP+jtjdNZvozdAvrTIdJeHK4peo67QS/OSIFNEX86YGr+sGBKGFOi35zSISX/3DTVxch
	I/+QYuXMW0GFMVu8IJhhq79MvIU2cVSqAKF7b53ncTQeozFP206xo0WfHO/F5kxMXpng=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcZaH-0000gs-JY; Tue, 10 Nov 2020 19:45:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcZaH-0005El-Ch; Tue, 10 Nov 2020 19:45:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcZaH-0003cc-CD; Tue, 10 Nov 2020 19:45:41 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156628-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156628: regressions - FAIL
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
    xen=e6e85b662be9eab96f4cfc58e9945580cce8b2bb
X-Osstest-Versions-That:
    xen=3059178798a23ba870ff86ff54d442a07e6651fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Nov 2020 19:45:41 +0000

flight 156628 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156628/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 156622

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e6e85b662be9eab96f4cfc58e9945580cce8b2bb
baseline version:
 xen                  3059178798a23ba870ff86ff54d442a07e6651fc

Last test of basis   156622  2020-11-10 13:01:19 Z    0 days
Testing same since   156628  2020-11-10 17:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>

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
commit e6e85b662be9eab96f4cfc58e9945580cce8b2bb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Nov 10 14:40:09 2020 +0100

    x86/CPUID: also check leaf 7 max subleaf to be compatible
    
    Just like is done for basic and extended major leaves.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f5cfa09856732b1d78ff6a21ca3dc33a010da951
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Nov 10 14:39:30 2020 +0100

    x86/CPUID: suppress IOMMU related hypervisor leaf data
    
    Now that the IOMMU for guests can't be enabled "on demand" anymore,
    there's also no reason to expose the related CPUID bit "just in case".
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit db1a9fdd554cb1d8a7099af7925318fc06c6875b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Nov 10 14:39:03 2020 +0100

    x86/CPUID: don't use UB shift when library is built as 32-bit
    
    At least the insn emulator test harness will continue to be buildable
    (and ought to continue to be usable) also as a 32-bit binary. (Right now
    the CPU policy test harness is, too, but there it may be less relevant
    to keep it functional, just like e.g. we don't support fuzzing the insn
    emulator in 32-bit mode.) Hence the library code needs to cope with
    this.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit b5ad37f8e9284cc147218f7a5193d739ae7b956f
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Nov 10 14:37:15 2020 +0100

    xen/evtchn: revert 52e1fc47abc3a0123
    
    With the event channel lock no longer disabling interrupts commit
    52e1fc47abc3a0123 ("evtchn/Flask: pre-allocate node on send path") can
    be reverted again.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 5f2df45ead7c1195142f68b7923047a1e9479d54
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Nov 10 14:36:15 2020 +0100

    xen/evtchn: rework per event channel lock
    
    Currently the lock for a single event channel needs to be taken with
    interrupts off, which causes deadlocks in some cases.
    
    Rework the per event channel lock to be non-blocking for the case of
    sending an event and removing the need for disabling interrupts for
    taking the lock.
    
    The lock is needed for avoiding races between event channel state
    changes (creation, closing, binding) against normal operations (set
    pending, [un]masking, priority changes).
    
    Use a rwlock, but with some restrictions:
    
    - Changing the state of an event channel (creation, closing, binding)
      needs to use write_lock(), with ASSERT()ing that the lock is taken as
      writer only when the state of the event channel is either before or
      after the locked region appropriate (either free or unbound).
    
    - Sending an event needs to use read_trylock() mostly, in case of not
      obtaining the lock the operation is omitted. This is needed as
      sending an event can happen with interrupts off (at least in some
      cases).
    
    - Dumping the event channel state for debug purposes is using
      read_trylock(), too, in order to avoid blocking in case the lock is
      taken as writer for a long time.
    
    - All other cases can use read_lock().
    
    Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

