Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6C39C0A1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 21:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137034.253884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpFm7-00056Z-Lg; Fri, 04 Jun 2021 19:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137034.253884; Fri, 04 Jun 2021 19:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpFm7-000543-GP; Fri, 04 Jun 2021 19:46:35 +0000
Received: by outflank-mailman (input) for mailman id 137034;
 Fri, 04 Jun 2021 19:46:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpFm6-00053t-GI; Fri, 04 Jun 2021 19:46:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpFm6-0003Rd-4m; Fri, 04 Jun 2021 19:46:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpFm5-0000En-Re; Fri, 04 Jun 2021 19:46:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lpFm5-000096-RA; Fri, 04 Jun 2021 19:46:33 +0000
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
	bh=M5R1oRDFlREW2+4cfGxEADm22gUTyezsUlXBIoF6CYQ=; b=52iDITfRdMpxxptj5FMNvVPxwI
	BerwN0CY1QowQLnMcR9gT/oXu8zRWpaX7ytgellUbX5uuERM0PQB2SkT/RdStJndL8VFRQncDwFYE
	oYLL8Q9DZKVAfJOT6+voCGRMH+q0gjNh2GtfF28TPpigk1MhHfoqaCO4TykeCgflLQjM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162370-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162370: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-saverestore:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1a0f2fe2297d122a08fee2b26de5de995fdeca13
X-Osstest-Versions-That:
    xen=5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Jun 2021 19:46:33 +0000

flight 162370 xen-unstable-smoke real [real]
flight 162372 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/162370/
http://logs.test-lab.xenproject.org/osstest/logs/162372/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt     17 guest-saverestore        fail REGR. vs. 162327

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1a0f2fe2297d122a08fee2b26de5de995fdeca13
baseline version:
 xen                  5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1

Last test of basis   162327  2021-06-01 16:01:37 Z    3 days
Testing same since   162370  2021-06-04 17:01:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
commit 1a0f2fe2297d122a08fee2b26de5de995fdeca13
Author: George Dunlap <george.dunlap@citrix.com>
Date:   Thu May 6 13:38:02 2021 +0100

    SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported
    
    The support status of 32-bit guests doesn't seem particularly useful.
    
    With it changed to fully unsupported outside of PV-shim, adjust the PV32
    Kconfig default accordingly.
    
    Reported-by: Jann Horn <jannh@google.com>
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

