Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C66F7EE733
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 20:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634634.990102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3hmF-0006cT-KB; Thu, 16 Nov 2023 19:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634634.990102; Thu, 16 Nov 2023 19:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3hmF-0006ZP-Gv; Thu, 16 Nov 2023 19:11:47 +0000
Received: by outflank-mailman (input) for mailman id 634634;
 Thu, 16 Nov 2023 19:11:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r3hmE-0006ZF-3u; Thu, 16 Nov 2023 19:11:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r3hmE-0004Rl-02; Thu, 16 Nov 2023 19:11:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r3hmD-000283-JE; Thu, 16 Nov 2023 19:11:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r3hmD-0006A5-Ib; Thu, 16 Nov 2023 19:11:45 +0000
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
	bh=IU0A0YijtMgWXBZR39YUMHv+trPf9yLThnO7mUlQxe0=; b=0Z6Q+lH6Wkn1YZG0jkCkagjv1P
	HP+iyUqVWmiGUPI+966+3Eb5trsp6mJMxIkIkyOtlBeoU53cq8gIrho2LN3Ek6Gcp2yV5nygjU3M5
	83VL5PJ7sgxNI6chA2GIQFgcHl0aK4X1nuqtgtQlUAD4ZwuUZaNrEF1hgDfEYN3bkU9Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183774-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183774: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6cd046c501bce48cdc42f597fc7a023aa08853e7
X-Osstest-Versions-That:
    xen=b739e2067b1a06328e7f0042630b543413689eac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Nov 2023 19:11:45 +0000

flight 183774 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183774/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6cd046c501bce48cdc42f597fc7a023aa08853e7
baseline version:
 xen                  b739e2067b1a06328e7f0042630b543413689eac

Last test of basis   183770  2023-11-16 09:02:03 Z    0 days
Testing same since   183774  2023-11-16 15:02:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Henry Wang <Henry.Wang@arm.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>
  Leo Yan <leo.yan@linaro.org>

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
   b739e2067b..6cd046c501  6cd046c501bce48cdc42f597fc7a023aa08853e7 -> smoke

