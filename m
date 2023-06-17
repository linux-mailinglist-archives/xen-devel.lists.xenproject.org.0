Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963EC733DDD
	for <lists+xen-devel@lfdr.de>; Sat, 17 Jun 2023 05:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550573.859673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAMue-00023N-J9; Sat, 17 Jun 2023 03:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550573.859673; Sat, 17 Jun 2023 03:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAMue-00021Y-De; Sat, 17 Jun 2023 03:47:44 +0000
Received: by outflank-mailman (input) for mailman id 550573;
 Sat, 17 Jun 2023 03:47:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAMuc-00021O-UQ; Sat, 17 Jun 2023 03:47:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAMuc-0007oF-Ry; Sat, 17 Jun 2023 03:47:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAMuc-00039N-HP; Sat, 17 Jun 2023 03:47:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qAMuc-0002Sn-Gk; Sat, 17 Jun 2023 03:47:42 +0000
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
	bh=WcSgY2bxYLRJ9/qEZD+BFptGKz+6T2LTvrKAno5jbBY=; b=AOclPELj15J1f2/y5Uw/bBJWqK
	vmOyKA6tc8g8Knq4WXnnn2m3XAzkG9iOtpMkN6XZDUzxQSOy9yWI6X6XZkevKjZAdBQ9mFjuWuyW8
	z/Fd3f3Xzp6C/eQRSBFIWVQ4AoquAkAB+eZ5UwDtFV6LavjLECsgO+nlYefHIBMxrRUQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181473-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181473: trouble: broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:host-install(5):broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=7a25a1501ca941c3e01b0c4e624ace05417f1587
X-Osstest-Versions-That:
    xen=e533438e3d28158602dce051b032811bdd26377d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Jun 2023 03:47:42 +0000

flight 181473 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181473/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 181467

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7a25a1501ca941c3e01b0c4e624ace05417f1587
baseline version:
 xen                  e533438e3d28158602dce051b032811bdd26377d

Last test of basis   181467  2023-06-16 18:00:24 Z    0 days
Testing same since   181470  2023-06-16 21:08:31 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Julien Grall <jgrall@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          broken  
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

broken-job test-armhf-armhf-xl broken
broken-step test-armhf-armhf-xl host-install(5)

Not pushing.

