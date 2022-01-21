Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA4495765
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 01:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259206.447221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAhrl-0000K2-FO; Fri, 21 Jan 2022 00:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259206.447221; Fri, 21 Jan 2022 00:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAhrl-0000GO-BD; Fri, 21 Jan 2022 00:33:21 +0000
Received: by outflank-mailman (input) for mailman id 259206;
 Fri, 21 Jan 2022 00:33:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAhrk-0000GD-5l; Fri, 21 Jan 2022 00:33:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAhrk-0005Pi-1v; Fri, 21 Jan 2022 00:33:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nAhrj-0003CV-OT; Fri, 21 Jan 2022 00:33:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nAhrj-00024o-Nz; Fri, 21 Jan 2022 00:33:19 +0000
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
	bh=DXEvH65eilotrHm9ATToT9Dkh0E8MINLvDg+Bis0d6w=; b=lZWk8jn+XzsJpeKV7pOrx9hj6i
	3LHk+7rxs8oGEcSDZYKZa+R22nX7dKzfyUo0lTVEHNm+K75XEzOXYiB8yR2wiyAPwSllPhJOkFJwY
	Z4F6FA9aOf5i1rIaSaddcTtbFXFbR673FrYpbwi8xthjJ7TwCVVzJX6LloBCEsiKDXNU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167764-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 167764: regressions - FAIL
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
    xen=0626219dcc6a4376c1a4b04209d6c15d06e23875
X-Osstest-Versions-That:
    xen=4e1df69cc9f51b2e017af1da3ed5b45917642115
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Jan 2022 00:33:19 +0000

flight 167764 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167764/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 167761

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0626219dcc6a4376c1a4b04209d6c15d06e23875
baseline version:
 xen                  4e1df69cc9f51b2e017af1da3ed5b45917642115

Last test of basis   167761  2022-01-20 14:00:29 Z    0 days
Testing same since   167764  2022-01-20 20:01:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

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
commit 0626219dcc6a4376c1a4b04209d6c15d06e23875
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 17 18:40:50 2022 +0000

    x86/hvm: Drop hvm_{get,set}_guest_bndcfgs() and use {get,set}_regs() instead
    
    hvm_{get,set}_guest_bndcfgs() are thin wrappers around accessing MSR_BNDCFGS.
    
    MPX was implemented on Skylake uarch CPUs and dropped in subsequent CPUs, and
    is disabled by default in Xen VMs.
    
    It would be nice to move all the logic into vmx_msr_{read,write}_intercept(),
    but the common HVM migration code uses guest_{rd,wr}msr().  Therefore, use
    {get,set}_regs() to reduce the quantity of "common" HVM code.
    
    In lieu of having hvm_set_guest_bndcfgs() split out, use some #ifdef
    CONFIG_HVM in guest_wrmsr().  In vmx_{get,set}_regs(), split the switch
    statements into two depending on whether the require remote VMCS acquisition
    or not.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 81f0eaadf84d273a6ff8df3660b874a02d0e7677
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 12 15:47:27 2022 +0000

    x86/spec-ctrl: Fix NMI race condition with VT-x MSR_SPEC_CTRL handling
    
    The logic was based on a mistaken understanding of how NMI blocking on vmexit
    works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general exits.
    Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handler path,
    and the guest's value will be clobbered before it is saved.
    
    Switch to using MSR load/save lists.  This causes the guest value to be saved
    atomically with respect to NMIs/MCEs/etc.
    
    First, update vmx_cpuid_policy_changed() to configure the load/save lists at
    the same time as configuring the intercepts.  This function is always used in
    remote context, so extend the vmx_vmcs_{enter,exit}() block to cover the whole
    function, rather than having multiple remote acquisitions of the same VMCS.
    
    Both of vmx_{add,del}_guest_msr() can fail.  The -ESRCH delete case is fine,
    but all others are fatal to the running of the VM, so handle them using
    domain_crash() - this path is only used during domain construction anyway.
    
    Second, update vmx_{get,set}_reg() to use the MSR load/save lists rather than
    vcpu_msrs, and update the vcpu_msrs comment to describe the new state
    location.
    
    Finally, adjust the entry/exit asm.
    
    Because the guest value is saved and loaded atomically, we do not need to
    manually load the guest value, nor do we need to enable SCF_use_shadow.  This
    lets us remove the use of DO_SPEC_CTRL_EXIT_TO_GUEST.  Additionally,
    SPEC_CTRL_ENTRY_FROM_PV gets removed too, because on an early entry failure,
    we're no longer in the guest MSR_SPEC_CTRL context needing to switch back to
    Xen's context.
    
    The only action remaining is to load Xen's MSR_SPEC_CTRL value on vmexit.  We
    could in principle use the host msr list, but is expected to complicated
    future work.  Delete DO_SPEC_CTRL_ENTRY_FROM_HVM entirely, and use a shorter
    code sequence to simply reload Xen's setting from the top-of-stack block.
    
    Adjust the comment at the top of spec_ctrl_asm.h in light of this bugfix.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 95b13fa43e0753b7514bef13abe28253e8614f62
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 12 16:36:29 2022 +0000

    x86/spec-ctrl: Drop SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
    
    These were written before Spectre/Meltdown went public, and there was large
    uncertainty in how the protections would evolve.  As it turns out, they're
    very specific to Intel hardware, and not very suitable for AMD.
    
    Drop the macros, opencoding the relevant subset of functionality, and leaving
    grep-fodder to locate the logic.  No change at all for VT-x.
    
    For AMD, the only relevant piece of functionality is DO_OVERWRITE_RSB,
    although we will soon be adding (different) logic to handle MSR_SPEC_CTRL.
    
    This has a marginal improvement of removing an unconditional pile of long-nops
    from the vmentry/exit path.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 6536688439dbca1d08fd6db5be29c39e3917fb2f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 12 13:52:47 2022 +0000

    x86/msr: Split MSR_SPEC_CTRL handling
    
    In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
    MSR_SPEC_CTRL handling into the new {pv,hvm}_{get,set}_reg() infrastructure.
    
    Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
    The SVM path is currently unreachable because of the CPUID policy.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 88d3ff7ab15da277a85b39735797293fb541c718
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 17 12:28:39 2022 +0000

    x86/guest: Introduce {get,set}_reg() infrastructure
    
    Various registers have per-guest-type or per-vendor locations or access
    requirements.  To support their use from common code, provide accessors which
    allow for per-guest-type behaviour.
    
    For now, just infrastructure handling default cases and expectations.
    Subsequent patches will start handling registers using this infrastructure.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

