Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588EF2EF081
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 11:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63280.112375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxoov-0002FN-Bv; Fri, 08 Jan 2021 10:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63280.112375; Fri, 08 Jan 2021 10:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxoov-0002Ex-7t; Fri, 08 Jan 2021 10:16:37 +0000
Received: by outflank-mailman (input) for mailman id 63280;
 Fri, 08 Jan 2021 10:16:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxoou-0002Ep-NS; Fri, 08 Jan 2021 10:16:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxoou-0005u0-HQ; Fri, 08 Jan 2021 10:16:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxoou-0007Jm-9H; Fri, 08 Jan 2021 10:16:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kxoou-000346-8o; Fri, 08 Jan 2021 10:16:36 +0000
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
	bh=AhpjboiRDfXwYFBrZ3qNflJwTcz/YRtQA/Roiea3ewc=; b=4ugvLal11C7ynv/CNQZzvIaOGl
	Rb+7s4L/bBbsR26X//48aaonkASzdInWoEo6imyYo4mHu4cpkRfYPtA18I/RDZc7zE5IhQPGbC0EG
	83bRnK9/HYJcyYgZtHBjZeeZwGj0hAaqQL1SopYVeHO4nDrpWGRn7kJ71BU1Rdgce69Q=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158275-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158275: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=994f6478a48a60e3b407c7defc2d36a80f880b04
X-Osstest-Versions-That:
    xen=7ba2ab495be54f608cb47440e1497b2795bd301a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Jan 2021 10:16:36 +0000

flight 158275 xen-unstable-smoke real [real]
flight 158277 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/158275/
http://logs.test-lab.xenproject.org/osstest/logs/158277/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 158134

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  994f6478a48a60e3b407c7defc2d36a80f880b04
baseline version:
 xen                  7ba2ab495be54f608cb47440e1497b2795bd301a

Last test of basis   158134  2021-01-04 15:01:26 Z    3 days
Failing since        158142  2021-01-05 02:00:25 Z    3 days   19 attempts
Testing same since   158256  2021-01-07 15:00:25 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Manuel Bouyer <bouyer@antioche.eu.org>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Liu <wl@xen.org>

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

(No revision log; it would be 554 lines long.)

