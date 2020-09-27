Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0027A098
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 13:18:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMUgn-00039q-Mx; Sun, 27 Sep 2020 11:17:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mno3=DE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMUgl-00039k-Ub
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 11:17:55 +0000
X-Inumbo-ID: 86d6e8dd-0e95-4803-bd63-9916936f94de
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86d6e8dd-0e95-4803-bd63-9916936f94de;
 Sun, 27 Sep 2020 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=Z8cMEWCs/ZK/YNYmKpOcx5i/5EWxHG3xt9ft2Z/haH4=; b=d+Cx8HMZbGSXUvn2zPqf3zsQzq
 D/k1kjfAYWokTvJYCRnjtvpd6sQNaeqLzIXbuS0t2dmtbJSbTP5DlYMu4y5hRUF/DGR3NDD2JuOp7
 CoVyejAOOdmu0SN8C4e51IgBqDdPG+aejOgDh3YcBcYN8OW4blrN6GFK3qLy/xZNm46s=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMUgj-0001Aq-Lk; Sun, 27 Sep 2020 11:17:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMUgj-0005bj-EP; Sun, 27 Sep 2020 11:17:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMUgj-0000M8-Dw; Sun, 27 Sep 2020 11:17:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154954-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 154954: trouble: broken
X-Osstest-Failures: xen-unstable-coverity:coverity-amd64:<job
 status>:broken:regression
 xen-unstable-coverity:coverity-amd64:host-install(4):broken:regression
X-Osstest-Versions-This: xen=5bcac985498ed83d89666959175ca9c9ed561ae1
X-Osstest-Versions-That: xen=2785b2a9e04abc148e1c5259f4faee708ea356f4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Sep 2020 11:17:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 154954 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154954/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                  <job status>                 broken
 coverity-amd64                4 host-install(4)        broken REGR. vs. 154638

version targeted for testing:
 xen                  5bcac985498ed83d89666959175ca9c9ed561ae1
baseline version:
 xen                  2785b2a9e04abc148e1c5259f4faee708ea356f4

Last test of basis   154638  2020-09-23 09:18:27 Z    4 days
Testing same since   154954  2020-09-27 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 coverity-amd64                                               broken  


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
commit 5bcac985498ed83d89666959175ca9c9ed561ae1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jun 29 11:32:37 2020 +0100

    x86/pv: Don't clobber NT on return-to-guest
    
    A 64bit IRET can restore NT - the faulting case is when NT is set in the live
    flags.  This change had an unintended consequence of causing the NT flag to
    spontaneously disappear from guest context whenever a interrupt/exception
    occurred.
    
    In combination with a SYSENTER which sets both TF and NT, Xen's handling of
    the #DB exceptions clears NT before it is even recorded suitably in the guest
    kernel's view of what userspace was doing.
    
    Reported-by: Andy Lutomirski <luto@kernel.org>
    Fixes: 0e47f92b0 ("x86: force EFLAGS.IF on when exiting to PV guests")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 61d4a04349895edc5a5868274b906ba61ef24f47
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 26 14:56:23 2020 +0100

    x86/pv: Don't deliver #GP for a SYSENTER with NT set
    
    It is a matter of guest kernel policy what to do with offending userspace, and
    terminating said userspace may not be the action chosen.
    
    Linux explicitly tolerates this case.
    
    Reported-by: Andy Lutomirski <luto@kernel.org>
    Fixes: fdac951560 ("x86: clear EFLAGS.NT in SYSENTER entry path")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit af3c913f03b5f9eab15b168ef87cde80f9addc6e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Sep 22 20:05:22 2020 +0100

    x86/msi: Fold pci_conf_write16() calls in write_msi_msg()
    
    In addition, this removes the unqualified 0/1 passed to msi_data_reg()
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 5a37207df52066efefe419c677b089a654d37afc
Author: Julien Grall <jgrall@amazon.com>
Date:   Fri Sep 18 18:11:16 2020 +0100

    xen/arm: bootfdt: Ignore empty memory bank
    
    At the moment, Xen will stop processing the Device Tree if a memory
    bank is empty (size == 0).
    
    Unfortunately, some of the Device Tree (such as on Colibri imx8qxp)
    may contain such a bank. This means Xen will not be able to boot
    properly.
    
    Relax the check to just ignore the banks. FWIW this also seems to be the
    behavior adopted by Linux.
    
    Reported-by: Daniel Wagner <Daniel.Wagner2@itk-engineering.de>
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit a6732807d335239fc29bd953538affc458bcc197
Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date:   Sat Sep 19 20:21:22 2020 +0300

    SUPPORT.md: Update status of Renesas IPMMU-VMSA (Arm)
    
    Mark Renesas IPMMU-VMSA as "Supported, not security supported"
    and remove dependencies on CONFIG_EXPERT.
    
    We can't treat the IOMMU driver as "Supported" since the device
    passthrough feature is not security supported on Arm today.
    
    Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

