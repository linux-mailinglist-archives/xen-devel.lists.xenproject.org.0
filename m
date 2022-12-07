Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD1645E4D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 17:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456487.714249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2wr4-00067J-DD; Wed, 07 Dec 2022 16:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456487.714249; Wed, 07 Dec 2022 16:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2wr4-000657-A8; Wed, 07 Dec 2022 16:01:06 +0000
Received: by outflank-mailman (input) for mailman id 456487;
 Wed, 07 Dec 2022 16:01:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2wr2-00064x-ME; Wed, 07 Dec 2022 16:01:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2wr2-0005G8-Jm; Wed, 07 Dec 2022 16:01:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2wr1-0004bp-TZ; Wed, 07 Dec 2022 16:01:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p2wr1-0002cB-T7; Wed, 07 Dec 2022 16:01:03 +0000
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
	bh=x5Q1eMYWLMZjrdiiyzHCGocBXLch5u7qbnKwF5TrU00=; b=TXagNV0MQtTKSDf/70XvEoLoW9
	KUU9N5SApdPpGsLEGlCBXMyXije+Pl5GMsT/q5+5JBKXTVfxsSoojBCx0xXvgdlEZbhOJ/lddepwu
	ODaWl9XvFpb8Zi9ZnZ3oz2VYlc4idexk/6gjjh79EVvtjIRsRABJW+rKPGLBQ0FM9TGk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175072-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175072: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=11b4ff64841efd9724e5c1fce81ec2b5484b8d57
X-Osstest-Versions-That:
    xen=b926dbcccaa92831dda37576f768ddab9ec8a701
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Dec 2022 16:01:03 +0000

flight 175072 xen-unstable-smoke real [real]
flight 175073 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/175072/
http://logs.test-lab.xenproject.org/osstest/logs/175073/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 175063

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  11b4ff64841efd9724e5c1fce81ec2b5484b8d57
baseline version:
 xen                  b926dbcccaa92831dda37576f768ddab9ec8a701

Last test of basis   175063  2022-12-06 19:00:28 Z    0 days
Testing same since   175072  2022-12-07 12:02:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Per Bilse <per.bilse@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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
commit 11b4ff64841efd9724e5c1fce81ec2b5484b8d57
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Dec 7 12:18:36 2022 +0100

    x86/platform: protect XENPF_get_dom0_console if CONFIG_VIDEO not set
    
    A build failure [1] is observed if CONFIG_VGA (and thus CONFIG_VIDEO) is
    not set. This is because XENPF_get_dom0_console cmd of platform hypercall
    makes a call to fill_console_start_info, which is defined in video/vga.c
    and built only if CONFIG_VGA is set.
    
    To fix this issue, protect XENPF_get_dom0_console with CONFIG_VIDEO
    ifdefery.
    
    [1]:
    ld: prelink.o: in function `do_platform_op':
    (.text.do_platform_op+0x1a7): undefined reference to `fill_console_start_info'
    
    Fixes: 4dd160583c79 ("x86/platform: introduce hypercall to get initial video console settings")
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a44734df6c24fadbdb001f051cc5580c467caf7d
Author: Per Bilse <per.bilse@citrix.com>
Date:   Wed Dec 7 12:17:30 2022 +0100

    ioreq_broadcast(): accept partial broadcast success
    
    Avoid incorrectly triggering an error when a broadcast buffered ioreq
    is not handled by all registered clients, as long as the failure is
    strictly because the client doesn't handle buffered ioreqs.
    
    Signed-off-by: Per Bilse <per.bilse@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit 51c5b8b9afe9c6c63f6f2a55f467118c40cff976
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Dec 7 12:16:49 2022 +0100

    xen: remove trigraphs from comments
    
    MISRA C rule 4.2 states that trigraphs (sequences of two question marks
    followed by a specified third character [=/'()!<>-]) should not be used.
    This applies to both code and comments. Thankfully, we do not use them
    in the code, but still there are some comments where they are
    accidentally used. Fix it.
    
    With regards to the comments and respective macros in pci_regs.h, these
    were inherited from Linux. Let's knowingly accept the divergence.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 60737ee9c590bea87c190a9421f2c19a41224c4a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 7 12:16:08 2022 +0100

    x86/HVM: drop stale check from hvm_load_cpu_msrs()
    
    Up until f61685a66903 ("x86: remove defunct init/load/save_msr()
    hvm_funcs") the check of the _rsvd field served as an error check for
    the earlier hvm_funcs.save_msr() invocation. With that invocation gone
    the check makes no sense anymore: It is effectively dead code due to the
    checking of the field in the earlier loop.
    
    While dropping the conditional also eliminate the "err" local variable
    (using a non-standard name anyway), replaced by suitable new/adjusted
    "return" statements.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

