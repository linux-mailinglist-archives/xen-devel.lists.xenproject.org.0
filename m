Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4793BF1E3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 00:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152721.282124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1FmM-00074F-Jk; Wed, 07 Jul 2021 22:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152721.282124; Wed, 07 Jul 2021 22:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1FmM-00071C-ET; Wed, 07 Jul 2021 22:12:26 +0000
Received: by outflank-mailman (input) for mailman id 152721;
 Wed, 07 Jul 2021 22:12:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1FmK-00070I-7C; Wed, 07 Jul 2021 22:12:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1FmK-0005l2-3s; Wed, 07 Jul 2021 22:12:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1FmJ-00067q-TQ; Wed, 07 Jul 2021 22:12:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m1FmJ-00046T-St; Wed, 07 Jul 2021 22:12:23 +0000
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
	bh=31P4IPRxnxzFwcgwsEGJQU4PnSRDOrlCPtPTTVO6T6s=; b=x31fGba31yw/PPKsN9tJ1xJ65K
	T7yDMEgTZEOt1+KtCkA4NhEplcscMjjUW5ai+FM7XObdICTbhlAMKOtR6a4JR1lW3scl9ZG8M9RJl
	mk7q+QrYWlt7HtKJWar1TcM0l73kPBfGgTKpcTC22xKwl773LuCKtwBNS+CJdJ1/xRns=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163415-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 163415: trouble: broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=484910bf41fec2c80d79ed9c5c33831bee7318f0
X-Osstest-Versions-That:
    xen=e362d3276d40e4f370c92eaa6c0e84e34badb92b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jul 2021 22:12:23 +0000

flight 163415 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163415/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken REGR. vs. 163408

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  484910bf41fec2c80d79ed9c5c33831bee7318f0
baseline version:
 xen                  e362d3276d40e4f370c92eaa6c0e84e34badb92b

Last test of basis   163408  2021-07-07 15:00:25 Z    0 days
Testing same since   163415  2021-07-07 19:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
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

broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)

Not pushing.

------------------------------------------------------------
commit 484910bf41fec2c80d79ed9c5c33831bee7318f0
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Jul 7 17:51:49 2021 +0200

    build,tools: have default rules depends on symbols
    
    No need to call $(MAKE) again.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit ad76d87d65e1fd2ec3b08699d6dcfb0d2a9441c1
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Jul 7 17:51:34 2021 +0200

    build: use $(kconfig) shortcut in clean rule
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 3ce2765ac21dbd739e8216694b025aaabf4afff3
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Jul 7 17:51:18 2021 +0200

    build: clean "lib.a"
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

