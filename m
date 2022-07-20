Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD9A57C01E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 00:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372427.604203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEIH2-0000hJ-2h; Wed, 20 Jul 2022 22:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372427.604203; Wed, 20 Jul 2022 22:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEIH1-0000eQ-WB; Wed, 20 Jul 2022 22:34:31 +0000
Received: by outflank-mailman (input) for mailman id 372427;
 Wed, 20 Jul 2022 22:34:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEIH0-0000eG-7c; Wed, 20 Jul 2022 22:34:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEIH0-0002m5-5h; Wed, 20 Jul 2022 22:34:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEIGz-00026l-LH; Wed, 20 Jul 2022 22:34:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oEIGz-0001Nu-Kp; Wed, 20 Jul 2022 22:34:29 +0000
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
	bh=4ydjkivqPjzaRqHFa42uMFs9h7WaPEtjTw6wQFX/Z4c=; b=Mufj1O3JLOn+rCNh4FOh6Re4+Z
	37VUQH7cjbaLIfwvJOCLLgq1z8jjbx/p8MOsOb6LhrMDGBcHXi6Ci5EHBknoHmjJvotSLPE5xDCLs
	TI+W24oW/v0/3Sxv5JBAzL6ToooOMbtuEPwro++pDTcATd7ZbIlNVVE4kofFinQlLLhc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171708-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171708: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d2cc5633e2800e698c6a64554de7fa19d9627a24
X-Osstest-Versions-That:
    xen=6fe2e39a0243bddba60f83b77b972a5922d25eb8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Jul 2022 22:34:29 +0000

flight 171708 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171708/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d2cc5633e2800e698c6a64554de7fa19d9627a24
baseline version:
 xen                  6fe2e39a0243bddba60f83b77b972a5922d25eb8

Last test of basis   171705  2022-07-20 14:01:52 Z    0 days
Testing same since   171708  2022-07-20 19:01:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hongyan Xia <hongyxia@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
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
   6fe2e39a02..d2cc5633e2  d2cc5633e2800e698c6a64554de7fa19d9627a24 -> smoke

