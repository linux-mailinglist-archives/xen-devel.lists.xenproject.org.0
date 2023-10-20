Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C37D116C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 16:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619804.965480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtqMK-0006Rf-DP; Fri, 20 Oct 2023 14:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619804.965480; Fri, 20 Oct 2023 14:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtqMK-0006PY-AM; Fri, 20 Oct 2023 14:20:16 +0000
Received: by outflank-mailman (input) for mailman id 619804;
 Fri, 20 Oct 2023 14:20:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtqMJ-0006PO-4T; Fri, 20 Oct 2023 14:20:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtqMI-0004D4-Up; Fri, 20 Oct 2023 14:20:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtqMI-00022F-O0; Fri, 20 Oct 2023 14:20:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qtqMI-0003BQ-Ne; Fri, 20 Oct 2023 14:20:14 +0000
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
	bh=pDpuzkpjZwSVnMlqIQrQL9J+4KljNOylQgj9OWKUsiA=; b=2UfqFCGikIisg52RCXIuLJP2EW
	EsY6ZtDONKB01lBXpHVOhpzT+vqjyOSNiN5Kc2ZIwtBMI0SjJ/3NJRxrRR+6D9t+0irLTPRmI6wIF
	aRmwZPe3Ah8GOu9vsO4WR2u7m4kJLTzE1YLPzYL5VbD27eGa0/AJ6Z9+eEWGvegkzub0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183442-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183442: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8a5ef972bab3ad57bf017a42601943aa05811536
X-Osstest-Versions-That:
    xen=474fc7d3c6525e209bd2fe1e6ef0bbb34de86bb4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Oct 2023 14:20:14 +0000

flight 183442 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183442/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8a5ef972bab3ad57bf017a42601943aa05811536
baseline version:
 xen                  474fc7d3c6525e209bd2fe1e6ef0bbb34de86bb4

Last test of basis   183436  2023-10-19 22:02:05 Z    0 days
Testing same since   183442  2023-10-20 11:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   474fc7d3c6..8a5ef972ba  8a5ef972bab3ad57bf017a42601943aa05811536 -> smoke

