Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C93C454A91
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 17:09:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226923.392313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNUY-0004Ts-Nz; Wed, 17 Nov 2021 16:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226923.392313; Wed, 17 Nov 2021 16:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNUY-0004Ru-JZ; Wed, 17 Nov 2021 16:08:58 +0000
Received: by outflank-mailman (input) for mailman id 226923;
 Wed, 17 Nov 2021 16:08:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mnNUX-0004Rk-14; Wed, 17 Nov 2021 16:08:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mnNUW-00049H-S9; Wed, 17 Nov 2021 16:08:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mnNUW-0006ML-IZ; Wed, 17 Nov 2021 16:08:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mnNUW-0000NE-I7; Wed, 17 Nov 2021 16:08:56 +0000
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
	bh=L8yYYWmm/o1ibO3NnHsHu6A0ZNUQZPVB8QZP+ziynfI=; b=RLpSBzy6vhG9rKV+USvS1kKztN
	iP8xDPxWJjv5CCwz5Xfe/GTp+pVpjrM8Pt+uT83yoA+XdEmL5bFZEjTnr2BTxKU1S5zUR/AFRCAcQ
	ApyEEJ7LRop2eSbfRWDRQpYOwJxPmPYmKCTKFGJvE2Ih6AYRinmnVh2uxSFRLqlsp2ik=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166168-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 166168: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1cffc48f1e1f972daeec579c62de4bb24f3152fa
X-Osstest-Versions-That:
    xen=306e0afbb382ec10081ab277c866e9e7c212dda5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Nov 2021 16:08:56 +0000

flight 166168 xen-unstable-smoke real [real]
flight 166173 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/166168/
http://logs.test-lab.xenproject.org/osstest/logs/166173/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166162

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1cffc48f1e1f972daeec579c62de4bb24f3152fa
baseline version:
 xen                  306e0afbb382ec10081ab277c866e9e7c212dda5

Last test of basis   166162  2021-11-17 08:01:37 Z    0 days
Testing same since   166168  2021-11-17 12:02:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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
commit 1cffc48f1e1f972daeec579c62de4bb24f3152fa
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Nov 17 12:43:05 2021 +0100

    tools/python: fix python libxc bindings to pass a max grant version
    
    Such max version should be provided by the caller, otherwise the
    bindings will default to specifying a max version of 2, which is
    inline with the current defaults in the hypervisor.
    
    Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 27ece0dd522278e074acc264dd95d734beb64d0f
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Nov 17 12:35:26 2021 +0100

    CHANGELOG: set Xen 4.15 release date
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

