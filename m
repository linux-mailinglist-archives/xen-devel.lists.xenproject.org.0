Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1C760A2F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 08:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569440.890165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBLc-0000Tp-Pd; Tue, 25 Jul 2023 06:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569440.890165; Tue, 25 Jul 2023 06:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBLc-0000SZ-Mm; Tue, 25 Jul 2023 06:16:40 +0000
Received: by outflank-mailman (input) for mailman id 569440;
 Tue, 25 Jul 2023 06:16:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qOBLb-0000SN-Qg; Tue, 25 Jul 2023 06:16:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qOBLb-00081m-Nj; Tue, 25 Jul 2023 06:16:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qOBLb-0002nx-BK; Tue, 25 Jul 2023 06:16:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qOBLb-00082w-Av; Tue, 25 Jul 2023 06:16:39 +0000
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
	bh=RkawmzL7lMjhfdasXIhGTCJKWedq/PBlG4X55Y9fOTM=; b=C+afh9EGZpHaZVnf5FTZO/9Q1h
	f3mIT2j+bl1+hs7h5FoWV4wKeco68/HXm5RFu1aJldafnFJKLHfNxHCZGuSqjXpDC6oUOcjOkG0QS
	gQt+OZly2dTBKhhSwvh3sV8veGmzZz8dot/XV1YwkMyYrzvdpdb6DPXNcUwz4lElr3Jc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182002-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182002: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0b1171be87698bc7d14760383c0770aeb6e41dd4
X-Osstest-Versions-That:
    xen=f91c5ea970675637721bb7f18adaa189837eb783
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Jul 2023 06:16:39 +0000

flight 182002 xen-unstable-smoke real [real]
flight 182005 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182002/
http://logs.test-lab.xenproject.org/osstest/logs/182005/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 181999

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0b1171be87698bc7d14760383c0770aeb6e41dd4
baseline version:
 xen                  f91c5ea970675637721bb7f18adaa189837eb783

Last test of basis   181999  2023-07-24 17:02:22 Z    0 days
Testing same since   182002  2023-07-25 01:03:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
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


Not pushing.

------------------------------------------------------------
commit 0b1171be87698bc7d14760383c0770aeb6e41dd4
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Mon Jul 24 16:26:07 2023 +0200

    efi: mechanical renaming to address MISRA C:2012 Rule 5.3
    
    Rule 5.3 has the following headline:
    "An identifier declared in an inner scope shall not hide an
    identifier declared in an outer scope"
    
    The function parameters renamed in this patch are hiding a variable defined
    in an enclosing scope.
    
    The following rename is made:
    - s/cfg/file/
    to distinguish from the variable 'cfg', which is hidden by the parameter inside
    the modified functions.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 9a51409452b52ffed132eb54e8673a3501d8ec95
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Fri Jul 21 15:16:36 2023 -0700

    docs/misra: add Rule 1.1 and 5.6
    
    Rule 1.1 is uncontroversial and we are already following it.
    
    Rule 5.6 has been deemed a good rule to have by the MISRA C group.
    However, we do have a significant amount of violations that will take
    time to resolve and might require partial deviations in the form of
    in-code comments or MISRA C scanners special configurations (ECLAIR).
    For new code, we want this rule to generally apply hence the addition to
    docs/misra/rules.rst.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

