Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE3794215
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 19:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596764.930791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdwNc-0006ZT-O5; Wed, 06 Sep 2023 17:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596764.930791; Wed, 06 Sep 2023 17:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdwNc-0006X2-LI; Wed, 06 Sep 2023 17:31:52 +0000
Received: by outflank-mailman (input) for mailman id 596764;
 Wed, 06 Sep 2023 17:31:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdwNb-0006Ws-74; Wed, 06 Sep 2023 17:31:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdwNb-0004ix-4K; Wed, 06 Sep 2023 17:31:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qdwNa-0004pu-S2; Wed, 06 Sep 2023 17:31:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qdwNa-0007B8-Rd; Wed, 06 Sep 2023 17:31:50 +0000
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
	bh=YfWk3zDC59uaFxVbJxabhfShOoyXK9q4LoCBnhA8tNw=; b=oX/x+8c9ElXkjcObn0DAz3cePw
	qHF0X3/Jah4Y6ZD0O6UEfxfJbE04uekdiODe/OCGHjA2s/xnydq3q8qt+oGtx9O1RKRs0qZcdRk2y
	wWMOIgCMxb0YeKDqtSgPPlmk+Hxk7ORifA86LjkPF9NDNEJXtXrvW1N5lnKwizN4NF70=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182674-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182674: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d8c3ff585b9fd10200b05aca77139de2789d0517
X-Osstest-Versions-That:
    xen=9a216e92de9f9011097e4f1fb55ff67ba0a21704
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Sep 2023 17:31:50 +0000

flight 182674 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182674/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d8c3ff585b9fd10200b05aca77139de2789d0517
baseline version:
 xen                  9a216e92de9f9011097e4f1fb55ff67ba0a21704

Last test of basis   182635  2023-09-05 13:00:27 Z    1 days
Failing since        182641  2023-09-06 02:02:08 Z    0 days    4 attempts
Testing same since   182674  2023-09-06 14:00:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Gibson <david@gibson.dropbear.id.au>
  Henry Wang <Henry.Wang@arm.com>
  Julien Grall <jgrall@amazon.com>
  Juline Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@amd.com>
  Vikram Garhwal <fnu.vikram@xilinx.com>
  Vikram Garhwal <vikram.garhwal@amd.com>

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
   9a216e92de..d8c3ff585b  d8c3ff585b9fd10200b05aca77139de2789d0517 -> smoke

