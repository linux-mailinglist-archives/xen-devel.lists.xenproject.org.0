Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3AA75FC59
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 18:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569156.889431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNyam-0006ZC-Vp; Mon, 24 Jul 2023 16:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569156.889431; Mon, 24 Jul 2023 16:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNyam-0006W2-Ry; Mon, 24 Jul 2023 16:39:28 +0000
Received: by outflank-mailman (input) for mailman id 569156;
 Mon, 24 Jul 2023 16:39:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNyal-0006Vs-LA; Mon, 24 Jul 2023 16:39:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNyal-0006NZ-Ik; Mon, 24 Jul 2023 16:39:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNyak-0002cs-Ej; Mon, 24 Jul 2023 16:39:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qNyak-0007oi-EA; Mon, 24 Jul 2023 16:39:26 +0000
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
	bh=6MXRL5qJn3ruIdLSI9Sfho4M8R6kbF216OPvjL4BigI=; b=PSRTD+uZDVTg5GXeuBiPcxIauS
	ZR+SmRxfGV6KzIU/a4i6vaT+Vv7x4Z37b1ERBc83KZyBNVk3ki7hMcsgsXn+82AhKBd96U9f4yLau
	yD6zPd0gW3iLVAPCttBDxh+9vB4zArLOV509ccqZtijl9nIMFFz1R4pEankPYdoHAEgQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181991-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181991: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3a4e6f67bc689365680cd544d05c8772f56b7a91
X-Osstest-Versions-That:
    xen=0c53c638e16278078371ce028c74693841d7738a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Jul 2023 16:39:26 +0000

flight 181991 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181991/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3a4e6f67bc689365680cd544d05c8772f56b7a91
baseline version:
 xen                  0c53c638e16278078371ce028c74693841d7738a

Last test of basis   181956  2023-07-21 11:02:28 Z    3 days
Testing same since   181991  2023-07-24 13:02:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Federico Serafini <federico.serafini@bugseng.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Viresh Kumar <viresh.kumar@linaro.org>

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
   0c53c638e1..3a4e6f67bc  3a4e6f67bc689365680cd544d05c8772f56b7a91 -> smoke

