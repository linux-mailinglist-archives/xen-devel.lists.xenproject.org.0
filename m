Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDCE6E53C0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 23:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522479.811918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poWCZ-0001fO-Eh; Mon, 17 Apr 2023 21:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522479.811918; Mon, 17 Apr 2023 21:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poWCZ-0001c5-Bg; Mon, 17 Apr 2023 21:15:55 +0000
Received: by outflank-mailman (input) for mailman id 522479;
 Mon, 17 Apr 2023 21:15:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poWCY-0001bv-FN; Mon, 17 Apr 2023 21:15:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poWCY-0007zy-AG; Mon, 17 Apr 2023 21:15:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poWCX-0002QF-UQ; Mon, 17 Apr 2023 21:15:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1poWCX-0000mF-TX; Mon, 17 Apr 2023 21:15:53 +0000
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
	bh=RLDthoILcMNiuUR0AtkgOeoQDWi6hTpu95lImlfk93Y=; b=kA/+oPEBSjBDYs5Qq2N9MRFRPt
	ZCqK9ZvMD3CTER/fUhyMQtjbtKby7niuf7ryGpo9Sym3acH4chkejDkesxeBCMO/3cdn9/L+x4FfC
	0Pet/jRNIPlgKu1rgn+JEThwkdAWk4/jDHBGXI6W2ijNW7y/slQYtflnKbzH9fz/eePo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180286-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180286: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=65c4e7472cafb60f478e7a5f358ee1eeac28b5a8
X-Osstest-Versions-That:
    xen=5eb6bd7454e253f4907dbeb7aa982967b21698bc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Apr 2023 21:15:53 +0000

flight 180286 xen-unstable-smoke real [real]
flight 180288 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180286/
http://logs.test-lab.xenproject.org/osstest/logs/180288/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 180283

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  65c4e7472cafb60f478e7a5f358ee1eeac28b5a8
baseline version:
 xen                  5eb6bd7454e253f4907dbeb7aa982967b21698bc

Last test of basis   180283  2023-04-17 13:02:10 Z    0 days
Testing same since   180286  2023-04-17 17:03:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>

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
commit 65c4e7472cafb60f478e7a5f358ee1eeac28b5a8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 17 18:11:45 2023 +0200

    x86emul: support AVX-NE-CONVERT insns
    
    Matching what was done earlier, explicit tests are added only for
    irregular insn / memory access patterns.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 842acaa743a503726d6c4d77a7982cc64f07c4bf
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 17 18:11:06 2023 +0200

    x86emul: support AVX-VNNI-INT8
    
    These are close relatives of the AVX-VNNI ISA extension. Since the insns
    here and in particular their memory access patterns follow the usual
    scheme (and especially the byte variants of AVX-VNNI), I didn't think it
    was necessary to add a contrived test specifically for them.
    
    While making the addition also re-wire AVX-VNNI's handling to
    simd_0f_ymm: There's no reason to check the AVX feature alongside the
    one actually of interest (there are a few features where two checks are
    actually necessary, e.g. GFNI+AVX, but this isn't the case here).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit da232f1f1118e8c8fad520dedee312005c2984fb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 17 18:10:14 2023 +0200

    x86emul: support AVX-IFMA insns
    
    As in a few cases before (in particular: AVX512_IFMA), since the insns
    here and in particular their memory access patterns follow the usual
    scheme, I didn't think it was necessary to add a contrived test
    specifically for them.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

