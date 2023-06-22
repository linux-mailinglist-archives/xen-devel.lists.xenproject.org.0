Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7473973B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 08:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553282.863754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCDTj-0002mm-8y; Thu, 22 Jun 2023 06:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553282.863754; Thu, 22 Jun 2023 06:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCDTj-0002l7-63; Thu, 22 Jun 2023 06:07:35 +0000
Received: by outflank-mailman (input) for mailman id 553282;
 Thu, 22 Jun 2023 06:07:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCDTi-0002kx-1F; Thu, 22 Jun 2023 06:07:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCDTh-0006L9-NZ; Thu, 22 Jun 2023 06:07:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qCDTh-0002GE-Cw; Thu, 22 Jun 2023 06:07:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qCDTh-00006Z-CJ; Thu, 22 Jun 2023 06:07:33 +0000
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
	bh=JRLx5krB/JA6GNhxIyJ5tZcGDI65eLonR0Rayt7WdcI=; b=qNJb7yavxE8mr0+4f6/zjCk0qD
	mHcAhyNqp8aIjLT6BrnSVVqG5UVxoNpNA2BFgyZexaRGjRgGJA49DWZdCyka3lzJyNfZYsyC/LyuP
	p8Ei3U4TMblK9WiTcQVhEpKi2ZQz7Swg6scY3o58kI9e0TojtKKNeRKV1w1JwakfNh8k=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181547-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181547: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5c84f1f636981dab5341e84aaba8d4dd00bbc2cb
X-Osstest-Versions-That:
    xen=7a25a1501ca941c3e01b0c4e624ace05417f1587
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Jun 2023 06:07:33 +0000

flight 181547 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181547/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  5c84f1f636981dab5341e84aaba8d4dd00bbc2cb
baseline version:
 xen                  7a25a1501ca941c3e01b0c4e624ace05417f1587

Last test of basis   181476  2023-06-17 04:00:28 Z    5 days
Failing since        181504  2023-06-19 11:00:26 Z    2 days   10 attempts
Testing same since   181541  2023-06-21 22:01:56 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Jiamei Xie <jiamei.xie@arm.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>

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
   7a25a1501c..5c84f1f636  5c84f1f636981dab5341e84aaba8d4dd00bbc2cb -> smoke

