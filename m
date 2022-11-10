Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80726624E55
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 00:16:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442258.696326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otGmI-0007Bq-BH; Thu, 10 Nov 2022 23:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442258.696326; Thu, 10 Nov 2022 23:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otGmI-000792-8C; Thu, 10 Nov 2022 23:16:10 +0000
Received: by outflank-mailman (input) for mailman id 442258;
 Thu, 10 Nov 2022 23:16:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otGmF-00078s-Vw; Thu, 10 Nov 2022 23:16:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otGmF-0004dK-RC; Thu, 10 Nov 2022 23:16:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1otGmF-0003bz-9B; Thu, 10 Nov 2022 23:16:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1otGmF-0006NI-8g; Thu, 10 Nov 2022 23:16:07 +0000
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
	bh=LpCEI44gNuo7aDLGzYfMSG+R9nuE2V8r1+VCuKAKlyk=; b=XPacDIbi7H/6FsmDzm1IgR4V3Z
	mAOA0wjSSabcY+8ejTaAxO0/QXiVolifD5qLeocy2u/EcJnUiRZELTtexdMSRhDBGuJxWwP2cEMql
	Afy3gk5lGEWBMgxhXLqTxbLah9z3ioHjbsxuFuEIjOBQkG9QcvqbtdeAGQK7zWy+b51o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174725-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 174725: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=08c6f57cfebad4046dabc05092b4a27c61a39980
X-Osstest-Versions-That:
    xen=a4180b03fffafa1868b0bcacc20198d4caef2908
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 10 Nov 2022 23:16:07 +0000

flight 174725 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174725/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  08c6f57cfebad4046dabc05092b4a27c61a39980
baseline version:
 xen                  a4180b03fffafa1868b0bcacc20198d4caef2908

Last test of basis   174699  2022-11-09 21:00:29 Z    1 days
Testing same since   174725  2022-11-10 20:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Luca Fancellu <luca.fancellu@arm.com>

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
   a4180b03ff..08c6f57cfe  08c6f57cfebad4046dabc05092b4a27c61a39980 -> smoke

