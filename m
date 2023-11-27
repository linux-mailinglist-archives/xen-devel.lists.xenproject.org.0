Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F17FA89E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 19:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642389.1001835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7g17-00086Q-LQ; Mon, 27 Nov 2023 18:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642389.1001835; Mon, 27 Nov 2023 18:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7g17-00083f-Ia; Mon, 27 Nov 2023 18:07:33 +0000
Received: by outflank-mailman (input) for mailman id 642389;
 Mon, 27 Nov 2023 18:07:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7g15-00083V-MK; Mon, 27 Nov 2023 18:07:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7g15-0002qf-G0; Mon, 27 Nov 2023 18:07:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7g15-0005tA-4l; Mon, 27 Nov 2023 18:07:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r7g15-0000us-4I; Mon, 27 Nov 2023 18:07:31 +0000
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
	bh=z8pEe0SkpZhulk3sM56x/bFQ6eetXtnnnCWR7OrkL9g=; b=zpEaQrBk5SC7dEULZ2NyIq/jvE
	lJe5l3oHuHZiTpC6MWmpdDnNTzLG0rBhCucDfvhjYZsTxhyt4y5GDelhNtgNsUvhgm6q/RHCDDoHL
	aWLaO02TOn0dYpWZ9sEf2/gWESJ3RsBZ5SIo+uT8uV32JHOd6VlROXSidH5PmfNMqnvY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183871-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183871: trouble: blocked/broken
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:<job status>:broken:regression
    xen-unstable-smoke:build-arm64-xsm:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
    xen-unstable-smoke:build-amd64:host-install(4):broken:regression
    xen-unstable-smoke:build-armhf:host-install(4):broken:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=fbcec32d6d3ea0ac329301925b317478316209ed
X-Osstest-Versions-That:
    xen=80c153c48b255bae61948827241c26671207cf4e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 27 Nov 2023 18:07:31 +0000

flight 183871 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183871/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 183851
 build-amd64                   4 host-install(4)        broken REGR. vs. 183851
 build-armhf                   4 host-install(4)        broken REGR. vs. 183851

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  fbcec32d6d3ea0ac329301925b317478316209ed
baseline version:
 xen                  80c153c48b255bae61948827241c26671207cf4e

Last test of basis   183851  2023-11-24 09:03:53 Z    3 days
Testing same since   183871  2023-11-27 14:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 build-arm64-xsm                                              broken  
 build-amd64                                                  broken  
 build-armhf                                                  broken  
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
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

broken-job build-amd64 broken
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-step build-arm64-xsm host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit fbcec32d6d3ea0ac329301925b317478316209ed
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Wed Nov 22 16:39:55 2023 +0000

    x86/mem_sharing: Release domain if we are not able to enable memory sharing
    
    In case it's not possible to enable memory sharing (mem_sharing_control
    fails) we just return the error code without releasing the domain
    acquired some lines above by rcu_lock_live_remote_domain_by_id().
    
    Fixes: 72f8d45d69b8 ("x86/mem_sharing: enable mem_sharing on first memop")
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit b9eeb1992676ec83cee285b97fee94d03eaa9836
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Wed Nov 22 16:26:20 2023 +0000

    x86/mem_sharing: Fix typo in comment
    
    ambigious -> ambiguous
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
(qemu changes not included)

