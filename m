Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D393588FA8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 17:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379998.613968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJGd6-0004iU-Qp; Wed, 03 Aug 2022 15:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379998.613968; Wed, 03 Aug 2022 15:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJGd6-0004gg-Nq; Wed, 03 Aug 2022 15:49:52 +0000
Received: by outflank-mailman (input) for mailman id 379998;
 Wed, 03 Aug 2022 15:49:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJGd5-0004gW-JH; Wed, 03 Aug 2022 15:49:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJGd5-0003de-IB; Wed, 03 Aug 2022 15:49:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oJGd5-0003Ow-7H; Wed, 03 Aug 2022 15:49:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oJGd5-00006j-6n; Wed, 03 Aug 2022 15:49:51 +0000
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
	bh=DbwuOfGXCJtSuyMPXrvWv60gRiDBh5dTwphZfM2/a7w=; b=uZjQBUMsv99b1HiQecakIuENN2
	nKHw9wYL/G1jdQflcmQZl0Dp7Tftqjyp1MgpXunGUmRDn20V2wy2HDnG4ye3AjVIMh3s4AQmaItl/
	tBgV1A0k0OshidZITM+DQNpl5wTuLdpSudQM9htneTxlNVcCg171UUgr4BaG7IZITjjk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172116-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 172116: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=01ca29f0b17a50a94b0e232ba276c32e95d80ae3
X-Osstest-Versions-That:
    xen=800f21499e0ec112771ce1e94490ca5811578bc2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Aug 2022 15:49:51 +0000

flight 172116 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172116/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           6 libvirt-build                fail  like 172107
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  01ca29f0b17a50a94b0e232ba276c32e95d80ae3
baseline version:
 xen                  800f21499e0ec112771ce1e94490ca5811578bc2

Last test of basis   172107  2022-08-03 10:01:49 Z    0 days
Testing same since   172116  2022-08-03 13:00:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Lindig <christian.lindig@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Dario Faggioli <dfaggioli@suse.com>
  Edwin Török <edvin.torok@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     blocked 


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
   800f21499e..01ca29f0b1  01ca29f0b17a50a94b0e232ba276c32e95d80ae3 -> smoke

