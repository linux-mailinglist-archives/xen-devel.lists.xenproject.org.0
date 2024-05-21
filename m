Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652788CB048
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 16:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726967.1131356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9QMi-0008UD-C5; Tue, 21 May 2024 14:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726967.1131356; Tue, 21 May 2024 14:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9QMi-0008Sg-9Y; Tue, 21 May 2024 14:21:20 +0000
Received: by outflank-mailman (input) for mailman id 726967;
 Tue, 21 May 2024 14:21:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9QMh-0008SW-5z; Tue, 21 May 2024 14:21:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9QMh-0005eB-2o; Tue, 21 May 2024 14:21:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9QMg-0005nR-Q3; Tue, 21 May 2024 14:21:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s9QMg-0001l3-Pd; Tue, 21 May 2024 14:21:18 +0000
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
	bh=aBQkd82Oa3w1xN+2ck0MGNPk0xaaimt53A4Rl2eGKzw=; b=Y8Y7mGYCVSO6SYmwXXpua9MAth
	Am/+a+ixuPQ9KcIBq0++hskHMDXj+dWV3fkGwLS8DMvO0dH+OkAf/9m/lIDcUucbRvKdUGKzF8TqQ
	+gaWCwiGj+ldOIgVhoEZKL576qn3p+eOvwuqkGvv7kY/U3l5sggk0MEZBkZe4VZIyS/4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186062-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186062: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=24dbf5bd03ff11dbcebb4d15e34fbba8eb34936b
X-Osstest-Versions-That:
    xen=9c5444b01ad51369bc09197a442a93d87b4b76f2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 May 2024 14:21:18 +0000

flight 186062 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186062/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  24dbf5bd03ff11dbcebb4d15e34fbba8eb34936b
baseline version:
 xen                  9c5444b01ad51369bc09197a442a93d87b4b76f2

Last test of basis   186056  2024-05-21 04:09:17 Z    0 days
Testing same since   186062  2024-05-21 10:00:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Petr Beneš <w1benny@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   9c5444b01a..24dbf5bd03  24dbf5bd03ff11dbcebb4d15e34fbba8eb34936b -> smoke

