Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E129F72D89B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 06:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547780.855358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8vcZ-0003Cj-Bo; Tue, 13 Jun 2023 04:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547780.855358; Tue, 13 Jun 2023 04:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8vcZ-00039Z-92; Tue, 13 Jun 2023 04:27:07 +0000
Received: by outflank-mailman (input) for mailman id 547780;
 Tue, 13 Jun 2023 04:27:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q8vcX-00039P-Vx; Tue, 13 Jun 2023 04:27:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q8vcX-00041n-U5; Tue, 13 Jun 2023 04:27:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q8vcX-0003dS-G2; Tue, 13 Jun 2023 04:27:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q8vcX-0004P5-Fa; Tue, 13 Jun 2023 04:27:05 +0000
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
	bh=9AVUXPlo2THRAVhS9a3eN/96NGc83p1hVWcSgUd4ySM=; b=V3KofHLv/bidJ0BpB7dd2I9s/F
	KSeG0sovS5tvW6Wz4GXLGCWJYwhMEgWvPe5DF0i1R9wQhRwgRknKwZR9Kil+N4LlyF/JGReHvPXsb
	7ugjEo2oDnVb275fETsoiruzR/BnEdt6+K8zKewicn1LfPeCAS0TG7aGWt/NRuFXZhmo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181396-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181396: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:host-install(4):broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=128557e3a44d79f0c9360dc88e42c3d0ef728edf
X-Osstest-Versions-That:
    xen=b4642c32c4d079916d5607ddda0232aae5e1690e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Jun 2023 04:27:05 +0000

flight 181396 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181396/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 181349

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  128557e3a44d79f0c9360dc88e42c3d0ef728edf
baseline version:
 xen                  b4642c32c4d079916d5607ddda0232aae5e1690e

Last test of basis   181349  2023-06-09 20:00:24 Z    3 days
Testing same since   181396  2023-06-12 22:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  broken  
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
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

broken-job build-armhf broken
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit 128557e3a44d79f0c9360dc88e42c3d0ef728edf
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Jun 12 11:13:19 2023 +0100

    tools/xenstored: Correct the prototype of domain_max_chk()
    
    Some version of GCC will complain because the prototype and the
    declaration of domain_max_chk() don't match:
    
    xenstored_domain.c:1503:6: error: conflicting types for 'domain_max_chk' due to enum/integer mismatch; have '_Bool(const struct connection *, enum accitem,  unsigned int)' [-Werror=enum-int-mismatch]
     1503 | bool domain_max_chk(const struct connection *conn, enum accitem what,
          |      ^~~~~~~~~~~~~~
    In file included from xenstored_domain.c:31:
    xenstored_domain.h:146:6: note: previous declaration of 'domain_max_chk' with type '_Bool(const struct connection *, unsigned int,  unsigned int)'
      146 | bool domain_max_chk(const struct connection *conn, unsigned int what,
          |      ^~~~~~~~~~~~~~
    
    Update the prototype to match the declaration.
    
    This was spotted by Gitlab CI with the job opensuse-tumbleweed-gcc.
    
    Fixes: 685048441e1c ("tools/xenstore: switch quota management to be table based")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Tested-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 1a0342507cb4011607673efec13a8f3238ac6aa8
Author: Juergen Gross <jgross@suse.com>
Date:   Tue May 30 10:54:13 2023 +0200

    tools/libs/store: make libxenstore independent of utils.h
    
    There is no real need for including tools/xenstore/utils.h from
    libxenstore, as only streq() and ARRAY_SIZE() are obtained via that
    header.
    
    streq() is just !strcmp(), and ARRAY_SIZE() is brought in via
    xen-tools/common-macros.h.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 0d5dfd2ed60addc1361ae82cbb52378abc912ede
Author: Juergen Gross <jgross@suse.com>
Date:   Tue May 30 10:54:12 2023 +0200

    tools/libs/store: use xen_list.h instead of xenstore/list.h
    
    Replace the usage of the xenstore private list.h header with the
    common xen_list.h one.
    
    Use the XEN_TAILQ type list, as it allows to directly swap the
    related macros/functions without having to change the logic.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 84ac67cd1e3df780c413cd7093aa3ad8d508b79a
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Mon Jun 12 15:00:46 2023 +0200

    xen/arm: rename guest_cpuinfo in domain_cpuinfo
    
    Rename the guest_cpuinfo structure to domain_cpuinfo as it is not only
    used for guests but also for dom0 so domain is a more suitable name.
    
    While there also rename the create_guest_cpuinfo function to
    create_domain_cpuinfo to be coherent and fix comments accordingly.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
(qemu changes not included)

