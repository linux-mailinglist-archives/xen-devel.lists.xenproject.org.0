Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE05ED40D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 06:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413115.656623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odP8C-0004zH-EC; Wed, 28 Sep 2022 04:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413115.656623; Wed, 28 Sep 2022 04:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odP8C-0004vn-Aa; Wed, 28 Sep 2022 04:57:12 +0000
Received: by outflank-mailman (input) for mailman id 413115;
 Wed, 28 Sep 2022 04:57:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odP8B-0004vd-KF; Wed, 28 Sep 2022 04:57:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odP8B-0003aO-HL; Wed, 28 Sep 2022 04:57:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odP8B-0002Cu-1K; Wed, 28 Sep 2022 04:57:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1odP8B-0004NC-0t; Wed, 28 Sep 2022 04:57:11 +0000
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
	bh=v/TJRZJUf4M5W9fPTLHjYxVKgbfHSth6YH8vXvCoRG0=; b=Wu7DYytMn3eNVNPI1S61IgEqDH
	2OkOf9QPvxyoUVSBihBIqmzmAiNyLjvE7YEk+mQ5RtdDOIXIO8D9+pWSbvFfRFrbs0Wr7PnTJ+oEB
	3yrQQjYzZCPYZy3zNlCt4UmLv+lZWqPrsIn3Od1hPWEbzraeorpqVsicC4lOP+bpWkCM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173342-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173342: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=211d8419ef8d8a237ff914fd8304b8fefc3ff2cc
X-Osstest-Versions-That:
    xen=5e936d11b171793c174686268c9c1df8a4fa974c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Sep 2022 04:57:11 +0000

flight 173342 xen-unstable-smoke real [real]
flight 173344 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/173342/
http://logs.test-lab.xenproject.org/osstest/logs/173344/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 173333

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  211d8419ef8d8a237ff914fd8304b8fefc3ff2cc
baseline version:
 xen                  5e936d11b171793c174686268c9c1df8a4fa974c

Last test of basis   173333  2022-09-27 13:00:27 Z    0 days
Testing same since   173342  2022-09-28 01:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>

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
commit 211d8419ef8d8a237ff914fd8304b8fefc3ff2cc
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Sep 26 14:02:13 2022 +0100

    CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt test
    
    buster-gcc-ibt is a dedicated test to run a not-yet-upstreamed compiler patch
    which is relevant to CONFIG_XEN_IBT in 4.17 and later.
    
    Force it on, rather than having 50% of the jobs not testing what they're
    supposed to be testing.
    
    Fixes: 5d59421815d5 ("x86: Use control flow typechecking where possible")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    [stefano: minor code style improvement]
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

commit 1686272d5297b2f6ebad7dcf6586d17c55b84c81
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Tue Sep 27 11:47:18 2022 +0200

    automation: qemu-smoke-arm{32/64}.sh: Fix typo in DEBIAN_FRONTENT
    
    The correct variable name is DEBIAN_FRONTEND and not DEBIAN_FRONTENT.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 13a7c0074ac8fb31f6c0485429b7a20a1946cb22
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Sep 27 16:47:08 2022 +0100

    Build: Drop -no-pie from EMBEDDED_EXTRA_CFLAGS
    
    This breaks all Clang builds, as demostrated by Gitlab CI.
    
    Contrary to the description in ecd6b9759919, -no-pie is not even an option
    passed to the linker.  GCC's actual behaviour is to inhibit the passing of
    -pie to the linker, as well as selecting different cr0 artefacts to be linked.
    
    EMBEDDED_EXTRA_CFLAGS is not used for $(CC)-doing-linking, and not liable to
    gain such a usecase.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Stefano Stabellini <sstabellini@kernel.org>
    Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
(qemu changes not included)

