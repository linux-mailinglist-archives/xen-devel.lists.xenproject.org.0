Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05693968875
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 15:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787919.1197376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl6lX-00029Z-5J; Mon, 02 Sep 2024 13:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787919.1197376; Mon, 02 Sep 2024 13:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl6lX-00027O-1L; Mon, 02 Sep 2024 13:06:43 +0000
Received: by outflank-mailman (input) for mailman id 787919;
 Mon, 02 Sep 2024 13:06:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl6lV-00027B-3a; Mon, 02 Sep 2024 13:06:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl6lU-0002ai-Tr; Mon, 02 Sep 2024 13:06:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl6lU-0004z6-E2; Mon, 02 Sep 2024 13:06:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sl6lU-0008SC-De; Mon, 02 Sep 2024 13:06:40 +0000
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
	bh=YB331pxQXltAFKa1PVlbUNNJD06ZTcXpTUWYa0rAFR4=; b=58Y/iUtdpUWBQgohOvydYvtbfi
	4G5GlTtCM8u4Lzi/2pLkd1/bbhb5vw8XtXrxjrDEv+qMy6VpSnbTZC4euwpuEU5KHxv140LLaUwBE
	8/a6ewFzslXJLjg2IOuirTG0nQbTMlIErZnfW6N4g50YFn8Vftlv+RzIY3gk1AtxI96M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187456-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187456: trouble: blocked/broken
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:<job status>:broken:regression
    xen-unstable-smoke:build-arm64-xsm:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
    xen-unstable-smoke:build-amd64:host-install(4):broken:regression
    xen-unstable-smoke:build-armhf:host-install(4):broken:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=442625ef10fb919b0b55658ecac87cf323fa5af8
X-Osstest-Versions-That:
    xen=1436593d5f8f7f700478e307d5198535ba69f88d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Sep 2024 13:06:40 +0000

flight 187456 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187456/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 187424
 build-amd64                   4 host-install(4)        broken REGR. vs. 187424
 build-armhf                   4 host-install(4)        broken REGR. vs. 187424

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  442625ef10fb919b0b55658ecac87cf323fa5af8
baseline version:
 xen                  1436593d5f8f7f700478e307d5198535ba69f88d

Last test of basis   187424  2024-08-30 18:02:03 Z    2 days
Testing same since   187456  2024-09-02 10:00:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              broken  
 build-amd64                                                  broken  
 build-armhf                                                  broken  
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
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

broken-job build-amd64 broken
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-step build-arm64-xsm host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit 442625ef10fb919b0b55658ecac87cf323fa5af8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Sep 2 11:58:21 2024 +0200

    x86: drop map-low-16Mb leftovers
    
    Prior work (e.g. cbabbc9f5659 ["x86/boot: Size the boot/directmap
    mappings dynamically"]) has fully eliminated that hardcoded boundary.
    Drop both the linker script assertion (the upper bound is now the stubs
    area) and the artificial extending of xen.efi's image size.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit bfcb0abb191f75775081b74755c71c52ac06f994
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Sep 2 11:57:22 2024 +0200

    types: replace remaining uses of s8
    
    ... and move the type itself to linux-compat.h.
    
    While doing so,
    - convert __read_mostly to __ro_after_init for respective variables
      having their type changed (for acpi_numa add the attribute anew),
    - in cpuid_hypervisor_leaves() drop a cast altogether,
    - switch an adjacent struct arch_irq_desc field to bool.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 913952cca4e34a5f01228e3ab9f44d326662170b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Sep 2 11:56:24 2024 +0200

    x86: drop s<N>/u<N> overrides from mkelf32
    
    Use uint<N>_t instead (s<N> were unused altogether). While adjusting
    swap<N>() drop excessive casts and rename the arguments to avoid leading
    underscores.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit a8a74261681b5010a6f29e18b30739528c8f310c
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Mon Sep 2 11:55:16 2024 +0200

    x86/mm: add defensive return
    
    Add defensive return statement at the end of an unreachable
    default case. Other than improve safety, this meets the requirements
    to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
    statement shall terminate every switch-clause".
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

