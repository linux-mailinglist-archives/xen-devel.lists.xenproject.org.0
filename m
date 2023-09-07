Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DFD796FD1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 07:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597097.931283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe7P1-0003OT-NL; Thu, 07 Sep 2023 05:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597097.931283; Thu, 07 Sep 2023 05:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe7P1-0003Mm-Ke; Thu, 07 Sep 2023 05:18:03 +0000
Received: by outflank-mailman (input) for mailman id 597097;
 Thu, 07 Sep 2023 05:18:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qe7P0-0003Mc-UW; Thu, 07 Sep 2023 05:18:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qe7P0-0007G0-Pi; Thu, 07 Sep 2023 05:18:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qe7P0-0002X0-Es; Thu, 07 Sep 2023 05:18:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qe7P0-0004R7-EN; Thu, 07 Sep 2023 05:18:02 +0000
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
	bh=YeE0m2NihQtJPiHpWBZTdzXaULnBBWLYRueVvaa4/0g=; b=US2dYsci56XibPG2mSugL+bWbi
	0/dH0c/Sh91wtL/54TE2pyB/QS1LlvR9BoBv64WWtBmm+dawgplt/tSOcHunlM0rsin5MCMxBbjmy
	TiH1/aTnvRDm1Bwg5Efmuz47iWF4RIRzQjHE4EW53ztlFhT6chdBN9KftQ8X7Dk+cog8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182709-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182709: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b2dd946ece74e2b6e0601f28caef72f4f9950102
X-Osstest-Versions-That:
    xen=d8c3ff585b9fd10200b05aca77139de2789d0517
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Sep 2023 05:18:02 +0000

flight 182709 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182709/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b2dd946ece74e2b6e0601f28caef72f4f9950102
baseline version:
 xen                  d8c3ff585b9fd10200b05aca77139de2789d0517

Last test of basis   182674  2023-09-06 14:00:33 Z    0 days
Testing same since   182709  2023-09-07 02:00:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jens Wiklander <jens.wiklander@linaro.org>
  Michal Orzel <michal.orzel@amd.com>
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
   d8c3ff585b..b2dd946ece  b2dd946ece74e2b6e0601f28caef72f4f9950102 -> smoke

