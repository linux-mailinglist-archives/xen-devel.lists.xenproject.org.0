Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEF6947EE6
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 18:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772288.1182738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb08f-0005R0-PH; Mon, 05 Aug 2024 16:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772288.1182738; Mon, 05 Aug 2024 16:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb08f-0005PE-M1; Mon, 05 Aug 2024 16:00:49 +0000
Received: by outflank-mailman (input) for mailman id 772288;
 Mon, 05 Aug 2024 16:00:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sb08e-0005P4-TB; Mon, 05 Aug 2024 16:00:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sb08e-0003yu-Ms; Mon, 05 Aug 2024 16:00:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sb08e-0005ai-4U; Mon, 05 Aug 2024 16:00:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sb08e-0004BC-41; Mon, 05 Aug 2024 16:00:48 +0000
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
	bh=WUAk0G6ZtT9op6Ovwp2eJK7MyzUP6u5giMGQvKJLXZ0=; b=bE1a9UgUyxpjnf3vQKmRkNGhc7
	deIoxYiF77o3ujqyoldk+sBAbiq07Q1C2Uu/8dVgUYm9ba6Ov0RTjtwUp3iIFTwEi9Ry0uZuluZv8
	t5C6JrUOxPGyFUfx97NmEEW9bWg0Csj3ySriUvNGrLNvIXgpvsTAdv0RPJMS4+PZDalU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187157-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187157: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=bec25f11d5180d407cf04d2de2525fa6f876bde1
X-Osstest-Versions-That:
    xen=ded5474718a84366dac80aae039a693b66fa7e2e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Aug 2024 16:00:48 +0000

flight 187157 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187157/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 187127

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  bec25f11d5180d407cf04d2de2525fa6f876bde1
baseline version:
 xen                  ded5474718a84366dac80aae039a693b66fa7e2e

Last test of basis   187127  2024-08-02 22:02:05 Z    2 days
Failing since        187154  2024-08-05 09:02:05 Z    0 days    2 attempts
Testing same since   187157  2024-08-05 13:12:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
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


Not pushing.

------------------------------------------------------------
commit bec25f11d5180d407cf04d2de2525fa6f876bde1
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Aug 5 12:55:37 2024 +0200

    Revert "x86/dom0: delay setting SMAP after dom0 build is done"
    
    This reverts commit ac6b9309694de9b2b5163886656282f6ada71565. The
    change crashes Xen on boot on SMAP-capable systems.

commit ac6b9309694de9b2b5163886656282f6ada71565
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Aug 5 10:18:05 2024 +0200

    x86/dom0: delay setting SMAP after dom0 build is done
    
    Delay setting X86_CR4_SMAP on the BSP until the domain building is done, so
    that there's no need to disable SMAP.  Note however that SMAP is enabled for
    the APs on bringup, as domain builder code strictly run on the BSP.  Delaying
    the setting for the APs would mean having to do a callfunc IPI later in order
    to set it on all the APs.
    
    The fixes tag is to account for the wrong usage of cpu_has_smap in
    create_dom0(), it should instead have used
    boot_cpu_has(X86_FEATURE_XEN_SMAP).
    
    While there also make cr4_pv32_mask __ro_after_init.
    
    Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit d81dd31303513a1626973778d557a6493d86511a
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Aug 5 10:16:54 2024 +0200

    x86/shutdown: change default reboot method preference
    
    The current logic to chose the preferred reboot method is based on the mode Xen
    has been booted into, so if the box is booted from UEFI, the preferred reboot
    method will be to use the ResetSystem() run time service call.
    
    However, that method seems to be widely untested, and quite often leads to a
    result similar to:
    
    Hardware Dom0 shutdown: rebooting machine
    ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
    CPU:    0
    RIP:    e008:[<0000000000000017>] 0000000000000017
    RFLAGS: 0000000000010202   CONTEXT: hypervisor
    [...]
    Xen call trace:
       [<0000000000000017>] R 0000000000000017
       [<ffff83207eff7b50>] S ffff83207eff7b50
       [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
       [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
       [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
       [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
       [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
       [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
       [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
       [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
       [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
    
    ****************************************
    Panic on CPU 0:
    FATAL TRAP: vector = 6 (invalid opcode)
    ****************************************
    
    Which in most cases does lead to a reboot, however that's unreliable.
    
    Change the default reboot preference to prefer ACPI over UEFI if available and
    not in reduced hardware mode.
    
    This is in line to what Linux does, so it's unlikely to cause issues on current
    and future hardware, since there's a much higher chance of vendors testing
    hardware with Linux rather than Xen.
    
    Add a special case for one Acer model that does require being rebooted using
    ResetSystem().  See Linux commit 0082517fa4bce for rationale.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
(qemu changes not included)

