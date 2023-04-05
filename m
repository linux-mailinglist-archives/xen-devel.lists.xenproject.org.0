Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7A6D7CF5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 14:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518508.805142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2am-0004E4-Oy; Wed, 05 Apr 2023 12:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518508.805142; Wed, 05 Apr 2023 12:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2am-0004Ah-Ll; Wed, 05 Apr 2023 12:50:24 +0000
Received: by outflank-mailman (input) for mailman id 518508;
 Wed, 05 Apr 2023 12:50:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2al-0004AS-1m; Wed, 05 Apr 2023 12:50:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2ak-0008PD-Sa; Wed, 05 Apr 2023 12:50:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2ak-0003QK-LP; Wed, 05 Apr 2023 12:50:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2ak-0004p4-Ku; Wed, 05 Apr 2023 12:50:22 +0000
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
	bh=/40jwugWICvczquiRvorV8dIpJGVFD+rlTR5bFzBZpg=; b=cL+zKuInMtoVSnS9t9PizpvhTj
	vHjukMvJEjWmPbQ1SpfoYG7JDr9ddND4ywZF4l7sz+9t0x6zlggx4VHL4nJ5vnuq6w/hzc9Yg/7m5
	wgWE/99n5ZAIUI3hv959ULpOCgckwaNmMZ0QqRs6Q00BI4W690z+HwFkDHLrOxbnBxqg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180152-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180152: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=994c1553a158ada9db5ab64c9178a0d23c0a42ce
X-Osstest-Versions-That:
    xen=415f7d9404171cbc968b1ea22e7d3523ac2f3fc1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Apr 2023 12:50:22 +0000

flight 180152 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180152/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 180143

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  994c1553a158ada9db5ab64c9178a0d23c0a42ce
baseline version:
 xen                  415f7d9404171cbc968b1ea22e7d3523ac2f3fc1

