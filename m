Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61855ABCC
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jun 2022 19:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356024.584012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o59r0-0008E5-0I; Sat, 25 Jun 2022 17:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356024.584012; Sat, 25 Jun 2022 17:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o59qz-0008Bh-Tj; Sat, 25 Jun 2022 17:45:53 +0000
Received: by outflank-mailman (input) for mailman id 356024;
 Sat, 25 Jun 2022 17:45:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o59qy-0008BX-7e; Sat, 25 Jun 2022 17:45:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o59qy-0006Rk-6R; Sat, 25 Jun 2022 17:45:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o59qx-0005CU-HV; Sat, 25 Jun 2022 17:45:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o59qx-0006xE-H3; Sat, 25 Jun 2022 17:45:51 +0000
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
	bh=WBO/vTUhWfX1kVAxOqtcIn9UvSd4uLOUIR+9tTwUo5s=; b=F3yYjSB4JMUAfosVy6vg6Lg3aG
	HEU3Mc4WvGk4jx8fHmWrDnnDHaNB73iZOxiZVA0Ll1ar2KelIE2mecsL1RrggC71ACO4vHINT5Ecp
	KmVWPJELbNzlZ2j1euqc4CBkxJRTIVFI2RzQzZvGFclhNwd/P8q7qYtxkUD7c30S/lIE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171354-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171354: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0544c4ee4b48f7e2715e69ff3e73c3d5545b0526
X-Osstest-Versions-That:
    xen=7c1f724dd95cf627f72c96d310b6b7d487bc2281
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Jun 2022 17:45:51 +0000

flight 171354 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171354/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0544c4ee4b48f7e2715e69ff3e73c3d5545b0526
baseline version:
 xen                  7c1f724dd95cf627f72c96d310b6b7d487bc2281

Last test of basis   171333  2022-06-23 19:03:05 Z    1 days
Testing same since   171354  2022-06-25 15:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
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
   7c1f724dd9..0544c4ee4b  0544c4ee4b48f7e2715e69ff3e73c3d5545b0526 -> smoke

