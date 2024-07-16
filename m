Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AB8932FF7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 20:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759759.1169432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTmv2-0001md-I9; Tue, 16 Jul 2024 18:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759759.1169432; Tue, 16 Jul 2024 18:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTmv2-0001kl-Es; Tue, 16 Jul 2024 18:28:56 +0000
Received: by outflank-mailman (input) for mailman id 759759;
 Tue, 16 Jul 2024 18:28:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTmv1-0001kb-Il; Tue, 16 Jul 2024 18:28:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTmv1-0004kt-FP; Tue, 16 Jul 2024 18:28:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTmv0-0000CW-U7; Tue, 16 Jul 2024 18:28:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTmv0-00008b-TZ; Tue, 16 Jul 2024 18:28:54 +0000
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
	bh=5qhbO4jN6NwtLF+9N4Eh8YqdKGiIoXimqtwkIYLRCvw=; b=NKwlMKbRHPWTHNMaioZRW81QPu
	rNcM04HoSPDlwiyoPmrlJBd+Beh6O4BgcKv0fqXo7waaLhWFSj9yQS3G0CLXg4SSJGu+EEA9DdcRY
	9Xriqh0c4loBWlDFwdei5PrYSn7grNFmWhjN26P9UFp49cBKmw9brZTuqAhTYTaQhhiw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186821-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186821: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:host-ping-check-xen:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=57338346f29cea7b183403561bdc5f407163b846
X-Osstest-Versions-That:
    xen=1ddc8c1bad93aa6cbfe616dd72333460c47f96c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Jul 2024 18:28:54 +0000

flight 186821 xen-unstable-smoke real [real]
flight 186823 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186821/
http://logs.test-lab.xenproject.org/osstest/logs/186823/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl          10 host-ping-check-xen      fail REGR. vs. 186786

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  57338346f29cea7b183403561bdc5f407163b846
baseline version:
 xen                  1ddc8c1bad93aa6cbfe616dd72333460c47f96c9

Last test of basis   186786  2024-07-12 22:02:08 Z    3 days
Testing same since   186821  2024-07-16 13:02:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>

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
commit 57338346f29cea7b183403561bdc5f407163b846
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 16 14:09:14 2024 +0200

    x86/IRQ: avoid double unlock in map_domain_pirq()
    
    Forever since its introduction the main loop in the function dealing
    with multi-vector MSI had error exit points ("break") with different
    properties: In one case no IRQ descriptor lock is being held.
    Nevertheless the subsequent error cleanup path assumed such a lock would
    uniformly need releasing. Identify the case by setting "desc" to NULL,
    thus allowing the unlock to be skipped as necessary.
    
    This is CVE-2024-31143 / XSA-458.
    
    Coverity ID: 1605298
    Fixes: d1b6d0a02489 ("x86: enable multi-vector MSI")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

