Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0C83915F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 15:30:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670497.1043322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHmj-0007n6-Nj; Tue, 23 Jan 2024 14:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670497.1043322; Tue, 23 Jan 2024 14:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSHmj-0007jz-KO; Tue, 23 Jan 2024 14:29:53 +0000
Received: by outflank-mailman (input) for mailman id 670497;
 Tue, 23 Jan 2024 14:29:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSHmi-0007jc-3Y; Tue, 23 Jan 2024 14:29:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSHmi-0008Vx-0p; Tue, 23 Jan 2024 14:29:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSHmh-0001EN-KN; Tue, 23 Jan 2024 14:29:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rSHmh-0000cK-Jy; Tue, 23 Jan 2024 14:29:51 +0000
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
	bh=8m0gy2jNmhaS6XeFrd2CUvRkBlPRp8oQq4/F+OZ4xOQ=; b=AWQMO9ggQgRRnoivajzLQxExu8
	xctBIeGl7S4xP/AGhQdjki3q449t4w85nbrpXLc3o8p9tngwEmBwjvR5EtZzL6s3/NCe8eud5Xwv4
	zqhupVEG6rsM2OPNjc5g0yN8nwUPjMxgYlDP64PRckxNI08QN7dsZGt7EoV33lAg00uQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184433-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184433: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f67bddf3bccd99a5fee968c3b3f288db6a57d3be
X-Osstest-Versions-That:
    xen=4900c939cb9b876c51cfc7a4c854f54c722a30b5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jan 2024 14:29:51 +0000

flight 184433 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184433/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f67bddf3bccd99a5fee968c3b3f288db6a57d3be
baseline version:
 xen                  4900c939cb9b876c51cfc7a4c854f54c722a30b5

Last test of basis   184424  2024-01-22 13:00:26 Z    1 days
Testing same since   184433  2024-01-23 12:03:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>

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
   4900c939cb..f67bddf3bc  f67bddf3bccd99a5fee968c3b3f288db6a57d3be -> smoke

