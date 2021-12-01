Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026E4658F7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 23:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236242.409782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msXtd-00046k-A6; Wed, 01 Dec 2021 22:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236242.409782; Wed, 01 Dec 2021 22:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msXtd-00044n-5h; Wed, 01 Dec 2021 22:16:13 +0000
Received: by outflank-mailman (input) for mailman id 236242;
 Wed, 01 Dec 2021 22:16:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msXtc-00044d-8x; Wed, 01 Dec 2021 22:16:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msXtc-0005jV-1b; Wed, 01 Dec 2021 22:16:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msXtb-0004gO-M9; Wed, 01 Dec 2021 22:16:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1msXtb-0000gX-Lf; Wed, 01 Dec 2021 22:16:11 +0000
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
	bh=9YjKl2YF3QMBdDLyKnGPgs9oIJLbgMqAv9OEivpzufU=; b=YNM6cvy00qh6MCTT8XLkAstAWm
	rmj6aTrRy/1fPwD+0zZn5InLxuEjaf6htEs+YpTLnXGgIKss8aOVGqszZBT/dghA4fi94N79q804f
	1Az9O7CfKG+hvmmaOQ5Ne4ji9xGYGR1TJddPYhtGQMi8JmEkRZq4GeONYyPIwLEZJw3I=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166977-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 166977: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9012687f05adf96440316ce338514db574ebfde0
X-Osstest-Versions-That:
    xen=e7f147bf4ac725492962a501da72f5ab6be682db
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Dec 2021 22:16:11 +0000

flight 166977 xen-unstable-smoke real [real]
flight 166982 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/166977/
http://logs.test-lab.xenproject.org/osstest/logs/166982/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm     18 guest-start/debian.repeat fail REGR. vs. 166958

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9012687f05adf96440316ce338514db574ebfde0
baseline version:
 xen                  e7f147bf4ac725492962a501da72f5ab6be682db

Last test of basis   166958  2021-11-30 12:00:32 Z    1 days
Testing same since   166977  2021-12-01 17:08:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Luca Fancellu <luca.fancellu@arm.com>
  Vikram Garhwal <fnu.vikram@xilinx.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
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

