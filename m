Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140BB950DB7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 22:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776596.1186751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdxwy-000072-Jz; Tue, 13 Aug 2024 20:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776596.1186751; Tue, 13 Aug 2024 20:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdxwy-0008Vp-Fb; Tue, 13 Aug 2024 20:17:00 +0000
Received: by outflank-mailman (input) for mailman id 776596;
 Tue, 13 Aug 2024 20:16:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdxwx-0008Vd-II; Tue, 13 Aug 2024 20:16:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdxwx-0006Jf-GD; Tue, 13 Aug 2024 20:16:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sdxwx-0001h3-0F; Tue, 13 Aug 2024 20:16:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sdxww-0000Dk-W7; Tue, 13 Aug 2024 20:16:58 +0000
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
	bh=ujFOVNeJeftoQ2oVFiuNSEn45IL1sq5zZwx1aDemO+I=; b=13ql+1e28jHOYjsAFHau1rDmyz
	AIKRQnYuXWnwAmJMNibsibX6tomuFoeM7d0E9BGHVDQmruR3Ta906NqF/RcgqjWvnhN/To6GIwHBe
	HZ2W4QfkDZ+HFwPgo9Ly5c6J6CNjsQggfongRmt/MTQlJd62FiwLS3mGYV2lKODVCloo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187227-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187227: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:debian-install:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=69e99b5d4b087cfe508b4776703c5a9380cfb6d8
X-Osstest-Versions-That:
    xen=98a462f8b169f93ab7463023f0ed94575f8225b4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Aug 2024 20:16:58 +0000

flight 187227 xen-unstable-smoke real [real]
flight 187232 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187227/
http://logs.test-lab.xenproject.org/osstest/logs/187232/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl          12 debian-install           fail REGR. vs. 187219

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  69e99b5d4b087cfe508b4776703c5a9380cfb6d8
baseline version:
 xen                  98a462f8b169f93ab7463023f0ed94575f8225b4

