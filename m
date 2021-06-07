Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AC039E95F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 00:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138170.255858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqNSh-0000Fo-AP; Mon, 07 Jun 2021 22:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138170.255858; Mon, 07 Jun 2021 22:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqNSh-0000DC-6C; Mon, 07 Jun 2021 22:11:11 +0000
Received: by outflank-mailman (input) for mailman id 138170;
 Mon, 07 Jun 2021 22:11:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lqNSf-0000D2-Os; Mon, 07 Jun 2021 22:11:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lqNSf-0001lm-Js; Mon, 07 Jun 2021 22:11:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lqNSf-0006jV-D3; Mon, 07 Jun 2021 22:11:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lqNSf-0004mA-CY; Mon, 07 Jun 2021 22:11:09 +0000
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
	bh=mIE7+5xU1zaGdBgFsb9LmN7eMf9u7IudBOKBQHZiywI=; b=ZRYe5Hiw1frfBon9NzSf6DQl70
	+Drti3R7ALdaS71g+Edwm+SGuP5VzsjOOdD9RgsFyd1YlXYTGIzZHvPks4DVGwRoHIh9gWKpSpOrW
	KS+xkqCy2FoEb8985cNkVEeQZmt7d6MGxkI2bQoxyFRI7NeXe+WMIijsutvXKpcpeljg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162523-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162523: regressions - FAIL
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
    xen=d21121685fac829c988e432407fb0e4ef9b19331
X-Osstest-Versions-That:
    xen=5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Jun 2021 22:11:09 +0000

flight 162523 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162523/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 162327

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d21121685fac829c988e432407fb0e4ef9b19331
baseline version:
 xen                  5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1

