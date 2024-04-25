Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCA8B19BC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 05:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711780.1112008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzq8x-00049V-Qq; Thu, 25 Apr 2024 03:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711780.1112008; Thu, 25 Apr 2024 03:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzq8x-00047E-OH; Thu, 25 Apr 2024 03:51:31 +0000
Received: by outflank-mailman (input) for mailman id 711780;
 Thu, 25 Apr 2024 03:51:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzq8w-000471-LB; Thu, 25 Apr 2024 03:51:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzq8w-0001XT-ET; Thu, 25 Apr 2024 03:51:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzq8w-0000SL-2V; Thu, 25 Apr 2024 03:51:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzq8w-0006g6-09; Thu, 25 Apr 2024 03:51:30 +0000
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
	bh=rDGTqBslwzqGJ3+tIvgyj1BE/wUtENnQuvkSPdENvM4=; b=o6Rq8I/LAXBgMplRE1uLmFZAD7
	3TmGgqnYi/pkKBwRFK1SMZ/927TJ2YQDRHVyrI7hDZE02Q9wlNqgxI4Gdccy+eSSnad1LPrIQIfUI
	iuUq1PSt5buTIWtZ+dz9tOlmgqWqec1LysMteQeqreoUeF1JcrCbiGsy7ZGfS1IOSnTk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185790-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185790: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=31d6b5b4a7c84818294dacca7a07e92f52393c9d
X-Osstest-Versions-That:
    xen=7846f7699fea25502061a05ea847e942ea624f12
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Apr 2024 03:51:30 +0000

flight 185790 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185790/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  31d6b5b4a7c84818294dacca7a07e92f52393c9d
baseline version:
 xen                  7846f7699fea25502061a05ea847e942ea624f12

Last test of basis   185788  2024-04-24 19:04:02 Z    0 days
Testing same since   185790  2024-04-25 01:00:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   7846f7699f..31d6b5b4a7  31d6b5b4a7c84818294dacca7a07e92f52393c9d -> smoke

