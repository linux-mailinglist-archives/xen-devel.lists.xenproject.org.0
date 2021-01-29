Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7930822C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 01:02:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77525.140437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5HEX-00044K-2D; Fri, 29 Jan 2021 00:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77525.140437; Fri, 29 Jan 2021 00:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5HEW-00043s-UZ; Fri, 29 Jan 2021 00:01:52 +0000
Received: by outflank-mailman (input) for mailman id 77525;
 Fri, 29 Jan 2021 00:01:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5HEU-00043k-Rn; Fri, 29 Jan 2021 00:01:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5HEU-0001bl-GX; Fri, 29 Jan 2021 00:01:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5HET-0004im-LW; Fri, 29 Jan 2021 00:01:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l5HET-0008QS-Kl; Fri, 29 Jan 2021 00:01:49 +0000
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
	bh=cQ6FX5qqcrxNma2F1UlpuDMLKqAda2+H9Ge/C9CLt0w=; b=a0bPuZyRAYSP4wdc4Pe+9luc5o
	Ts2fvFcaaWbwwhzKT8AE3YrWEF9+O5x3GiTyATmiSDSbWbIlNCo0aLPmRX5AbIe071L2AgA+YF3/G
	cnScXvJwNUF5b0+Thcq5Ewr5BYDgagYsgExTCtmX3f6C4vaj7UzH2UphBVRXx0ZxFOZk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158750-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158750: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6ca510153350163b02809ae06e1dabad89c2c786
X-Osstest-Versions-That:
    xen=6677b5a3577c16501fbc51a3341446905bd21c38
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Jan 2021 00:01:49 +0000

flight 158750 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158750/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 158713

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6ca510153350163b02809ae06e1dabad89c2c786
baseline version:
 xen                  6677b5a3577c16501fbc51a3341446905bd21c38

Last test of basis   158713  2021-01-27 23:00:26 Z    1 days
Failing since        158724  2021-01-28 12:01:30 Z    0 days    4 attempts
Testing same since   158750  2021-01-28 21:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Manuel Bouyer <bouyer@netbsd.org>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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
commit 6ca510153350163b02809ae06e1dabad89c2c786
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 27 19:43:32 2021 +0000

    x86/boot: Drop 'noapic' suggestion from check_timer()
    
    In practice, there is no such thing as a real 64bit system without
    APICs.  (PVH style virtual environments, sure, but they don't end up here).
    
    The suggestion to try and use noapic only makes a bad situation worse.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 525cae0b9eb359774f08ceb609c333954bcb00e8
Author: Ian Jackson <iwj@xenproject.org>
Date:   Wed Nov 25 13:22:08 2020 +0000

    xen-release-management doc: More info on schedule
    
    This documents our practice, established in 2018
      https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html
    et seq
    
    CC: Jürgen Groß <jgross@suse.com>
    CC: Paul Durrant <xadimgnik@gmail.com>
    CC: Wei Liu <wl@xen.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Ian Jackson <iwj@xenproject.org>

commit e8524e4d4d612ef53943f539da2e81785282e5af
Author: Manuel Bouyer <bouyer@netbsd.org>
Date:   Tue Jan 12 19:12:21 2021 +0100

    Fix error: array subscript has type 'char'
    
    Use unsigned char variable, or cast to (unsigned char), for
    tolower()/islower() and friends. Fix compiler error
    array subscript has type 'char' [-Werror=char-subscripts]
    
    Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 6e2046378086d2eaf3f1fe807a2fd697f2630f40
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jul 29 16:28:32 2020 +0100

    xen/memory: Clarify the XENMEM_acquire_resource ABI description
    
    This is how similar operations already operate, compatible with the sole
    implementation (in Linux), and explicitly gives us some flexibility.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit 75fc85998546878ca5417071a6ca60c34065c2c3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Jul 23 15:58:48 2020 +0100

    tools/foreignmem: Support querying the size of a resource
    
    With the Xen side of this interface (soon to be) fixed to return real sizes,
    userspace needs to be able to make the query.
    
    Introduce xenforeignmemory_resource_size() for the purpose, bumping the
    library minor version.
    
    Update both all osdep_xenforeignmemory_map_resource() implementations to
    understand size requests, skip the mmap() operation, and copy back the
    nr_frames field.
    
    For NetBSD, also fix up the ioctl() error path to issue an unmap(), which was
    overlooked by c/s 4a64e2bb39 "libs/foreignmemory: Implement on NetBSD".
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    Acked-by: Wei Liu <wl@xen.org>

commit 2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
Author: Manuel Bouyer <bouyer@netbsd.org>
Date:   Tue Jan 26 23:47:52 2021 +0100

    libs/foreignmemory: Implement on NetBSD
    
    Implement foreignmemory interface on NetBSD. The compat interface is now used
    only on __sun__
    
    Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

