Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A91D9966D6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 12:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814261.1227749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTk8-0001Od-FO; Wed, 09 Oct 2024 10:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814261.1227749; Wed, 09 Oct 2024 10:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTk8-0001Ma-Bv; Wed, 09 Oct 2024 10:16:32 +0000
Received: by outflank-mailman (input) for mailman id 814261;
 Wed, 09 Oct 2024 10:16:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syTk7-0001MF-6b; Wed, 09 Oct 2024 10:16:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syTk7-0006bP-4z; Wed, 09 Oct 2024 10:16:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syTk6-0003QF-Mt; Wed, 09 Oct 2024 10:16:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1syTk6-0001vC-MK; Wed, 09 Oct 2024 10:16:30 +0000
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
	bh=tfygQ89Q5/DQxTFwCf8xPtONOTtRphFIacBBYU/ONhU=; b=V06UhFSKy/jE0EqoUQfluaKcVL
	jUy8/g5yGBbUuwdHZFObuKeoMT9kLzH3Kst48ilmoGX+4CbFKkb4oAdqetKskGk+Q/liODmRfmXx3
	YksmG/r7Cfu8MzlEVifDsc4j9d5gjBKw564Rfef9OTjSvf/BI5KJmym5fcGUPBFW2OVo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188024-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 188024: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3b79d825b5719f6654e4c95cdc17d65bb204213a
X-Osstest-Versions-That:
    xen=c95cd5f9c5a8c1c6ab1b0b366d829fa8561958fd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Oct 2024 10:16:30 +0000

flight 188024 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188024/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 188015

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3b79d825b5719f6654e4c95cdc17d65bb204213a
baseline version:
 xen                  c95cd5f9c5a8c1c6ab1b0b366d829fa8561958fd

Last test of basis   188015  2024-10-08 16:00:24 Z    0 days
Testing same since   188024  2024-10-09 08:02:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Matthew Barnes <matthew.barnes@cloud.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
commit 3b79d825b5719f6654e4c95cdc17d65bb204213a
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed Oct 9 09:57:37 2024 +0200

    MAINTAINERS: Add myself as a reviewer for RISC-V
    
    As an active contributor to Xen's RISC-V port, so add myself
    to the list of reviewers.
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 6b80ec957c64fc3ca7a32adc504fefd226d7dad0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Oct 9 09:56:43 2024 +0200

    types: replace remaining uses of s64
    
    ... and move the type itself to linux-compat.h. An exception being
    arch/arm/arm64/cpufeature.c and arch/arm/include/asm/arm64/cpufeature.h,
    which are to use linux-compat.h instead (the former by including the
    latter).
    
    While doing so
    - correct the type of union uu's uq field in lib/divmod.c,
    - switch a few adjacent types as well, for (a little bit of)
      consistency.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 9d278c8c6cd5f8375c913ed8f4d1ce2b50f0ea06
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Wed Oct 9 09:56:16 2024 +0200

    MAINTAINERS: add myself as maintainer for arm tee
    
    With Tee mediators now containing Optee and FF-A implementations, add
    myself as maintainers to have someone handling the FF-A side.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

commit 2f413e22fa5eb1c6b8ec04ef1529807a2fbf6c79
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Oct 9 09:55:38 2024 +0200

    x86/msr: add log messages to MSR state load error paths
    
    Some error paths in the MSR state loading logic don't contain error messages,
    which makes debugging them quite hard without adding extra patches to print the
    information.
    
    Add two new log messages to the MSR state load path that print information
    about the entry that failed to load, for both PV and HVM.
    
    While there also adjust XEN_DOMCTL_set_vcpu_msrs to return -ENXIO in case the
    MSR is unhandled or can't be loaded, so it matches the error code used by HVM
    MSR loading (and it's less ambiguous than -EINVAL).
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit dcbf8210f3f3a49626341355308010eb92194b85
Author: Matthew Barnes <matthew.barnes@cloud.com>
Date:   Wed Oct 9 09:54:48 2024 +0200

    x86/APIC: Switch flat driver to use phys dst for ext ints
    
    External interrupts via logical delivery mode in xAPIC do not benefit
    from targeting multiple CPUs and instead simply bloat up the vector
    space.
    
    However the xAPIC flat driver currently uses logical delivery for
    external interrupts.
    
    This patch switches the xAPIC flat driver to use physical destination
    mode for external interrupts, instead of logical destination mode.
    
    This patch also applies the following non-functional changes:
    - Remove now unused logical flat functions
    - Expand GENAPIC_FLAT and GENAPIC_PHYS macros, and delete them.
    
    Resolves: https://gitlab.com/xen-project/xen/-/issues/194
    Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit b3152931302c9415eecd4f5bc4236bbfee9194a6
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Wed Oct 9 09:53:49 2024 +0200

    xen: Update header guards - RISC-V
    
    Update headers related to RISC-V.
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 6bbcb97ba45ecdcac9d7359fdecf298bc4c1be1c
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Wed Oct 9 09:53:25 2024 +0200

    xen: Update header guards - I/O MMU
    
    Update headers related to I/O MMU.
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 964c9568eaa58f621384f58e0d275f3b060d781d
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Wed Oct 9 09:53:05 2024 +0200

    xen: Update header guards - Intel TXT
    
    Update the header related to Intel trusted execution technology.
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

