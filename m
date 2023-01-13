Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407AA669A04
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 15:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477388.740095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKzq-0005Em-BD; Fri, 13 Jan 2023 14:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477388.740095; Fri, 13 Jan 2023 14:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKzq-0005DI-7a; Fri, 13 Jan 2023 14:25:30 +0000
Received: by outflank-mailman (input) for mailman id 477388;
 Fri, 13 Jan 2023 14:25:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pGKzp-0005D6-Al; Fri, 13 Jan 2023 14:25:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pGKzp-0004yB-6u; Fri, 13 Jan 2023 14:25:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pGKzp-0002qX-08; Fri, 13 Jan 2023 14:25:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pGKzo-0001WU-Vv; Fri, 13 Jan 2023 14:25:28 +0000
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
	bh=jFCkryL3/YbnA76rXfk/9dnRDBplomgGg/AkJNRFlk8=; b=X8HLYHVSmKCeUW5bknmTvDa8Va
	DmlmPh7YJQCWKxdgs5V9Fn/u4dtwONXQBriSHIRWlIuNYQh0TZQmefr7xy3WGOvo1uz0Tmp2kH7ll
	4Myx4ZoOoUjtwR7ZzdmlvVD5wT8dCul6ZzSpCR0vrvV57c6UmdU5thDW0IrWfS5WSySU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175752-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175752: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:host-install(5):broken:regression
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=229ebd517b9df0e2d2f9e3ea50b57ca716334826
X-Osstest-Versions-That:
    xen=6bec713f871f21c6254a5783c1e39867ea828256
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Jan 2023 14:25:28 +0000

flight 175752 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175752/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 175746
 build-amd64                   6 xen-build                fail REGR. vs. 175746
 build-arm64-xsm               6 xen-build                fail REGR. vs. 175746

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  229ebd517b9df0e2d2f9e3ea50b57ca716334826
baseline version:
 xen                  6bec713f871f21c6254a5783c1e39867ea828256

Last test of basis   175746  2023-01-12 16:03:41 Z    0 days
Failing since        175748  2023-01-12 20:01:56 Z    0 days    2 attempts
Testing same since   175752  2023-01-13 07:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Julien Grall <jgrall@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          broken  
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

broken-job test-armhf-armhf-xl broken
broken-step test-armhf-armhf-xl host-install(5)

Not pushing.

------------------------------------------------------------
commit 229ebd517b9df0e2d2f9e3ea50b57ca716334826
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Jan 12 22:07:42 2023 +0000

    xen/arm: linker: The identitymap check should cover the whole .text.header
    
    At the moment, we are only checking that only some part of .text.header
    is part of the identity mapping. However, this doesn't take into account
    the literal pool which will be located at the end of the section.
    
    While we could try to avoid using a literal pool, in the near future we
    will also want to use an identity mapping for switch_ttbr().
    
    Not everything in .text.header requires to be part of the identity
    mapping. But it is below a page size (i.e. 4KB) so take a shortcut and
    check that .text.header is smaller than a page size.
    
    With that _end_boot can be removed as it is now unused. Take the
    opportunity to avoid assuming that a page size is always 4KB in the
    error message and comment.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 22a9981ba2443bd569bad6b772fb6e7e64f0d714
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Jan 12 22:06:42 2023 +0000

    xen/arm: linker: Indent correctly _stext
    
    _stext is indented by one space more compare to the lines. This doesn't
    seem warrant, so delete the extra space.
    
    Signed-off: Julien Grall <jgrall@amazon.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 3edca52ce736297d7fcf293860cd94ef62638052
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 9 10:58:31 2023 +0000

    x86/vmx: Support for CPUs without model-specific LBR
    
    Ice Lake (server at least) has both architectural LBR and model-specific LBR.
    Sapphire Rapids does not have model-specific LBR at all.  I.e. On SPR and
    later, model_specific_lbr will always be NULL, so we must make changes to
    avoid reliably hitting the domain_crash().
    
    The Arch LBR spec states that CPUs without model-specific LBR implement
    MSR_DBG_CTL.LBR by discarding writes and always returning 0.
    
    Do this for any CPU for which we lack model-specific LBR information.
    
    Adjust the now-stale comment, now that the Arch LBR spec has created a way to
    signal "no model specific LBR" to guests.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit e94af0d58f86c3a914b9cbbf4d9ed3d43b974771
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 9 11:42:22 2023 +0000

    x86/vmx: Calculate model-specific LBRs once at start of day
    
    There is no point repeating this calculation at runtime, especially as it is
    in the fallback path of the WRSMR/RDMSR handlers.
    
    Move the infrastructure higher in vmx.c to avoid forward declarations,
    renaming last_branch_msr_get() to get_model_specific_lbr() to highlight that
    these are model-specific only.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit e6ee01ad24b6a1c3b922579964deebb119a90a48
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jan 3 15:08:56 2023 +0000

    xen/version: Drop compat/kernel.c
    
    kernel.c is mostly in an #ifndef COMPAT guard, because compat/kernel.c
    re-includes kernel.c to recompile xen_version() in a compat form.
    
    However, the xen_version hypercall is almost guest-ABI-agnostic; only
    XENVER_platform_parameters has a compat split.  Handle this locally, and do
    away with the re-include entirely.  Also drop the CHECK_TYPE()'s between types
    that are simply char-arrays in their native and compat form.
    
    In particular, this removed the final instances of obfuscation via the DO()
    macro.
    
    No functional change.  Also saves 2k of of .text in the x86 build.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 73f0696dc1d31a987563184ce1d01cbf5d12d6ab
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Dec 20 15:51:07 2022 +0000

    public/version: Change xen_feature_info to have a fixed size
    
    This is technically an ABI change, but Xen doesn't operate in any environment
    where "unsigned int" is different to uint32_t, so switch to the explicit form.
    This avoids the need to derive (identical) compat logic for handling the
    subop.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

