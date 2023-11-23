Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58CF7F6206
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 15:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639768.997462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6B25-0000M4-Pe; Thu, 23 Nov 2023 14:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639768.997462; Thu, 23 Nov 2023 14:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6B25-0000Jl-MP; Thu, 23 Nov 2023 14:50:21 +0000
Received: by outflank-mailman (input) for mailman id 639768;
 Thu, 23 Nov 2023 14:50:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r6B24-0000JZ-8R; Thu, 23 Nov 2023 14:50:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r6B24-0003nY-0l; Thu, 23 Nov 2023 14:50:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r6B23-0004Qn-Nj; Thu, 23 Nov 2023 14:50:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r6B23-0006fY-LK; Thu, 23 Nov 2023 14:50:19 +0000
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
	bh=ACD3Yj+Lyp3x4kBuS3uVvGgSsTU61zAsSe+BqDM+eic=; b=p5dVjH370uMo/aBKGcT/HQDOB7
	vcJE3P31gq1/xeBAsz1x8KWfoNDaYvi2/JH6UCq/4y8WISqN2GUOZFXUNgarXu573ndNw7FWcZt9I
	Z+MoLEfvF9dhHz+BQQXECb3T0+cKaRTSmXs/9NVgayXDPfq3HUAcHnzdQ0Y1hb7NrHqM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183840-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183840: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8f45862580c962791e66df716389bb5b1dd704df
X-Osstest-Versions-That:
    xen=c22fe7213c9b1f99cbc64c33e391afa223f9cd08
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Nov 2023 14:50:19 +0000

flight 183840 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183840/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8f45862580c962791e66df716389bb5b1dd704df
baseline version:
 xen                  c22fe7213c9b1f99cbc64c33e391afa223f9cd08

Last test of basis   183826  2023-11-22 14:00:36 Z    1 days
Testing same since   183840  2023-11-23 10:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   c22fe7213c..8f45862580  8f45862580c962791e66df716389bb5b1dd704df -> smoke

