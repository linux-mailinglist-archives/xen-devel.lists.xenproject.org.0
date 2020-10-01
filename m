Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A30A27FE25
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 13:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1214.4095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwSs-0002pc-Ay; Thu, 01 Oct 2020 11:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214.4095; Thu, 01 Oct 2020 11:09:34 +0000
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
	id 1kNwSs-0002p5-7F; Thu, 01 Oct 2020 11:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1214;
 Thu, 01 Oct 2020 11:09:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNwSq-0002nk-NJ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:09:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccf22787-0452-4d0d-97e7-2e8b7c63eb13;
 Thu, 01 Oct 2020 11:09:26 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNwSj-0003kO-OT; Thu, 01 Oct 2020 11:09:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNwSj-0005mE-Hu; Thu, 01 Oct 2020 11:09:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNwSj-0005Ui-Gv; Thu, 01 Oct 2020 11:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNwSq-0002nk-NJ
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:09:32 +0000
X-Inumbo-ID: ccf22787-0452-4d0d-97e7-2e8b7c63eb13
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ccf22787-0452-4d0d-97e7-2e8b7c63eb13;
	Thu, 01 Oct 2020 11:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=NvxmvG4fbOWjfswkrc9poPXMiGTXq9RAWyh6Q5SCr6M=; b=cSdfnUODN3RHYdqQxeDIdT1WBd
	+MNQ4/yND8XFs0/r3AYxRWRiIiCOzvii9nKutIzLeAx8JrkLFKFBDPSGAuKC2JTZU951xSLSevjtC
	pWCbMn20DOeKJ7oGbe/AMlt6VE2pnllhRScLy+sLJ395PXJunLzgj0kHADKW1CW5xB6E=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNwSj-0003kO-OT; Thu, 01 Oct 2020 11:09:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNwSj-0005mE-Hu; Thu, 01 Oct 2020 11:09:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNwSj-0005Ui-Gv; Thu, 01 Oct 2020 11:09:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155213-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155213: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=11852c7bb070a18c3708b4c001772a23e7d4fc27
X-Osstest-Versions-That:
    xen=c73952831f0fc63a984e0d07dff1d20f8617b81f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Oct 2020 11:09:25 +0000

flight 155213 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155213/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt     12 guest-start              fail REGR. vs. 155128

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  11852c7bb070a18c3708b4c001772a23e7d4fc27
baseline version:
 xen                  c73952831f0fc63a984e0d07dff1d20f8617b81f

Last test of basis   155128  2020-09-30 08:01:25 Z    1 days
Testing same since   155144  2020-09-30 16:01:24 Z    0 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Juergen Gross <jgross@suse.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <paul@xen.org>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     fail    


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
commit 11852c7bb070a18c3708b4c001772a23e7d4fc27
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Sep 24 16:36:48 2020 +0200

    tools/xenstore: set maximum number of grants needed
    
    When running as a stubdom Xenstore should set the maximum number of
    grants needed via a call of xengnttab_set_max_grants(), as otherwise
    the number of domains which can be supported will be 128 only (the
    default number of grants supported by Mini-OS).
    
    We use one grant per domain so the theoretical maximum number is
    DOMID_FIRST_RESERVED.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Sep 29 14:48:52 2020 +0100

    tools/cpuid: Plumb nested_virt down into xc_cpuid_apply_policy()
    
    Nested Virt is the final special case in legacy CPUID handling.  Pass the
    (poorly named) nested_hvm setting down into xc_cpuid_apply_policy() to break
    the semantic dependency on HVM_PARAM_NESTEDHVM.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 50a5215f30e964a6f16165ab57925ca39f31a849
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Sep 24 20:08:43 2020 +0200

    libxc/bitops: increase potential size of bitmaps
    
    If the bitmap is used to represent domU pages, the amount of memory is
    limited to 8TB due to the 32bit value. Adjust the code to use 64bit
    values as input. All callers already use some form of 64bit as input,
    so no further adjustment is required.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 27de84d3ae462bd8311c8267c642ec95afdcf47c
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Sep 23 12:03:23 2020 +0100

    tools: Fix configure of upstream QEMU
    
    QEMU as recently switch its build system to use meson and the
    ./configure step with meson is more restrictive that the step used to
    be, most installation path wants to be within prefix, otherwise we
    have this error message:
    
        ERROR: The value of the 'datadir' option is '/usr/share/qemu-xen' which must be a subdir of the prefix '/usr/lib/xen'.
    
    In order to workaround the limitation, we will set prefix to the same
    one as for the rest of Xen installation, and set all the other paths.
    
    For reference, a thread in qemu-devel:
        "configure with datadir outside of --prefix fails with meson"
        https://lore.kernel.org/qemu-devel/20200918133012.GH2024@perard.uk.xensource.com/t/
    
    And an issue in meson:
        "artificial limitation of directories (forced to be in prefix)"
        https://github.com/mesonbuild/meson/issues/2561
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Tested-by: Paul Durrant <paul@xen.org>
    Acked-by: Wei Liu <wl@xen.org>

commit 0d8d289af7a679c028462c4ed5d98586f9ef9648
Author: Olaf Hering <olaf@aepfle.de>
Date:   Wed Sep 23 08:48:40 2020 +0200

    tools/libxc: report malloc errors in writev_exact
    
    The caller of writev_exact should be notified about malloc errors
    when dealing with partial writes.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>
(qemu changes not included)

