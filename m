Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FF5F02FB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 04:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413990.658016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe66q-0006yY-Et; Fri, 30 Sep 2022 02:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413990.658016; Fri, 30 Sep 2022 02:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe66q-0006wO-C0; Fri, 30 Sep 2022 02:50:40 +0000
Received: by outflank-mailman (input) for mailman id 413990;
 Fri, 30 Sep 2022 02:50:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oe66o-0006wE-Ok; Fri, 30 Sep 2022 02:50:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oe66o-0005tK-M4; Fri, 30 Sep 2022 02:50:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oe66o-00051W-7Y; Fri, 30 Sep 2022 02:50:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oe66o-0000Yj-5Q; Fri, 30 Sep 2022 02:50:38 +0000
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
	bh=aF0AyUPaONcCqT7pDSBuV7ucZ4T0K+5DtLzlzaFJopg=; b=osxpjl2Gnp+9k97MHC53PoaUpE
	eoZk8qVWwiIaJ3gT4nIHINhP/jsO0XaTavV26lNbotOvw9WIY0ISJrRhWCm2nRrfpEABmLHXtEQfD
	2mlAFtmYScqKJD/Nz4yxIy+5EGEyu+GgFbVUX7cQwUY+kxaUEhE6MYjHImnHSDPiouyE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173375-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173375: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=fb7485788fd7db3b95f4e7fc9bfdfe9ef38e383f
X-Osstest-Versions-That:
    xen=211d8419ef8d8a237ff914fd8304b8fefc3ff2cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Sep 2022 02:50:38 +0000

flight 173375 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173375/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 173347

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  fb7485788fd7db3b95f4e7fc9bfdfe9ef38e383f
baseline version:
 xen                  211d8419ef8d8a237ff914fd8304b8fefc3ff2cc

