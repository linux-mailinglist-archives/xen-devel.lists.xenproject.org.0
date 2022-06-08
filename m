Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9254314D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 15:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343810.569339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyviW-0002pc-6o; Wed, 08 Jun 2022 13:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343810.569339; Wed, 08 Jun 2022 13:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyviW-0002nn-3r; Wed, 08 Jun 2022 13:27:24 +0000
Received: by outflank-mailman (input) for mailman id 343810;
 Wed, 08 Jun 2022 13:27:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyviV-0002nc-Gb; Wed, 08 Jun 2022 13:27:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyviV-0005aC-En; Wed, 08 Jun 2022 13:27:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyviV-0006I4-4U; Wed, 08 Jun 2022 13:27:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nyviV-0001BD-3v; Wed, 08 Jun 2022 13:27:23 +0000
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
	bh=9DRJ7pX7aib9PA/6iBUXJJBmHHmp/KoLdXb+KMqtBIw=; b=1Do2njb6la7SckPUQcFKcU5PtH
	2NAkPAOUC+wOcwBoaUhJEMj97XBBFGa9ERxdRYCBRzSsPwjn9Zbu4prjweiSIv82FoX/dDCLsE6ZY
	wGpfJthAp6JwMTShSRq2/LZRufCTcUhuQoUDYuKT7ReaSp13UQ0TBPfmjD5cb6eHlvgE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170883-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 170883: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5047cd1d5deaa734ce67b4d706ac59d9a258c3e1
X-Osstest-Versions-That:
    xen=8c1cc69748f4719e6ba8a275c2ecd60747c52c21
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Jun 2022 13:27:23 +0000

flight 170883 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170883/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  5047cd1d5deaa734ce67b4d706ac59d9a258c3e1
baseline version:
 xen                  8c1cc69748f4719e6ba8a275c2ecd60747c52c21

Last test of basis   170879  2022-06-08 01:00:32 Z    0 days
Testing same since   170883  2022-06-08 10:02:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Vrabel <dvrabel@amazon.co.uk>
  Henry Wang <Henry.Wang@arm.com>
  Julien Grall <jgrall@amazon.com>

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
   8c1cc69748..5047cd1d5d  5047cd1d5deaa734ce67b4d706ac59d9a258c3e1 -> smoke

