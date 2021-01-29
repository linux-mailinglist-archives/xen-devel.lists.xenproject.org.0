Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31A3085FF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 07:52:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77730.140969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Nci-0005Vn-D0; Fri, 29 Jan 2021 06:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77730.140969; Fri, 29 Jan 2021 06:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Nci-0005VO-9i; Fri, 29 Jan 2021 06:51:16 +0000
Received: by outflank-mailman (input) for mailman id 77730;
 Fri, 29 Jan 2021 06:51:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5Nch-0005VD-Bs; Fri, 29 Jan 2021 06:51:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5Ncg-0007JV-U4; Fri, 29 Jan 2021 06:51:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5Ncg-0003ge-Jk; Fri, 29 Jan 2021 06:51:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l5Ncg-0003CN-JA; Fri, 29 Jan 2021 06:51:14 +0000
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
	bh=uVIS+ntvYeiplyEmnqUZXBWBt52I+a6la5iIEi0T9sU=; b=Nce6eIIg9UGVdeKmHEAQNitDlr
	XICsJtN2pH0x7WC2K7Z+8KoUfD0XhWdytS2gbFA9m2oV/7mO1jyA8wwWuqa6FIQ41/yAsJs5YiRJ6
	gBGLC0EGSU58cQr6B0FQqoOsV3gsNiPn6CMP556kS38SGC4sFByqh+EaLboknuaZgAYA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158759-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158759: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ec0648db751a08486a586a5e9b5de4e81baebfca
X-Osstest-Versions-That:
    xen=6677b5a3577c16501fbc51a3341446905bd21c38
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Jan 2021 06:51:14 +0000

flight 158759 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158759/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 158713
 build-arm64-xsm               6 xen-build                fail REGR. vs. 158713

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ec0648db751a08486a586a5e9b5de4e81baebfca
baseline version:
 xen                  6677b5a3577c16501fbc51a3341446905bd21c38

Last test of basis   158713  2021-01-27 23:00:26 Z    1 days
Failing since        158724  2021-01-28 12:01:30 Z    0 days    6 attempts
Testing same since   158752  2021-01-29 01:02:35 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Manuel Bouyer <bouyer@netbsd.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
commit ec0648db751a08486a586a5e9b5de4e81baebfca
Author: Stefano Stabellini <stefano.stabellini@xilinx.com>
Date:   Tue Jan 26 11:03:28 2021 -0800

    xen: add (EXPERT) to one-line description of XEN_SHSTK
    
    Add an "(EXPERT)" tag to the one-line description of Kconfig options
    that depend on EXPERT. (Not where just the prompt depends on EXPERT.)
    
    Today we only have one such option: XEN_SHSTK.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    CC: andrew.cooper3@citrix.com
    CC: george.dunlap@citrix.com
    CC: iwj@xenproject.org
    CC: jbeulich@suse.com
    CC: julien@xen.org
    CC: wl@xen.org

commit d96e5e6c12145b4fc7b19b7b4751d20540061da0
Author: Stefano Stabellini <stefano.stabellini@xilinx.com>
Date:   Tue Jan 26 11:03:27 2021 -0800

    xen: EXPERT clean-up and introduce UNSUPPORTED
    
    A recent thread [1] has exposed a couple of issues with our current way
    of handling EXPERT.
    
    1) It is not obvious that "Configure standard Xen features (expert
    users)" is actually the famous EXPERT we keep talking about on xen-devel
    
    2) It is not obvious when we need to enable EXPERT to get a specific
    feature
    
    In particular if you want to enable ACPI support so that you can boot
    Xen on an ACPI platform, you have to enable EXPERT first. But searching
    through the kconfig menu it is really not clear (type '/' and "ACPI"):
    nothing in the description tells you that you need to enable EXPERT to
    get the option.
    
    So this patch makes things easier by doing two things:
    
    - introduce a new kconfig option UNSUPPORTED which is clearly to enable
      UNSUPPORTED features as defined by SUPPORT.md
    
    - change EXPERT options to UNSUPPORTED where it makes sense: keep
      depending on EXPERT for features made for experts
    
    - tag unsupported features by adding (UNSUPPORTED) to the one-line
      description
    
    - clarify the EXPERT one-line description
    
    [1] https://marc.info/?l=xen-devel&m=160333101228981
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com> [x86,common]
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    CC: andrew.cooper3@citrix.com
    CC: george.dunlap@citrix.com
    CC: iwj@xenproject.org
    CC: jbeulich@suse.com
    CC: julien@xen.org
    CC: wl@xen.org

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

