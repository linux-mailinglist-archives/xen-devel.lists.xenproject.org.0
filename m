Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158A31351D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 15:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82890.153299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l97UR-00005q-EU; Mon, 08 Feb 2021 14:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82890.153299; Mon, 08 Feb 2021 14:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l97UR-00005I-9I; Mon, 08 Feb 2021 14:26:11 +0000
Received: by outflank-mailman (input) for mailman id 82890;
 Mon, 08 Feb 2021 14:26:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l97UP-00005A-Ur; Mon, 08 Feb 2021 14:26:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l97UP-0005P5-Ph; Mon, 08 Feb 2021 14:26:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l97UP-00073g-G1; Mon, 08 Feb 2021 14:26:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l97UP-0003MM-FV; Mon, 08 Feb 2021 14:26:09 +0000
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
	bh=gMFaA2qTIzuri5m0S8I7iNOLYgQuVGMS950if3AZF2w=; b=WvmOLcTrap9xXUYzrlPhikDNkc
	hjwZHZIilBKN1Hnj1uuv50FNc3iXqPYN/CPsz4IIaUXpDedp3MuuMxJgzkPYVzWWjakA7B8AqXqi0
	m6Ub+BjU4cggGrR8rskK8YuoZQ4H9X9awj8Jb20hdCPA/GQnJZNRQDZwlZ6IOEDMIrUI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159138-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 159138: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=25ee478662d378ec2b24f517fb6d8d4829b885ff
X-Osstest-Versions-That:
    xen=ca82d3fecc93745ee17850a609ac7772bd7c8bf7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 14:26:09 +0000

flight 159138 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159138/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 159054
 build-armhf                   6 xen-build                fail REGR. vs. 159054

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  25ee478662d378ec2b24f517fb6d8d4829b885ff
baseline version:
 xen                  ca82d3fecc93745ee17850a609ac7772bd7c8bf7

Last test of basis   159054  2021-02-05 20:01:29 Z    2 days
Testing same since   159138  2021-02-08 13:00:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Igor Druzhinin <igor.druzhinin@citrix.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 test-armhf-armhf-xl                                          blocked 
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
commit 25ee478662d378ec2b24f517fb6d8d4829b885ff
Author: Igor Druzhinin <igor.druzhinin@citrix.com>
Date:   Wed Feb 3 20:07:04 2021 +0000

    tools/libxl: only set viridian flags on new domains
    
    Domains migrating or restoring should have viridian HVM param key in
    the migration stream already and setting that twice results in Xen
    returing -EEXIST on the second attempt later (during migration stream parsing)
    in case the values don't match. That causes migration/restore operation
    to fail at destination side.
    
    That issue is now resurfaced by the latest commits (983524671 and 7e5cffcd1e)
    extending default viridian feature set making the values from the previous
    migration streams and those set at domain construction different.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 804fe751375b1f40eb3142121bf2b70fa2a83972
Author: Igor Druzhinin <igor.druzhinin@citrix.com>
Date:   Wed Feb 3 20:07:03 2021 +0000

    tools/libxl: pass libxl__domain_build_state to libxl__arch_domain_create
    
    No functional change.
    
    Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