------------------------------------------------------------
commit 7a25a1501ca941c3e01b0c4e624ace05417f1587
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Fri Jun 2 13:07:54 2023 +0100

    xen/arm: p2m: Enable support for 32bit IPA for ARM_32
    
    Refer ARM DDI 0406C.d ID040418, B3-1345,
    
    "A stage 2 translation with an input address range of 31-34 bits can
    start the translation either:
    
    - With a first-level lookup, accessing a first-level translation
      table with 2-16 entries.
    
    - With a second-level lookup, accessing a set of concatenated
      second-level translation tables"
    
    Thus, for 32 bit IPA, there will be no concatenated root level tables.
    So, the root-order is 0.
    
    Also, Refer ARM DDI 0406C.d ID040418, B3-1348
    "Determining the required first lookup level for stage 2 translations
    
    For a stage 2 translation, the output address range from the stage 1
    translations determines the required input address range for the stage 2
    translation. The permitted values of VTCR.SL0 are:
    0b00 Stage 2 translation lookup must start at the second level.
    0b01 Stage 2 translation lookup must start at the first level.
    
    VTCR.T0SZ must indicate the required input address range. The size of
    the input address region is 2^(32-T0SZ) bytes."
    
    Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = 0 when the size of
    input address region is 2^32 bytes.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 7c72147baa221cb49da80498bb0360c4d24a759f
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Fri Jun 2 13:07:53 2023 +0100

    xen/arm: Restrict zeroeth_table_offset for ARM_64
    
    When 32 bit physical addresses are used (ie PHYS_ADDR_T_32=y),
    "va >> ZEROETH_SHIFT" causes an overflow.
    Also, there is no zeroeth level page table on Arm32.
    
    Also took the opportunity to clean up dump_pt_walk(). One could use
    DECLARE_OFFSETS() macro instead of declaring an array of page table
    offsets.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit c3aabf7bd20eefa2c0fa297e53e087126ed9a06a
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Fri Jun 2 13:07:52 2023 +0100

    xen/arm: guest_walk: LPAE specific bits should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32"
    
    As the previous patch introduces CONFIG_PHYS_ADDR_T_32 to support 32 bit
    physical addresses, the code specific to "Large Physical Address Extension"
    (ie LPAE) should be enclosed within "ifndef CONFIG_PHYS_ADDR_T_32".
    
    Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
    unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
    unsigned int extbase2:4;    /* Extended base address, PA[39:36] */
    
    Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
    are supported.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit b6733ed0cb1d3a8c030cd46c93fce46a65255c35
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Fri Jun 2 13:07:51 2023 +0100

    xen/arm: Introduce choice to enable 64/32 bit physical addressing
    
    Some Arm based hardware platforms which does not support LPAE
    (eg Cortex-R52), uses 32 bit physical addresses.
    Also, users may choose to use 32 bits to represent physical addresses
    for optimization.
    
    To support the above use cases, we have introduced arch independent
    config to choose if the physical address can be represented using
    32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
    For now only ARM_32 provides support to enable 32 bit physical
    addressing.
    
    When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32. Note that we
    use "unsigned long" (not "uint32_t") to denote the datatype of physical
    address. This is done to avoid using a cast each time PAGE_* macros are
    used on paddr_t. For eg PAGE_SIZE is defined as unsigned long. Thus,
    each time PAGE_SIZE is used with paddr_t, the result will be
    "unsigned long".
    On 32-bit architecture, "unsigned long" is 32-bit wide. Thus, it can be
    used to denote physical address.
    
    When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
    For ARM_64, PADDR_BITS is set to 48.
    The last two are same as the current configuration used today on Xen.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 6d44fb48bd19c140f8601b645ea2a92895ce4ca9
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Fri Jun 2 13:07:50 2023 +0100

    xen/arm: p2m: Use the pa_range_info table to support arm32 and arm64
    
    Restructure the code so that one can use pa_range_info[] table for both
    arm32 as well as arm64.
    
    Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
    p2m_root_order can be obtained from the pa_range_info[].root_order and
    p2m_root_level can be obtained from pa_range_info[].sl0.
    
    Refer ARM DDI 0406C.d ID040418, B3-1345,
    "Use of concatenated first-level translation tables
    
    ...However, a 40-bit input address range with a translation granularity of 4KB
    requires a total of 28 bits of address resolution. Therefore, a stage 2
    translation that supports a 40-bit input address range requires two concatenated
    first-level translation tables,..."
    
    Thus, root-order is 1 for 40-bit IPA on arm32.
    
    Refer ARM DDI 0406C.d ID040418, B3-1348,
    
    "Determining the required first lookup level for stage 2 translations
    
    For a stage 2 translation, the output address range from the stage 1
    translations determines the required input address range for the stage 2
    translation. The permitted values of VTCR.SL0 are:
    
    0b00 Stage 2 translation lookup must start at the second level.
    0b01 Stage 2 translation lookup must start at the first level.
    
    VTCR.T0SZ must indicate the required input address range. The size of the input
    address region is 2^(32-T0SZ) bytes."
    
    Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size of input
    address region is 2^40 bytes.
    
    Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b which is 24.
    
    VTCR.T0SZ, is bits [5:0] for arm64.
    VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for arm32.
    
    For this, we have used struct bitfields to convert pa_range_info[].t0sz to its
    arm32 variant.
    
    pa_range_info[] is indexed by ID_AA64MMFR0_EL1.PARange which is present in Arm64
    only. This is the reason we do not specify the indices for arm32. Also, we
    duplicated the entry "{ 40,      24/*24*/,  1,          1 }" between arm64 and
    arm32. This is done to avoid introducing extra #if-defs.
    
    Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    [julien: Tweak some comments and one check]
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

