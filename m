Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3794C3AC3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 02:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278703.476060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNPAy-0004t4-FH; Fri, 25 Feb 2022 01:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278703.476060; Fri, 25 Feb 2022 01:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNPAy-0004rA-CI; Fri, 25 Feb 2022 01:13:40 +0000
Received: by outflank-mailman (input) for mailman id 278703;
 Fri, 25 Feb 2022 01:13:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNPAx-0004r0-4F; Fri, 25 Feb 2022 01:13:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNPAw-0004ha-To; Fri, 25 Feb 2022 01:13:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nNPAw-0005N6-Ec; Fri, 25 Feb 2022 01:13:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nNPAw-0007uR-EA; Fri, 25 Feb 2022 01:13:38 +0000
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
	bh=FAqmUb7ZympTrw1G0AW89Mz68EnnZ/T1IHlfYsYj+JU=; b=xd2jJ4MtgwP6Vflbc/H3lIsN+M
	lkKpeb0Wg0lnXbwLy0vkinbL8i4KyxAAM/1Xswe1m59Ll4Wz1KG4JRTw4V4dBe447uJzoTgb3NKc/
	6BgVAv9knp2GG4MHONGWY8Dy6j6NZ1HKO9DWfp8X9T4LZNycDeC+h6EDqbs+Wmn1Duxs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168222-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 168222: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9ba4c529985a1773852069889a5b53f2ed26c408
X-Osstest-Versions-That:
    xen=66b467a0e86daff8caa2b571871b1cb96633df45
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 25 Feb 2022 01:13:38 +0000

flight 168222 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168222/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9ba4c529985a1773852069889a5b53f2ed26c408
baseline version:
 xen                  66b467a0e86daff8caa2b571871b1cb96633df45

Last test of basis   168218  2022-02-24 16:01:44 Z    0 days
Testing same since   168222  2022-02-24 21:02:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Julien Grall <jgrall@amazon.com>

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
   66b467a0e8..9ba4c52998  9ba4c529985a1773852069889a5b53f2ed26c408 -> smoke