Last test of basis   180143  2023-04-04 19:00:27 Z    0 days
Testing same since   180152  2023-04-05 11:02:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          starved 
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
commit 994c1553a158ada9db5ab64c9178a0d23c0a42ce
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Mar 29 13:07:03 2023 +0100

    x86: Remove temporary {cpuid,msr}_policy defines
    
    With all code areas updated, drop the temporary defines and adjust all
    remaining users.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 1b67fccf3b02825f6a036bad06cd17963d0972d2
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Apr 3 14:18:43 2023 +0100

    libx86: Update library API for cpu_policy
    
    Adjust the API and comments appropriately.
    
    x86_cpu_policy_fill_native() will eventually contain MSR reads, but leave a
    TODO in the short term.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a16dcd48c2db3f6820a15ea482551d289bd9cdec
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Apr 3 17:14:14 2023 +0100

    tools/fuzz: Rework afl-policy-fuzzer
    
    With cpuid_policy and msr_policy merged to form cpu_policy, merge the
    respective fuzzing logic.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 441b1b2a50ea3656954d75e06d42c96d619ea0fc
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Apr 3 20:03:57 2023 +0100

    x86/emul: Switch x86_emulate_ctxt to cpu_policy
    
    As with struct domain, retain cpuid as a valid alias for local code clarity.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 8eb56eb959a50bf9afd0fd590ec394e9145970a4
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Apr 3 19:06:02 2023 +0100

    x86/boot: Merge CPUID policy initialisation logic into cpu-policy.c
    
    Switch to the newer cpu_policy nomenclature.  Do some easy cleanup of
    includes.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 4f20f596ce9bd95bde077a1ae0d7e07d20a5f6be
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Apr 3 17:48:43 2023 +0100

    x86/boot: Move MSR policy initialisation logic into cpu-policy.c
    
    Switch to the newer cpu_policy nomenclature.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 1027df4c00823f8b448e3a6861cc7b6ce61ba4e4
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Mar 30 18:21:01 2023 +0100

    x86: Out-of-inline the policy<->featureset convertors
    
    These are already getting over-large for being inline functions, and are only
    going to grow further over time.  Out of line them, yielding the following net
    delta from bloat-o-meter:
    
      add/remove: 2/0 grow/shrink: 0/4 up/down: 276/-1877 (-1601)
    
    Switch to the newer cpu_policy terminology while doing so.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 66c5c99656314451ff9520f91cff5bb39fee9fed
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Mar 29 12:01:33 2023 +0100

    x86: Drop struct old_cpu_policy
    
    With all the complicated callers of x86_cpu_policies_are_compatible() updated
    to use a single cpu_policy object, we can drop the final user of struct
    old_cpu_policy.
    
    Update x86_cpu_policies_are_compatible() to take (new) cpu_policy pointers,
    reducing the amount of internal pointer chasing, and update all callers to
    pass their cpu_policy objects directly.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit c9985233ca663fea20fc8807cf509d2e3fef0dca
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Mar 29 12:37:33 2023 +0100

    x86: Merge xc_cpu_policy's cpuid and msr objects
    
    Right now, they're the same underlying type, containing disjoint information.
    
    Use a single object instead.  Also take the opportunity to rename 'entries' to
    'msrs' which is more descriptive, and more in line with nr_msrs being the
    count of MSR entries in the API.
    
    test-tsx uses xg_private.h to access the internals of xc_cpu_policy, so needs
    updating at the same time.  Take the opportunity to improve the code clarity
    by passing a cpu_policy rather than an xc_cpu_policy into some functions.
    
    No practical change.  This undoes the transient doubling of storage space from
    earlier patches.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit bd13dae34809e61e37ba1cd5de893c5c10c46256
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Mar 29 11:32:25 2023 +0100

    x86: Merge a domain's {cpuid,msr} policy objects
    
    Right now, they're the same underlying type, containing disjoint information.
    
    Drop the d->arch.msr pointer, and union d->arch.cpuid to give it a second name
    of cpu_policy in the interim.
    
    Merge init_domain_{cpuid,msr}_policy() into a single init_domain_cpu_policy(),
    moving the implementation into cpu-policy.c
    
    No practical change.  This undoes the transient doubling of storage space from
    earlier patches.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 6bc33366795d14a21a3244d0f3b63f7dccea87ef
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Mar 29 07:39:44 2023 +0100

    x86: Merge the system {cpuid,msr} policy objects
    
    Right now, they're the same underlying type, containing disjoint information.
    
    Introduce a new cpu-policy.{h,c} to be the new location for all policy
    handling logic.  Place the combined objects in __ro_after_init, which is new
    since the original logic was written.
    
    As we're trying to phase out the use of struct old_cpu_policy entirely, rework
    update_domain_cpu_policy() to not pointer-chase through system_policies[].
    
    This in turn allows system_policies[] in sysctl.c to become static and reduced
    in scope to XEN_SYSCTL_get_cpu_policy.
    
    No practical change.  This undoes the transient doubling of storage space from
    earlier patches.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 03812da3754d550dd8cbee7289469069ea6f0073
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 28 21:24:20 2023 +0100

    x86: Merge struct msr_policy into struct cpu_policy
    
    As with the cpuid side, use a temporary define to make struct msr_policy still
    work.
    
    Note, this means that domains now have two separate struct cpu_policy
    allocations with disjoint information, and system policies are in a similar
    position, as well as xc_cpu_policy objects in libxenguest.  All of these
    duplications will be addressed in the following patches.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 743e530380a007774017df9dc2d8cb0659040ee3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 28 18:55:19 2023 +0100

    x86: Rename struct cpuid_policy to struct cpu_policy
    
    Also merge lib/x86/cpuid.h entirely into lib/x86/cpu-policy.h
    
    Use a temporary define to make struct cpuid_policy still work.
    
    There's one forward declaration of struct cpuid_policy in
    tools/tests/x86_emulator/x86-emulate.h that isn't covered by the define, and
    it's easier to rename that now than to rearrange the includes.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 21e3ef57e0406b6b9a783f721f29df8f91a00f99
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 28 20:48:29 2023 +0100

    x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields
    
    These weren't great names to begin with, and using {leaves,msrs} matches up
    better with the existing nr_{leaves,msr} parameters anyway.
    
    Furthermore, by renaming these fields we can get away with using some #define
    trickery to avoid the struct {cpuid,msr}_policy merge needing to happen in a
    single changeset.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit c2ec94c370f211d73f336ccfbdb32499f1b05f82
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 28 20:31:33 2023 +0100

    x86: Rename struct cpu_policy to struct old_cpuid_policy
    
    We want to merge struct cpuid_policy and struct msr_policy together, and the
    result wants to be called struct cpu_policy.
    
    The current struct cpu_policy, being a pair of pointers, isn't terribly
    useful.  Rename the type to struct old_cpu_policy, but it will disappear
    entirely once the merge is complete.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