Last test of basis   187219  2024-08-12 23:00:28 Z    0 days
Testing same since   187227  2024-08-13 15:04:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Paul Durrant <paul@xen.org>
  Sergiy Kibrik <Sergiy_Kibrik@epam.com>
  Teddy Astie <teddy.astie@vates.tech>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
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
commit 69e99b5d4b087cfe508b4776703c5a9380cfb6d8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Aug 13 16:41:25 2024 +0200

    x86emul: fix UB multiplications in S/G handling
    
    The conversion of the shifts to multiplications by the commits tagged
    below still wasn't quite right: The multiplications (of signed values)
    can overflow, too. As of 298556c7b5f8 ("x86emul: correct 32-bit address
    handling for AVX2 gathers") signed multiplication wasn't necessary
    anymore, though: The necessary sign-extension (if any) will happen as
    well when using intermediate variables of unsigned long types, and
    excess address bits are chopped off by truncate_ea().
    
    Fixes: b6a907f8c83d ("x86emul: replace UB shifts")
    Fixes: 21de9680eb59 ("x86emul: replace further UB shifts")
    Oss-fuzz: 71138
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 8fb49f2697f74886742096e84193c4c7496def4a
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Tue Aug 13 16:39:43 2024 +0200

    xen/riscv: enable CONFIG_HAS_DEVICE_TREE
    
    Enable build of generic functionality for working with device
    tree for RISC-V.
    Also, a collection of functions for parsing memory map and other
    boot information from a device tree are available now.
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit cc47813c4a2c07a5c6c6a1491b98f3f8549835a7
Author: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date:   Tue Aug 13 16:39:10 2024 +0200

    tools/hvmloader: Fix non-deterministic cpuid()
    
    hvmloader's cpuid() implementation deviates from Xen's in that the value
    passed on ecx is unspecified. This means that when used on leaves that
    implement subleaves it's unspecified which one you get; though it's more
    than likely an invalid one.
    
    Import Xen's implementation so there are no surprises.
    
    Fixes: 318ac791f9f9 ("Add utilities needed for SMBIOS generation to hvmloader")
    Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit b2e8c8f42083afcac8b4720c50680d7c9eaaf90a
Author: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Date:   Tue Aug 13 16:38:40 2024 +0200

    x86/vmx: guard access to cpu_has_vmx_* in common code
    
    There're several places in common code, outside of arch/x86/hvm/vmx,
    where cpu_has_vmx_* get accessed without checking whether VMX supported first.
    These macros rely on global variables defined in vmx code, so when VMX support
    is disabled accesses to these variables turn into build failures.
    
    To overcome these failures, build-time check is done before accessing global
    variables, so that DCE would remove these variables.
    
    Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
    Acked-by: Paul Durrant <paul@xen.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a8d9b750458f7e91fbb8ab63b5b9341ffb6f6bed
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Tue Aug 13 16:38:15 2024 +0200

    xen/riscv: enable GENERIC_BUG_FRAME
    
    Enable GENERIC_BUG_FRAME to support BUG(), WARN(), ASSERT,
    and run_in_exception_handler().
    
    "UNIMP" is used for BUG_INSTR, which, when macros from <xen/bug.h>
    are used, triggers an exception with the ILLEGAL_INSTRUCTION cause.
    This instruction is encoded as a 2-byte instruction when
    CONFIG_RISCV_ISA_C is enabled:
      ffffffffc0046ba0:       0000                    unimp
    and is encoded as a 4-byte instruction when CONFIG_RISCV_ISA_C
    ins't enabled:
      ffffffffc005a460:       c0001073                unimp
    
    Using 'ebreak' as BUG_INSTR does not guarantee proper handling of macros
    from <xen/bug.h>. If a debugger inserts a breakpoint (using the 'ebreak'
    instruction) at a location where Xen already uses 'ebreak', it
    creates ambiguity. Xen cannot distinguish whether the 'ebreak'
    instruction is inserted by the debugger or is part of Xen's own code.
    
    Remove BUG_INSN_32 and BUG_INSN_16 macros as they encode the ebreak
    instruction, which is no longer used for BUG_INSN.
    
    Update the comment above the definition of INS_LENGTH_MASK as instead of
    'ebreak' instruction 'unimp' instruction is used.
    
    <xen/lib.h> is included for the reason that panic() and printk() are
    used in common/bug.c and RISC-V fails if it is not included.
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 9c94eda1e3790820699a6de3f6a7c959ecf30600
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Aug 13 16:37:25 2024 +0200

    x86/pass-through: documents as security-unsupported when sharing resources
    
    When multiple devices share resources and one of them is to be passed
    through to a guest, security of the entire system and of respective
    guests individually cannot really be guaranteed without knowing
    internals of any of the involved guests.  Therefore such a configuration
    cannot really be security-supported, yet making that explicit was so far
    missing.
    
    This is XSA-461 / CVE-2024-31146.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit beadd68b5490ada053d72f8a9ce6fd696d626596
Author: Teddy Astie <teddy.astie@vates.tech>
Date:   Tue Aug 13 16:36:40 2024 +0200

    x86/IOMMU: move tracking in iommu_identity_mapping()
    
    If for some reason xmalloc() fails after having mapped the reserved
    regions, an error is reported, but the regions remain mapped in the P2M.
    
    Similarly if an error occurs during set_identity_p2m_entry() (except on
    the first call), the partial mappings of the region would be retained
    without being tracked anywhere, and hence without there being a way to
    remove them again from the domain's P2M.
    
    Move the setting up of the list entry ahead of trying to map the region.
    In cases other than the first mapping failing, keep record of the full
    region, such that a subsequent unmapping request can be properly torn
    down.
    
    To compensate for the potentially excess unmapping requests, don't log a
    warning from p2m_remove_identity_entry() when there really was nothing
    mapped at a given GFN.
    
    This is XSA-460 / CVE-2024-31145.
    
    Fixes: 2201b67b9128 ("VT-d: improve RMRR region handling")
    Fixes: c0e19d7c6c42 ("IOMMU: generalize VT-d's tracking of mapped RMRR regions")
    Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

