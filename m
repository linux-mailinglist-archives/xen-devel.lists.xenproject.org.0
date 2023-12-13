Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04075811F1C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 20:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654229.1020907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDV6K-0008JT-Gy; Wed, 13 Dec 2023 19:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654229.1020907; Wed, 13 Dec 2023 19:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDV6K-0008H0-Dr; Wed, 13 Dec 2023 19:41:00 +0000
Received: by outflank-mailman (input) for mailman id 654229;
 Wed, 13 Dec 2023 19:40:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDV6I-0008Gq-69; Wed, 13 Dec 2023 19:40:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDV6I-0008RC-3U; Wed, 13 Dec 2023 19:40:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDV6H-0005Hx-Jw; Wed, 13 Dec 2023 19:40:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rDV6H-0005XM-J8; Wed, 13 Dec 2023 19:40:57 +0000
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
	bh=NRZSI8N27QXPSbKmHjfs1OCcfw7fYkf74gm3J8SiiDM=; b=cVVzs56zv+GMGclbbW2T1V59j1
	tnnpJA2Mc/RVzQH5I/z0zgF0NmeymsS74Ifhib7XwUugirWfLgkUWTC9wR09pyh/EnYxQjE7u1yMM
	/7V6bx7uKnZWIe/e+dYgyVIzxTsJKTil1hSpI6wgEh1gObiyrXCbhQeppG9ZDviCR0C0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184128-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184128: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=75571e162b78b73401307ce40f732021ae57d49a
X-Osstest-Versions-That:
    xen=a236b74b961faa045640275605e319bba45483c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Dec 2023 19:40:57 +0000

flight 184128 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184128/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  75571e162b78b73401307ce40f732021ae57d49a
baseline version:
 xen                  a236b74b961faa045640275605e319bba45483c1

Last test of basis   184125  2023-12-13 13:02:06 Z    0 days
Testing same since   184128  2023-12-13 17:02:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jens Wiklander <jens.wiklander@linaro.org>

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
   a236b74b96..75571e162b  75571e162b78b73401307ce40f732021ae57d49a -> smoke

