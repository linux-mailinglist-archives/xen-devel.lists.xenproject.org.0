Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA16D6CA7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 20:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518127.804343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjlk1-0007Df-U5; Tue, 04 Apr 2023 18:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518127.804343; Tue, 04 Apr 2023 18:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjlk1-0007A6-R4; Tue, 04 Apr 2023 18:50:49 +0000
Received: by outflank-mailman (input) for mailman id 518127;
 Tue, 04 Apr 2023 18:50:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjljz-00079w-Pr; Tue, 04 Apr 2023 18:50:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjljz-0003dr-OB; Tue, 04 Apr 2023 18:50:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjljz-0001mv-Bl; Tue, 04 Apr 2023 18:50:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pjljz-0005Y1-B2; Tue, 04 Apr 2023 18:50:47 +0000
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
	bh=V3Qio32KoVcucSR4U73bxtt9sgm0NSQNh+tVBbU+crI=; b=L/xh3opJhIgwI+dm6A8BdInCIK
	bRLhSzhmXNCVeXubtTWVliP095JiFaMs+JKFkrbCSucDFhOKGtlFUoqmX1UyFURWl+CwqwtDHuwxy
	4RR5AcDxmo2XJEzM5I1aj8ILQaL4tqX70PNicoOstzH63yVxSg/73S2fHsUkg64qqB+4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180140-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180140: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=415f7d9404171cbc968b1ea22e7d3523ac2f3fc1
X-Osstest-Versions-That:
    xen=658fcb7ac90a4d8b0f4736a7c8f21d0252cb492e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Apr 2023 18:50:47 +0000

flight 180140 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180140/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 180137

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  415f7d9404171cbc968b1ea22e7d3523ac2f3fc1
baseline version:
 xen                  658fcb7ac90a4d8b0f4736a7c8f21d0252cb492e

Last test of basis   180137  2023-04-04 14:03:39 Z    0 days
Testing same since   180140  2023-04-04 17:01:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-arm64-arm64-xl-xsm                                      blocked 
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

------------------------------------------------------------
commit 415f7d9404171cbc968b1ea22e7d3523ac2f3fc1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Apr 4 17:35:52 2023 +0100

    Revert "Revert "build: Change remaining xenbits.xen.org link to HTTPS""
    
    This reverts commit b5cc3c25a242ddb9c5b108884061b17f35c3084b, reinstating the
    original change as per e1d75084443f676be681fdaf47585cc9a5f5b820.
    
    We think the OSSTest failure has been addressed now.
    
    Link: https://lore.kernel.org/xen-devel/20d41dd0-19d1-47fb-92ab-4de458ddd56f@perard/
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

