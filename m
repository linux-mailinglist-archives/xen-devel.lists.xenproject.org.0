Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F315525E510
	for <lists+xen-devel@lfdr.de>; Sat,  5 Sep 2020 04:28:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kENuw-0003vJ-Vp; Sat, 05 Sep 2020 02:27:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H5tp=CO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kENuw-0003uz-17
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2020 02:27:02 +0000
X-Inumbo-ID: 84c4e04f-6af7-4152-9919-0dc8c58698a0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84c4e04f-6af7-4152-9919-0dc8c58698a0;
 Sat, 05 Sep 2020 02:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=P/MjbpavwRECtm5LknGm+F0S0tNNp5xOKy8X9yiC9Es=; b=QeoUeXDOqkofiKOgQC/I5NQO7f
 Y1U94xxeHwyQC047kwIrViMpuyraKI3Vqc/QPmv6dr4fxuPtO6h8RKNhUOV7S9tQ1kt8cRtpd6NK5
 8FqJ16Bf1d3wAvmwEXqBkqgHmdItU4wXOtTpYdJY+rEmm/pG3jWmQPFkYzBZga3HjJMA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kENum-00035I-Fs; Sat, 05 Sep 2020 02:26:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kENum-00021m-7W; Sat, 05 Sep 2020 02:26:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kENum-0002G5-6z; Sat, 05 Sep 2020 02:26:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153728-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 153728: trouble: broken/pass
X-Osstest-Failures: xen-unstable-smoke:test-armhf-armhf-xl:<job
 status>:broken:regression
 xen-unstable-smoke:test-armhf-armhf-xl:hosts-allocate:broken:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=f4c1a541fa351e4f613471bbf397931f9e1ddd27
X-Osstest-Versions-That: xen=82c3d15c903aa434473dfdb570096ae5db809b94
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Sep 2020 02:26:52 +0000
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

flight 153728 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153728/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl           2 hosts-allocate         broken REGR. vs. 153720

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f4c1a541fa351e4f613471bbf397931f9e1ddd27
baseline version:
 xen                  82c3d15c903aa434473dfdb570096ae5db809b94

Last test of basis   153720  2020-09-04 17:01:26 Z    0 days
Testing same since   153728  2020-09-04 20:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Chen <wei.chen@arm.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          broken  
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

broken-job test-armhf-armhf-xl broken
broken-step test-armhf-armhf-xl hosts-allocate

Not pushing.

------------------------------------------------------------
commit f4c1a541fa351e4f613471bbf397931f9e1ddd27
Author: Wei Chen <wei.chen@arm.com>
Date:   Fri Aug 28 02:34:04 2020 +0000

    xen/arm: Throw messages for unknown FP/SIMD implement ID
    
    Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
    FP/SIMD implementations. Currently, we exactly know the meaning of
    0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
    features presented. If there is a value 0x2 bumped in the future,
    Xen behaviors for value <= 0x1 can also take effect. But what Xen
    done for value <= 0x1 may not always cover new value 0x2 required.
    We throw these messages to break the silence when Xen detected
    unknown FP/SIMD IDs to notice user to check.
    
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 968bb86d04913f52d7678a842474f2a674a8b23e
Author: Wei Chen <wei.chen@arm.com>
Date:   Fri Aug 28 02:34:03 2020 +0000

    xen/arm: Missing N1/A76/A75 FP registers in vCPU context switch
    
    Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
    FP/SIMD or not. But currently, these two MACROs only consider value 0
    of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
    that support FP/SIMD and half-precision floating-point arithmetic, the
    ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
    For these CPUs, xen will treat them as no FP/SIMD support, the
    vfp_save/restore_state will not take effect.
    
    From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
    basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
    this case, on N1/A76/A75 platforms, Xen will always miss the floating
    pointer registers save/restore. If different vCPUs are running on the
    same pCPU, the floating pointer registers will be corrupted randomly.
    
    This patch fixes Xen on these new cores.
    
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 1814a626fb5811184eda64fe22f0055df4600211
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Aug 25 18:38:10 2020 +0100

    xen/arm: Update silicon-errata.txt with the Neovers AT erratum
    
    Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
    added a new erratum but forgot to update silicon-errata.txt.
    
    Update the file accordingly to keep track of errata workaround in Xen.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

