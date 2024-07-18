Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FD9370D2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 00:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760788.1170706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZqs-0004tw-MI; Thu, 18 Jul 2024 22:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760788.1170706; Thu, 18 Jul 2024 22:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZqs-0004rr-J6; Thu, 18 Jul 2024 22:43:54 +0000
Received: by outflank-mailman (input) for mailman id 760788;
 Thu, 18 Jul 2024 22:43:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUZqr-0004rh-HN; Thu, 18 Jul 2024 22:43:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUZqr-0004PO-Ev; Thu, 18 Jul 2024 22:43:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sUZqr-0006GB-7b; Thu, 18 Jul 2024 22:43:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sUZqr-0000Pt-78; Thu, 18 Jul 2024 22:43:53 +0000
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
	bh=aPE/EmsgvKl2BZ/CqwnRVvWUq0UHu8Ds1QyHGbeobR4=; b=rUWnjurXjctz9WGIGhy26glB2s
	ubi7oC2KAc6SoJWk5PFfRJeXRTh+Zp6ghJOAnNaNRGtG9veJpCx3BUo/Ehy/WcYCj0DHFf9fnsW59
	L0UIpH5x+zLCT3IuASkpLjEcbWGBSFEEYkXCX0PpcZtupQdy8ZNOZyQYWl+aCZHK9Lmc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186883-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186883: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-install:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:xen-install:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-install:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=a99f25f7ac60544e9af4b3b516d7566ba8841cc4
X-Osstest-Versions-That:
    xen=57338346f29cea7b183403561bdc5f407163b846
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Jul 2024 22:43:53 +0000

flight 186883 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186883/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  7 xen-install fail REGR. vs. 186826
 test-amd64-amd64-libvirt      7 xen-install              fail REGR. vs. 186826
 test-arm64-arm64-xl-xsm       7 xen-install              fail REGR. vs. 186826
 build-armhf                   6 xen-build                fail REGR. vs. 186826

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  a99f25f7ac60544e9af4b3b516d7566ba8841cc4
baseline version:
 xen                  57338346f29cea7b183403561bdc5f407163b846

Last test of basis   186826  2024-07-16 19:00:25 Z    2 days
Failing since        186880  2024-07-18 15:00:30 Z    0 days    2 attempts
Testing same since   186883  2024-07-18 21:11:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-libvirt                                     fail    


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

------------------------------------------------------------
commit a99f25f7ac60544e9af4b3b516d7566ba8841cc4
Author: Julien Grall <julien@xen.org>
Date:   Thu Jul 18 16:51:02 2024 +0100

    CHANGELOG.md: Start new 4.20.0 section
    
    Signed-off-by: Julien Grall <julien@xen.org>

commit 974ad0926e4616444dc0c1d83ba86bd6eb8dd52d
Author: Julien Grall <julien@xen.org>
Date:   Thu Jul 18 16:48:06 2024 +0100

    CHANGELOG.md: Set release date for 4.19
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>

commit 285937175be2509bc5b4c2eff2ec0b2fa758ff69
Author: Julien Grall <julien@xen.org>
Date:   Thu Jul 18 16:00:47 2024 +0100

    Re-run ./autogens.h for 4.20
    
    Signed-off-by: Julien Grall <julien@xen.org>

commit f66e523189f1130a2fd3b77a9f0c8ac152355ac8
Author: Julien Grall <julien@xen.org>
Date:   Thu Jul 18 15:42:58 2024 +0100

    Set version to 4.20; 4.19 has branched
    
    Signed-off-by: Julien Grall <julien@xen.org>

commit b181bb9fdbae9cdae96f979cfcc30c6195071417
Author: Julien Grall <julien@xen.org>
Date:   Thu Jul 18 15:40:44 2024 +0100

    Revert "Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen 4.19 RC1)"
    
    The branch is unstable again.
    
    This reverts commit 7584e39986ef2cb4816892ffaefb26f4ad063468.
(qemu changes not included)

