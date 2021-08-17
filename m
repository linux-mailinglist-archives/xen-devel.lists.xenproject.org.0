Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C313EEC23
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 14:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167801.306329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxrZ-0005jD-DL; Tue, 17 Aug 2021 12:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167801.306329; Tue, 17 Aug 2021 12:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxrZ-0005gK-9P; Tue, 17 Aug 2021 12:06:37 +0000
Received: by outflank-mailman (input) for mailman id 167801;
 Tue, 17 Aug 2021 12:06:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFxrX-0005gA-Im; Tue, 17 Aug 2021 12:06:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFxrX-00051r-FC; Tue, 17 Aug 2021 12:06:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFxrX-00037Z-7E; Tue, 17 Aug 2021 12:06:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mFxrX-00036g-6m; Tue, 17 Aug 2021 12:06:35 +0000
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
	bh=ZBR+pi1jRJTQjL6nY9sVevsy5tW8TeCQ8BwTACi5+/4=; b=AykZbv8UHmihTed1X9ooN9jEkP
	eewWU5KmoQJ/5bILSWPodWc2FDRaeKnpXFQVCEfjqXDUutolPhpU4bIzqZ0P6THLHKypfxZjf5fNb
	IesIVg36iUMRAbD2X6TL8qDrcKCj4j7PdX9O20+FFb5acHxs/tMyHd3C4TjkUWoFfme4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164226-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 164226: regressions - FAIL
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
    xen=35727551c0703493a2240e967cffc3063b13d49c
X-Osstest-Versions-That:
    xen=274c5e79c792ce0331d0d8cd9a01545dea5a48fd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Aug 2021 12:06:35 +0000

flight 164226 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164226/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 164206

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  35727551c0703493a2240e967cffc3063b13d49c
baseline version:
 xen                  274c5e79c792ce0331d0d8cd9a01545dea5a48fd

Last test of basis   164206  2021-08-16 14:01:35 Z    0 days
Testing same since   164207  2021-08-16 17:01:34 Z    0 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

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
commit 35727551c0703493a2240e967cffc3063b13d49c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 12 17:39:16 2021 +0100

    x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}
    
    This was a clear oversight in the original CET work.  The BUGFRAME_run_fn and
    BUGFRAME_warn paths update regs->rip without an equivalent adjustment to the
    shadow stack, causing IRET to suffer #CP because of the mismatch.
    
    One subtle, and therefore fragile, aspect of extable_shstk_fixup() was that it
    required regs->rip to have its old value as a cross-check that the right word
    in the shadow stack was being edited.
    
    Rework extable_shstk_fixup() into fixup_exception_return() which takes
    ownership of the update to both the regular and shadow stacks, ensuring that
    the regs->rip update is ordered correctly.
    
    Use the new fixup_exception_return() for BUGFRAME_run_fn and BUGFRAME_warn to
    ensure that the shadow stack is updated too.
    
    Fixes: 209fb9919b50 ("x86/extable: Adjust extable handling to be shadow stack compatible")
    Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Aug 16 14:24:44 2021 +0100

    x86/ACPI: Insert missing newlines into FACS error messages
    
    Booting Xen as a PVH guest currently yields:
    
      (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:b004,1:0], pm1x_evt[1:b000,1:0]
      (XEN) ACPI: FACS is not 64-byte aligned: 0xfc001010<2>ACPI: wakeup_vec[fc00101c], vec_size[20]
      (XEN) ACPI: Local APIC address 0xfee00000
    
    Insert newlines as appropriate.
    
    Fixes: d3faf9badf52 ("[host s3] Retrieve necessary sleep information from plain-text ACPI tables (FADT/FACS), and keep one hypercall remained for sleep notification.")
    Fixes: 0f089bbf43ec ("x86/ACPI: fix S3 wakeup vector mapping")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 6928bc511399fd8f593fe49a3241212860a6a1b5
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 12 14:49:57 2021 +0100

    MAINTAINERS: Fix file path for kexec headers
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

