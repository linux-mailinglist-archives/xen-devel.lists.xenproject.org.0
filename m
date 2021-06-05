Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2D39C784
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jun 2021 12:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137179.254204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpTjy-0004G2-Td; Sat, 05 Jun 2021 10:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137179.254204; Sat, 05 Jun 2021 10:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpTjy-0004Dq-PT; Sat, 05 Jun 2021 10:41:18 +0000
Received: by outflank-mailman (input) for mailman id 137179;
 Sat, 05 Jun 2021 10:41:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpTjx-0004Dg-FB; Sat, 05 Jun 2021 10:41:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpTjx-0000Tu-58; Sat, 05 Jun 2021 10:41:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpTjw-0005IV-Su; Sat, 05 Jun 2021 10:41:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lpTjw-0002E3-SQ; Sat, 05 Jun 2021 10:41:16 +0000
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
	bh=1CXvJ2PiCTEwYys6bKz9t7drHhqUIX+TBh8beHgtfGo=; b=FG8RV1paGZbFiQ0CVcX4zHlNxW
	h/lqldB71cp5xYR4EwpoAnCOICKuqjxYJljtO9VGaaWHBcLv2IgkD8Uxbb+tA9EScvNQ6K31uQ1eu
	km2tu2OIdMyUqhLaEFN4Gl+4mMZwEKaNnPiFvAg0lRiRu76psqeLAKpLsysjrEnGN+TI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162395-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162395: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-saverestore:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=75f13e9b221e2c8603f15ee1d53318526cf56113
X-Osstest-Versions-That:
    xen=5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Jun 2021 10:41:16 +0000

flight 162395 xen-unstable-smoke real [real]
flight 162398 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/162395/
http://logs.test-lab.xenproject.org/osstest/logs/162398/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt     17 guest-saverestore        fail REGR. vs. 162327

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  75f13e9b221e2c8603f15ee1d53318526cf56113
baseline version:
 xen                  5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1

Last test of basis   162327  2021-06-01 16:01:37 Z    3 days
Failing since        162370  2021-06-04 17:01:35 Z    0 days    5 attempts
Testing same since   162374  2021-06-04 20:03:35 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Lindig <christian.lindig@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     fail    


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

