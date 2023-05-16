Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80C70444E
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 06:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534924.832427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pymCV-0006oT-7H; Tue, 16 May 2023 04:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534924.832427; Tue, 16 May 2023 04:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pymCV-0006lQ-3q; Tue, 16 May 2023 04:22:15 +0000
Received: by outflank-mailman (input) for mailman id 534924;
 Tue, 16 May 2023 04:22:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pymCT-0006lG-H2; Tue, 16 May 2023 04:22:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pymCT-0003Ju-Bl; Tue, 16 May 2023 04:22:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pymCS-0005vG-Qt; Tue, 16 May 2023 04:22:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pymCS-0005Ep-QI; Tue, 16 May 2023 04:22:12 +0000
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
	bh=4lhzNV39QYQTHP5exTskWrMeOIJ6EafMeijYq3KKQb4=; b=tZpMJHYVZASvG4w6bB4WH85iVG
	X4uepBSl8YAqJtg9JSjF6vWh8sZKfvAeEUAI9eRKxhKWO9GMcuLO+s48bd/7zK+Z48PLhB15QLvgH
	NkAyQD8MqZ3kDsqYxaJx/07009R4gWOMxLd32wKfBij1mQvIRh6eEpibzYSe0k9OUoL8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180678-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180678: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8f9c8274a4e3e860bd777269cb2c91971e9fa69e
X-Osstest-Versions-That:
    xen=56e2c8e5860090a35d5f0cafe168223a2a7c0e62
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 May 2023 04:22:12 +0000

flight 180678 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180678/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8f9c8274a4e3e860bd777269cb2c91971e9fa69e
baseline version:
 xen                  56e2c8e5860090a35d5f0cafe168223a2a7c0e62

Last test of basis   180672  2023-05-15 14:00:25 Z    0 days
Failing since        180676  2023-05-15 23:03:30 Z    0 days    2 attempts
Testing same since   180678  2023-05-16 01:02:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
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
   56e2c8e586..8f9c8274a4  8f9c8274a4e3e860bd777269cb2c91971e9fa69e -> smoke

