Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C3514428
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 10:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317033.536165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLvw-0004iy-2v; Fri, 29 Apr 2022 08:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317033.536165; Fri, 29 Apr 2022 08:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLvv-0004gy-Ul; Fri, 29 Apr 2022 08:24:59 +0000
Received: by outflank-mailman (input) for mailman id 317033;
 Fri, 29 Apr 2022 08:24:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkLvt-0004go-SS; Fri, 29 Apr 2022 08:24:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkLvt-00030F-Qs; Fri, 29 Apr 2022 08:24:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nkLvt-0001BC-GN; Fri, 29 Apr 2022 08:24:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nkLvt-0007Cx-Fx; Fri, 29 Apr 2022 08:24:57 +0000
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
	bh=loNI+bYbtdvbqcAmMqFJyAeWPybAA5aHTx2I3GG3WxI=; b=6q0H2oWdSsacrZYTp8689xNzs0
	eiwiik/eN+6c1crVhCRPG+7LE9tFXHQHGZJyJ540++2y3eehZ1zYM6aP8vHXpLnuOltvMkk8mq7Jy
	hOx/EbSM+D+qk1qWyAa5Ecac7lhBFGgangeKP3XF3EFl3AqtrYIv49UmLP4p3f2mQjnM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169853-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169853: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e57477359071ab91429b0ebcbf7ff162242e2831
X-Osstest-Versions-That:
    xen=d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Apr 2022 08:24:57 +0000

flight 169853 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169853/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e57477359071ab91429b0ebcbf7ff162242e2831
baseline version:
 xen                  d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed

Last test of basis   169824  2022-04-28 16:00:24 Z    0 days
Testing same since   169840  2022-04-29 00:00:26 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <julien@xen.org>
  Rahul Singh <rahul.singh@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   d711a8e527..e574773590  e57477359071ab91429b0ebcbf7ff162242e2831 -> smoke