Last test of basis   162327  2021-06-01 16:01:37 Z    6 days
Failing since        162370  2021-06-04 17:01:35 Z    3 days   21 attempts
Testing same since   162517  2021-06-07 16:01:28 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
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
commit d21121685fac829c988e432407fb0e4ef9b19331
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Jun 7 15:00:05 2021 +0200

    tools/libs/guest: fix save and restore of pv domains after 32-bit de-support
    
    After 32-bit PV-guests have been security de-supported when not running
    under PV-shim, the hypervisor will no longer be configured to support
    those domains per default when not being built as PV-shim.
    
    Unfortunately libxenguest will fail saving or restoring a PV domain
    due to this restriction, as it is trying to get the compat MFN list
    even for 64 bit guests.
    
    Fix that by obtaining the compat MFN list only for 32-bit PV guests.
    
    Fixes: 1a0f2fe2297d122a08fe ("SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 69e1472d21cf7e5cf0795ef38b99d00de78a910e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jun 7 13:38:53 2021 +0100

    x86/cpuid: Drop special_features[]
    
    While the ! annotation is useful to indicate that something special is
    happening, an array of bits is not.  Drop it, to prevent mistakes.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 60fa12dbf1d4d2c4ffe1ef34b495b24aa7e41aa0
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jun 7 13:25:09 2021 +0100

    x86/cpuid: Fix HLE and RTM handling (again)
    
    For reasons which are my fault, but I don't recall why, the
    FDP_EXCP_ONLY/NO_FPU_SEL adjustment uses the whole special_features[] array
    element, not the two relevant bits.
    
    HLE and RTM were recently added to the list of special features, causing them
    to be always set in guest view, irrespective of the toolstacks choice on the
    matter.
    
    Rewrite the logic to refer to the features specifically, rather than relying
    on the contents of the special_features[] array.
    
    Fixes: 8fe24090d9 ("x86/cpuid: Rework HLE and RTM handling")
    Reported-by: Edwin Török <edvin.torok@citrix.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit c4beefcada0a406681dcfb6e89f6cbe4aa368c2d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jun 7 15:40:55 2021 +0200

    ﻿docs: release-technician-checklist: update to leaf tree version pinning
    
    Our releases look to flip-flop between keeping or discarding the date
    and title of the referenced qemu-trad commit. I think with the hash
    replaced by a tag, the commit's date and title would better also be
    purged.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit 89052b9fa24bf976924e40918fc9fa3b1b940e17
Author: Dario Faggioli <dfaggioli@suse.com>
Date:   Fri Mar 19 12:14:17 2021 +0000

    xen: credit2: fix per-entity load tracking when continuing running
    
    If we schedule, and the current vCPU continues to run, its statistical
    load is not properly updated, resulting in something like this, even if
    all the 8 vCPUs are 100% busy:
    
    (XEN) Runqueue 0:
    (XEN) [...]
    (XEN)   aveload            = 2097152 (~800%)
    (XEN) [...]
    (XEN)   Domain: 0 w 256 c 0 v 8
    (XEN)     1: [0.0] flags=2 cpu=4 credit=9996885 [w=256] load=35 (~0%)
    (XEN)     2: [0.1] flags=2 cpu=2 credit=9993725 [w=256] load=796 (~0%)
    (XEN)     3: [0.2] flags=2 cpu=1 credit=9995885 [w=256] load=883 (~0%)
    (XEN)     4: [0.3] flags=2 cpu=5 credit=9998833 [w=256] load=487 (~0%)
    (XEN)     5: [0.4] flags=2 cpu=6 credit=9998942 [w=256] load=1595 (~0%)
    (XEN)     6: [0.5] flags=2 cpu=0 credit=9994669 [w=256] load=22 (~0%)
    (XEN)     7: [0.6] flags=2 cpu=7 credit=9997706 [w=256] load=0 (~0%)
    (XEN)     8: [0.7] flags=2 cpu=3 credit=9992440 [w=256] load=0 (~0%)
    
    As we can see, the average load of the runqueue as a whole is, instead,
    computed properly.
    
    This issue would, in theory, potentially affect Credit2 load balancing
    logic. In practice, however, the problem only manifests (at least with
    these characteristics) when there is only 1 runqueue active in the
    cpupool, which also means there is no need to do any load-balancing.
    
    Hence its real impact is pretty much limited to wrong per-vCPU load
    percentages, when looking at the output of the 'r' debug-key.
    
    With this patch, the load is updated and displayed correctly:
    
    (XEN) Runqueue 0:
    (XEN) [...]
    (XEN)   aveload            = 2097152 (~800%)
    (XEN) [...]
    (XEN) Domain info:
    (XEN)   Domain: 0 w 256 c 0 v 8
    (XEN)     1: [0.0] flags=2 cpu=4 credit=9995584 [w=256] load=262144 (~100%)
    (XEN)     2: [0.1] flags=2 cpu=6 credit=9992992 [w=256] load=262144 (~100%)
    (XEN)     3: [0.2] flags=2 cpu=3 credit=9998918 [w=256] load=262118 (~99%)
    (XEN)     4: [0.3] flags=2 cpu=5 credit=9996867 [w=256] load=262144 (~100%)
    (XEN)     5: [0.4] flags=2 cpu=1 credit=9998912 [w=256] load=262144 (~100%)
    (XEN)     6: [0.5] flags=2 cpu=2 credit=9997842 [w=256] load=262144 (~100%)
    (XEN)     7: [0.6] flags=2 cpu=7 credit=9994623 [w=256] load=262144 (~100%)
    (XEN)     8: [0.7] flags=2 cpu=0 credit=9991815 [w=256] load=262144 (~100%)
    
    Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit 07b0eb5d0ef0be154606aa46b5b4c5c59b158505
Author: Dario Faggioli <dfaggioli@suse.com>
Date:   Fri May 28 17:12:48 2021 +0200

    credit2: make sure we pick a runnable unit from the runq if there is one
    
    A !runnable unit (temporarily) present in the runq may cause us to
    stop scanning the runq itself too early. Of course, we don't run any
    non-runnable vCPUs, but we end the scan and we fallback to picking
    the idle unit. In other word, this prevent us to find there and pick
    the actual unit that we're meant to start running (which might be
    further ahead in the runq).
    
    Depending on the vCPU pinning configuration, this may lead to such
    unit to be stuck in the runq for long time, causing malfunctioning
    inside the guest.
    
    Fix this by checking runnable/non-runnable status up-front, in the runq
    scanning function.
    
    Reported-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Reported-by: Dion Kant <g.w.kant@hunenet.nl>
    Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit 75f13e9b221e2c8603f15ee1d53318526cf56113
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jun 4 08:02:14 2021 +0200

    tools/libs/guest: make some definitions private to libxenguest
    
    There are some definitions which are used in libxenguest only now.
    Move them from libxenctrl over to libxenguest.
    
    Remove an unused macro.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 455790573d3bbad6d5a1bb7e9d28b6dd71075693
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jun 4 08:02:13 2021 +0200

    tools/libs: move xc_core* from libxenctrl to libxenguest
    
    The functionality in xc_core* should be part of libxenguest instead
    of libxenctrl. Users are already either in libxenguest, or in xl.
    There is one single exception: xc_core_arch_auto_translated_physmap()
    is being used by xc_domain_memory_mapping(), which is used by qemu.
    So leave the xc_core_arch_auto_translated_physmap() functionality in
    libxenctrl.
    
    This will make it easier to merge common functionality of xc_core*
    and xg_sr_save*.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit bf1fc18901dfea05a69f661493b934c0db7d3503
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jun 4 08:02:12 2021 +0200

    tools/libs: move xc_resume.c to libxenguest
    
    The guest suspend functionality is already part of libxenguest. Move
    the resume functionality from libxenctrl to libxenguest, too.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit f183854facad996fe891c086c024bca7cbcdc1e4
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jun 4 08:02:11 2021 +0200

    tools/libs/ctrl: use common p2m mapping code in xc_domain_resume_any()
    
    Instead of open coding the mapping of the p2m list use the already
    existing xc_core_arch_map_p2m() call, especially as the current code
    does not support guests with the linear p2m map. It should be noted
    that this code is needed for colo/remus only.
    
    Switching to xc_core_arch_map_p2m() drops the need to bail out for
    bitness of tool stack and guest differing.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit bd7a29c3d0b937ab542abea06ff1b575abe7247a
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jun 4 08:02:10 2021 +0200

    tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table
    
    The core of a pv linux guest produced via "xl dump-core" is nor usable
    as since kernel 4.14 only the linear p2m table is kept if Xen indicates
    it is supporting that. Unfortunately xc_core_arch_map_p2m() is still
    supporting the 3-level p2m tree only.
    
    Fix that by copying the functionality of map_p2m() from libxenguest to
    libxenctrl.
    
    Additionally the mapped p2m isn't of a fixed length now, so the
    interface to the mapping functions needs to be adapted. In order not to
    add even more parameters, expand struct domain_info_context and use a
    pointer to that as a parameter.
    
    Fixes: dc6d60937121 ("libxc: set flag for support of linear p2m list in domain builder")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 7bd8989ab77b6ade3b7a5f4b640a55248d1791a3
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jun 4 08:02:09 2021 +0200

    tools/libs/guest: fix max_pfn setting in map_p2m()
    
    When setting the highest pfn used in the guest, don't subtract 1 from
    the value read from the shared_info data. The value read already is
    the correct pfn.
    
    Fixes: 91e204d37f449 ("libxc: try to find last used pfn when migrating")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 1a0f2fe2297d122a08fee2b26de5de995fdeca13
Author: George Dunlap <george.dunlap@citrix.com>
Date:   Thu May 6 13:38:02 2021 +0100

    SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported
    
    The support status of 32-bit guests doesn't seem particularly useful.
    
    With it changed to fully unsupported outside of PV-shim, adjust the PV32
    Kconfig default accordingly.
    
    Reported-by: Jann Horn <jannh@google.com>
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

