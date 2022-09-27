Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC865EB76E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 04:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412178.655388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od096-0004wu-Fn; Tue, 27 Sep 2022 02:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412178.655388; Tue, 27 Sep 2022 02:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od096-0004u5-Cd; Tue, 27 Sep 2022 02:16:28 +0000
Received: by outflank-mailman (input) for mailman id 412178;
 Tue, 27 Sep 2022 02:16:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1od094-0004tv-M5; Tue, 27 Sep 2022 02:16:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1od094-0006MC-L3; Tue, 27 Sep 2022 02:16:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1od094-0005IG-5S; Tue, 27 Sep 2022 02:16:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1od094-0002If-3h; Tue, 27 Sep 2022 02:16:26 +0000
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
	bh=fr4w21pqDuw6k//FRqk8yh737R1pX968w4RndeZLZug=; b=x8myAazwihnOpfc+4GX1I0/bC1
	5qkZE3lwatmdu7opBrQVTggYfFjqDd8DoN5TgBpZN1D21fvlSo5y4wHDS+eP5T9av4XYWYyXZh4on
	mEDwuCKNcVWsK2l7aJit43dCrodflbcX6EFVeIIvqRJ1B+XIcXwiDFVkxgMBckym4Bws=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173320-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173320: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=bd68a5f397537eb7ba6223546c1f4d47f078d3b2
X-Osstest-Versions-That:
    xen=bfd3e9945d1bc551ad11272c7fa752ff3d060149
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Sep 2022 02:16:26 +0000

flight 173320 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173320/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  bd68a5f397537eb7ba6223546c1f4d47f078d3b2
baseline version:
 xen                  bfd3e9945d1bc551ad11272c7fa752ff3d060149

Last test of basis   173315  2022-09-26 10:01:54 Z    0 days
Testing same since   173320  2022-09-26 23:01:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michal Orzel <michal.orzel@amd.com>

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
   bfd3e9945d..bd68a5f397  bd68a5f397537eb7ba6223546c1f4d47f078d3b2 -> smoke

