Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01A466DBC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 00:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237047.411101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msvTg-0004v8-HO; Thu, 02 Dec 2021 23:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237047.411101; Thu, 02 Dec 2021 23:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msvTg-0004tG-Cb; Thu, 02 Dec 2021 23:27:00 +0000
Received: by outflank-mailman (input) for mailman id 237047;
 Thu, 02 Dec 2021 23:26:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msvTf-0004t6-Et; Thu, 02 Dec 2021 23:26:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msvTf-0003zb-9A; Thu, 02 Dec 2021 23:26:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msvTf-0002Q1-1S; Thu, 02 Dec 2021 23:26:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1msvTf-0000uF-0w; Thu, 02 Dec 2021 23:26:59 +0000
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
	bh=cCG6zM75SM5pJBuNEN+kFrzt9V/i/Zz9ybb63Mg/e0E=; b=4kJzF4WLvR3Ee5r87CpLeKpz2M
	eYh9z3sqx2BQH0WMK1vlzPVtX3K8UU5M+d8shCu75I3XqzxmZQVPAe9aTEHwic7rhVnVQl6kdmSqV
	BVY/pxzqNVe4tNXluiFBt0YV1oI3TiPk+K6n0emS/Sr/6RGCos6wtSzW2Fgkr1hjnaTc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167033-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 167033: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start.2:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:heisenbug
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start:fail:heisenbug
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start/debian.repeat:fail:heisenbug
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=eb41074692094dff1413efb44fa4928a9140aa41
X-Osstest-Versions-That:
    xen=e7f147bf4ac725492962a501da72f5ab6be682db
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Dec 2021 23:26:59 +0000

flight 167033 xen-unstable-smoke real [real]
flight 167046 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167033/
http://logs.test-lab.xenproject.org/osstest/logs/167046/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt     21 guest-start.2            fail REGR. vs. 166958

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt 20 guest-start/debian.repeat fail in 167020 pass in 167033
 test-arm64-arm64-xl-xsm      14 guest-start                fail pass in 167020
 test-armhf-armhf-xl          18 guest-start/debian.repeat  fail pass in 167020

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 167020 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 167020 never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  eb41074692094dff1413efb44fa4928a9140aa41
baseline version:
 xen                  e7f147bf4ac725492962a501da72f5ab6be682db

Last test of basis   166958  2021-11-30 12:00:32 Z    2 days
Failing since        166977  2021-12-01 17:08:21 Z    1 days    6 attempts
Testing same since   166988  2021-12-01 23:02:57 Z    1 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Ayan Kumar Halder <ayankuma@xilinx.com>
  Ian Jackson <iwj@xenproject.org>
  Luca Fancellu <luca.fancellu@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Vikram Garhwal <fnu.vikram@xilinx.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      fail    
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
commit eb41074692094dff1413efb44fa4928a9140aa41
Author: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Date:   Tue Nov 30 18:12:38 2021 +0000

    bitops: Fix incorrect value in comment
    
    GENMASK(30, 21) should be 0x7fe00000. Fixed this in the comment
    in bitops.h.
    
    Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    [Tweak text, to put an end to any further bikeshedding]
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 6c1c97e24f830a921a23e3b9694e20493c9986ee
Author: Ian Jackson <iwj@xenproject.org>
Date:   Wed Dec 1 18:07:40 2021 +0000

    CHANGELOG.md: Start new "unstable" section
    
    I have just forward-ported the CHANGELOG.md updates from the
    stable-4.16 branch.  But we need a new section for work in this
    release cycle.
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>

commit eef266eb770128db0d5258009b744f0e0c31c9bd
Author: Ian Jackson <iwj@xenproject.org>
Date:   Tue Nov 30 11:40:21 2021 +0000

    CHANGELOG.md: Set 4.16 version and date
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>
    (cherry picked from commit 36aa64095d0419d52d2466405ac13b9858463f48)

commit e058b2d4e5e2ad7ad03941d36ef9243291b35671
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Wed Nov 24 12:24:03 2021 +0100

    CHANGELOG: add missing entries for work during the 4.16 release cycle
    
    Document some of the relevant changes during the 4.16 release cycle.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
    (cherry picked from commit e2544a28beacd854f295095d102a8773743ac917)

commit 9012687f05adf96440316ce338514db574ebfde0
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Tue Nov 16 15:06:24 2021 +0000

    arm/efi: Improve performance requesting filesystem handle
    
    Currently, the code used to handle and possibly load from the filesystem
    modules defined in the DT is allocating and closing the filesystem handle
    for each module to be loaded.
    
    To improve the performance, the filesystem handle pointer is passed
    through the call stack, requested when it's needed only once and closed
    if it was allocated.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit ad9cf6bde5b90d4c1e5a79a2803e98d6344c27d7
Author: Vikram Garhwal <fnu.vikram@xilinx.com>
Date:   Thu Nov 11 23:27:20 2021 -0800

    Update libfdt to v1.6.1
    
    Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dtc.
    This update is done to support device tree overlays.
    
    A few minor changes are done to make it compatible with Xen:
        fdt_overlay.c: overlay_fixup_phandle()
    
            Replace strtoul() with simple_strtoul() as strtoul() is not available in
            Xen lib and included lib.h.
    
            Change char *endptr to const char *endptr. This change is required for
            using simple_strtoul().
    
        libfdt_env.h:
            Remaining Xen changes to libfdt_env.h carried over from existing
            libfdt (v1.4.0)
    
    Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
    Tested-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

