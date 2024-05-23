Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE18CD83B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 18:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728741.1133789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAB8N-0007IS-4l; Thu, 23 May 2024 16:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728741.1133789; Thu, 23 May 2024 16:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAB8N-0007Ga-0B; Thu, 23 May 2024 16:17:39 +0000
Received: by outflank-mailman (input) for mailman id 728741;
 Thu, 23 May 2024 16:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAB8L-0007GK-SG; Thu, 23 May 2024 16:17:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAB8L-0001PK-P6; Thu, 23 May 2024 16:17:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAB8L-00088e-Hj; Thu, 23 May 2024 16:17:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sAB8L-0007XJ-HJ; Thu, 23 May 2024 16:17:37 +0000
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
	bh=+PGLZ1v+R/YJswu1PZStCxY8HenNqwOr4bBvDGp7UOY=; b=SctHZbdf35kkxmAsnkc73txuoD
	qNP3llPDpoS+8NUWQ6Bum74RCJthJiyY6E33AxypIll4LpBD4ScUv9KK8eeh0NqVoXaFFNeXFPVyp
	1KS2zdSS8zOGbkO15q9dJu/XtcaVKty2D3M3m1H8et0LanRCAZZC+SulhEyiG3YKr1mc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186108: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9e58da32cc844b3fb7612fc35ece3a96f8cbf744
X-Osstest-Versions-That:
    xen=ced21fbb2842ac4655048bdee56232974ff9ff9c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 May 2024 16:17:37 +0000

flight 186108 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186108/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 186064

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9e58da32cc844b3fb7612fc35ece3a96f8cbf744
baseline version:
 xen                  ced21fbb2842ac4655048bdee56232974ff9ff9c

Last test of basis   186064  2024-05-21 15:04:02 Z    2 days
Failing since        186104  2024-05-23 09:00:22 Z    0 days    3 attempts
Testing same since   186108  2024-05-23 14:00:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Bobby Eshleman <bobbyeshleman@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stewart Hildebrand <stewart.hildebrand@amd.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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


Not pushing.

(No revision log; it would be 406 lines long.)

