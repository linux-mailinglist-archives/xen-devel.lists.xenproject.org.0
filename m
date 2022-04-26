Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F8C51030F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 18:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314055.531943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNtg-0001F8-0v; Tue, 26 Apr 2022 16:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314055.531943; Tue, 26 Apr 2022 16:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNtf-0001DC-TV; Tue, 26 Apr 2022 16:18:39 +0000
Received: by outflank-mailman (input) for mailman id 314055;
 Tue, 26 Apr 2022 16:18:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njNtd-0001Cu-S5; Tue, 26 Apr 2022 16:18:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njNtd-0000JB-RB; Tue, 26 Apr 2022 16:18:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njNtd-0001LJ-Gt; Tue, 26 Apr 2022 16:18:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1njNtd-0001DN-GQ; Tue, 26 Apr 2022 16:18:37 +0000
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
	bh=LNNKHs3PBjAiqKK4ScbZN+UqK4y2o2VEbOtu1qOa7QM=; b=vqq2TKfm88g5GSD63WYmIM/g+T
	3oFD1lEhz6NBgbKStdWRrcRfVs4C7Znkjujgd73Wso7VpX5185N+M1rYSyoO/b0vMYs67056pyocy
	O3bPu0/zIapA0jim1gNgtjy9KizEqq2PJkzyvn1daCOdte9oISpJr070wm0rEJi0PVdQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169737-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169737: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=88a037e2cfe11a723fe420d3585837ab1bdc6f8a
X-Osstest-Versions-That:
    xen=2419a159fb943c24a6f2439604b9fdb1478fcd08
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 26 Apr 2022 16:18:37 +0000

flight 169737 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169737/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 169630
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 169630

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  88a037e2cfe11a723fe420d3585837ab1bdc6f8a
baseline version:
 xen                  2419a159fb943c24a6f2439604b9fdb1478fcd08

Last test of basis   169630  2022-04-22 20:01:46 Z    3 days
Testing same since   169729  2022-04-26 09:00:28 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  David Vrabel <dvrabel@amazon.co.uk>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
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
commit 88a037e2cfe11a723fe420d3585837ab1bdc6f8a
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

commit c266f974148d3d1b21d01b8bb243017943786444
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Tue Apr 26 10:30:31 2022 +0200

    xsm/flask: code style formatting
    
    This is a quick code style cleanup patch for xsm/flask. The files flask_op.c
    and hooks.c are Xen specific, thus full code style rules were applied. The
    remaining files are from Linux and therefore only trailing whitespace was
    remove from those files.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

commit fa4d84e6dd3c3bfd23a525b75a5483d4ce15adbb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 26 10:25:54 2022 +0200

    IOMMU: make domctl handler tolerate NULL domain
    
    Besides the reporter's issue of hitting a NULL deref when !CONFIG_GDBSX,
    XEN_DOMCTL_test_assign_device can legitimately end up having NULL passed
    here, when the domctl was passed DOMID_INVALID.
    
    Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
    Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 9cd7e31b3f584e97a138a770cfb031a91a867936
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Apr 26 10:23:58 2022 +0200

    xen/iommu: cleanup iommu related domctl handling
    
    Today iommu_do_domctl() is being called from arch_do_domctl() in the
    "default:" case of a switch statement. This has led already to crashes
    due to unvalidated parameters.
    
    Fix that by moving the call of iommu_do_domctl() to the main switch
    statement of do_domctl().
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org> # Arm
(qemu changes not included)

