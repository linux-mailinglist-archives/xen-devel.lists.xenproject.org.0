Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298C7AEE07
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 15:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608440.946901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql8EW-0001nq-Gm; Tue, 26 Sep 2023 13:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608440.946901; Tue, 26 Sep 2023 13:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql8EW-0001m9-EB; Tue, 26 Sep 2023 13:36:12 +0000
Received: by outflank-mailman (input) for mailman id 608440;
 Tue, 26 Sep 2023 13:36:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ql8EV-0001lz-84; Tue, 26 Sep 2023 13:36:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ql8EV-00025u-5I; Tue, 26 Sep 2023 13:36:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ql8EU-00065J-Ko; Tue, 26 Sep 2023 13:36:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ql8EU-0007nK-KO; Tue, 26 Sep 2023 13:36:10 +0000
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
	bh=58EcEfPYiUpPTA7w/SjmXMzT3N8TcSGx1M6FsfzgxxA=; b=3KhbDG7bMOMT20I1asWGKRRb67
	LH/EyipjnCKp/wXFbQlvQysLym03DQeY0v/8vYzNPGwf918e6olbNTR405M0Yauhp+duBs9DJWkFN
	9ge5N4DBnsuZRdvGlxorDVA6FmO+MSyHbCqH/HPDJ5zh4C1CgOXJFZ2DcBVuAHu2G81U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183176-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183176: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:host-ping-check-xen:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=cbb71b95dd708b1e26899bbe1e7bf9a85081fd60
X-Osstest-Versions-That:
    xen=d6351a10c80fcbbf2b5996d351b7181ba17b3b32
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 26 Sep 2023 13:36:10 +0000

flight 183176 xen-unstable-smoke real [real]
flight 183177 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183176/
http://logs.test-lab.xenproject.org/osstest/logs/183177/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl          10 host-ping-check-xen      fail REGR. vs. 183156

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  cbb71b95dd708b1e26899bbe1e7bf9a85081fd60
baseline version:
 xen                  d6351a10c80fcbbf2b5996d351b7181ba17b3b32

Last test of basis   183156  2023-09-25 09:00:25 Z    1 days
Testing same since   183176  2023-09-26 09:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
commit cbb71b95dd708b1e26899bbe1e7bf9a85081fd60
Author: Shawn Anastasio <sanastasio@raptorengineering.com>
Date:   Tue Sep 26 10:08:25 2023 +0200

    automation: Drop ppc64le-*randconfig jobs
    
    Since ppc64le is still undergoing early bringup, disable the randconfig
    CI build which was causing spurious CI failures.
    
    Reported-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit e47f8c6c2a27cbdadb75b443af069a77f917067d
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Tue Sep 26 10:06:18 2023 +0200

    drivers/video: make declarations of defined functions available
    
    The declarations for 'vesa_{init,early_init,endboot}' needed by
    'xen/drivers/video/vesa.c' and 'fill_console_start_info' in 'vga.c'
    are now available by moving the relative code inside 'vga.h'.
    
    While moving the code, the alternative definitions are now guarded by
    CONFIG_VGA. The alternative #define-s for 'vesa_early_init' and 'vesa_endboot'
    are dropped, since currently they have no callers when CONFIG_VGA is not defined.
    
    This also resolves violations of MISRA C:2012 Rule 8.4.
    
    Fixes: 6d9199bd0f22 ("x86-64: enable hypervisor output on VESA frame buffer")
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>
(qemu changes not included)