Last test of basis   173347  2022-09-28 05:07:54 Z    1 days
Failing since        173362  2022-09-29 13:03:03 Z    0 days    4 attempts
Testing same since   173367  2022-09-29 17:01:55 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Dmytro Semenets <dmytro_semenets@epam.com>
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Nathan Studer <nathan.studer@dornerworks.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@dornerworks.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
commit fb7485788fd7db3b95f4e7fc9bfdfe9ef38e383f
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Thu Sep 29 10:51:31 2022 +0100

    automation: Information about running containers for a different arch
    
    Adding pointer to 'qemu-user-static'.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit a210e94af38a957fcc99db01d2cfcc3039859445
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Mon Sep 19 20:37:37 2022 +0200

    xen/arm: domain_build: Always print the static shared memory region
    
    At the moment, the information about allocating static shared memory
    region is only printed during the debug build. This information can also
    be helpful for the end user (which may not be the same as the person
    building the package), so switch to printk(). Also drop XENLOG_INFO to be
    consistent with other printk() used to print the domain information.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit b726541d94bd0a80b5864d17a2cd2e6d73a3fe0a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Sep 29 14:47:45 2022 +0200

    x86: wire up VCPUOP_register_vcpu_time_memory_area for 32-bit guests
    
    Forever sinced its introduction VCPUOP_register_vcpu_time_memory_area
    was available only to native domains. Linux, for example, would attempt
    to use it irrespective of guest bitness (including in its so called
    PVHVM mode) as long as it finds XEN_PVCLOCK_TSC_STABLE_BIT set (which we
    set only for clocksource=tsc, which in turn needs engaging via command
    line option).
    
    Fixes: a5d39947cb89 ("Allow guests to register secondary vcpu_time_info")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 9214da34a3cb017ff0417900250bd6d18ca89e15
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Sep 29 14:46:50 2022 +0200

    x86: re-connect VCPUOP_send_nmi for 32-bit guests
    
    With the "inversion" of VCPUOP handling, processing arch-specific ones
    first, the forwarding of this sub-op from the (common) compat handler to
    (common) non-compat one did no longer have the intended effect. It now
    needs forwarding between the arch-specific handlers.
    
    Fixes: 8a96c0ea7999 ("xen: move do_vcpu_op() to arch specific code")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit c4e5cc2ccc5b8274d02f7855c4769839989bb349
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Sep 29 14:44:10 2022 +0200

    x86/ept: limit calls to memory_type_changed()
    
    memory_type_changed() is currently only implemented for Intel EPT, and
    results in the invalidation of EMT attributes on all the entries in
    the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
    when the guest tries to access any gfns for the first time, which
    results in the recalculation of the EMT for the accessed page.  The
    vmexit and the recalculations are expensive, and as such should be
    avoided when possible.
    
    Remove the call to memory_type_changed() from
    XEN_DOMCTL_memory_mapping: there are no modifications of the
    iomem_caps ranges anymore that could alter the return of
    cache_flush_permitted() from that domctl.
    
    Encapsulate calls to memory_type_changed() resulting from changes to
    the domain iomem_caps or ioport_caps ranges in the helpers themselves
    (io{ports,mem}_{permit,deny}_access()), and add a note in
    epte_get_entry_emt() to remind that changes to the logic there likely
    need to be propagaed to the IO capabilities helpers.
    
    Note changes to the IO ports or memory ranges are not very common
    during guest runtime, but Citrix Hypervisor has an use case for them
    related to device passthrough.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 9982fe275ba4ee1a749b6dde5602a5a79e42b543
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Sep 29 14:41:13 2022 +0200

    arm/vgic: drop const attribute from gic_iomem_deny_access()
    
    While correct from a code point of view, the usage of the const
    attribute for the domain parameter of gic_iomem_deny_access() is at
    least partially bogus.  Contents of the domain structure (the iomem
    rangeset) is modified by the function.  Such modifications succeed
    because right now the iomem rangeset is allocated separately from
    struct domain, and hence is not subject to the constness of struct
    domain.
    
    Amend this by dropping the const attribute from the function
    parameter.
    
    This is required by further changes that will convert
    iomem_{permit,deny}_access into a function.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 0db195c1a9947240b354abbefd2afac6c73ad6a8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Sep 29 14:39:52 2022 +0200

    x86/NUMA: correct memnode_shift calculation for single node system
    
    SRAT may describe even a single node system (including such with
    multiple nodes, but only one having any memory) using multiple ranges.
    Hence simply counting the number of ranges (note that function
    parameters are mis-named) is not an indication of the number of nodes in
    use. Since we only care about knowing whether we're on a single node
    system, accounting for this is easy: Increment the local variable only
    when adjacent ranges are for different nodes. That way the count may
    still end up larger than the number of nodes in use, but it won't be
    larger than 1 when only a single node has any memory.
    
    To compensate populate_memnodemap() now needs to be prepared to find
    the correct node ID already in place for a range. (This could of course
    also happen when there's more than one node with memory, while at least
    one node has multiple adjacent ranges, provided extract_lsb_from_nodes()
    would also know to recognize this case.)
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit e1de23b7c1bfa02447a79733e64184b3635e0587
Author: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Date:   Thu Sep 29 14:38:22 2022 +0200

    MAINTAINERS: ARINC 653 scheduler maintainer updates
    
    Add Nathan Studer as co-maintainer.
    
    I am departing DornerWorks. I will still be working with Xen in my next
    role, and I still have an interest in co-maintaining the ARINC 653
    scheduler, so change to my personal email address.
    
    Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
    Acked-by: Nathan Studer <nathan.studer@dornerworks.com>

commit 3ab6ea992b0e5e1a332bdbc8ae56d72f1b66fcbd
Author: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Date:   Thu Sep 29 14:38:02 2022 +0200

    tools: remove xenstore entries on vchan server closure
    
    vchan server creates XenStore entries to advertise its event channel and
    ring, but those are not removed after the server quits.
    Add additional cleanup step, so those are removed, so clients do not try
    to connect to a non-existing server.
    
    Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
    Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
(qemu changes not included)

