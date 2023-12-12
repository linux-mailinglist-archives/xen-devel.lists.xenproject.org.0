Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4E80F4D3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 18:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653383.1019858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD6nF-0007Uv-6c; Tue, 12 Dec 2023 17:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653383.1019858; Tue, 12 Dec 2023 17:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD6nF-0007Rx-2j; Tue, 12 Dec 2023 17:43:41 +0000
Received: by outflank-mailman (input) for mailman id 653383;
 Tue, 12 Dec 2023 17:43:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD6nD-0007Qb-IG; Tue, 12 Dec 2023 17:43:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD6nD-0004Tg-Fo; Tue, 12 Dec 2023 17:43:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD6nD-0002Lj-8e; Tue, 12 Dec 2023 17:43:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rD6nD-0000z0-7w; Tue, 12 Dec 2023 17:43:39 +0000
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
	bh=gNeNhrcBdQxx4YPD0fqfwk4QQ1N5g2oZ/Tg4KHkQLsY=; b=Hp71PzR9JoMDAsHU0iJi5wH+wI
	pF/BtyUPZISPy+7sK08DpgU8/hOvppvRzSNGuNA6NHloXycBjRP4biMu+jwk9jPvVUkOHs1nBFc/3
	f4K1BKQ5NI6obod7aD/ithmasI+I+F4mRlLJxzbGCMkTKcEUTMqPuyaymChyjum2nIYc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184106-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184106: regressions - FAIL
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
    xen=7fca0463c71ca5a5b5ba853dbb000a54635c8899
X-Osstest-Versions-That:
    xen=cf40abbc7ff2a73eaaea84e919fc7762354e75ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Dec 2023 17:43:39 +0000

flight 184106 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184106/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 184102

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7fca0463c71ca5a5b5ba853dbb000a54635c8899
baseline version:
 xen                  cf40abbc7ff2a73eaaea84e919fc7762354e75ad

Last test of basis   184102  2023-12-12 11:00:28 Z    0 days
Testing same since   184106  2023-12-12 14:02:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Arnd Bergmann <arnd@arndb.de>
  Federico Serafini <federico.serafini@bugseng.com>
  George Dunlap <george.dunlap@cloud.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
commit 7fca0463c71ca5a5b5ba853dbb000a54635c8899
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Dec 12 14:05:19 2023 +0100

    xen/spinlock: make spinlock initializers more readable
    
    Use named member initializers instead of positional ones for the macros
    used to initialize structures.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a77fcbc3899526dcbb10571d01a289c53d124515
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Dec 12 14:04:47 2023 +0100

    xen/spinlock: reduce lock profile ifdefs
    
    With some small adjustments to the LOCK_PROFILE_* macros some #ifdefs
    can be dropped from spinlock.c.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 35431ecb9db8c925a595f652dfbd1d2641bd2ff0
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Tue Dec 12 14:04:22 2023 +0100

    xen/arm: smmu: move phys_addr_t definition to linux-compat.h
    
    Both smmu and smmu-v3 (ported from Linux) define the typedef name
    "phys_addr_t": move the type definition to the common header
    linux-compat.h to address violations of MISRA C:2012 Rule 5.6
    ("A typedef name shall be a unique identifier").
    No functional change.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Suggested-by: Julien Grall <julien@xen.org>
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 889af18eee001b73383406c4ba1706dd8baaf0a9
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Tue Dec 12 14:03:58 2023 +0100

    xen/sched: address MISRA C:2012 Rule 2.1
    
    The break statement after the return statement is definitely unreachable
    and can be removed with no functional change.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Acked-by: George Dunlap <george.dunlap@cloud.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit f0bb77bf734ed5833712205fb839ea03e98cadc7
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Tue Dec 12 14:03:33 2023 +0100

    AMD/IOMMU: address violations of MISRA C:2012 Rule 8.2
    
    Add missing parameter names to address violations of MISRA C:2012
    Rule 8.2. Remove trailing spaces and use C standard types to comply
    with XEN coding style. No functional change.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 6d5e94ca7dc1a121b94e44c1a2eee678f58c9b38
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Tue Dec 12 14:02:58 2023 +0100

    x86/mm: address violations of MISRA C:2012 Rule 8.2
    
    Add missing parameter names. No functional change.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit fbc8cff877e5e0243a7bef3fbbc9d06a269051e8
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Tue Dec 12 14:02:25 2023 +0100

    x86/mm: remove compat_subarch_memory_op()
    
    Remove remove compat_subarch_memory_op() declaration: there is no
    definition and there are no calls to such function in the XEN project.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 431ada87e574f004001193a4ad44dda435dd0361
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Tue Dec 12 14:01:56 2023 +0100

    xen/acpi: address violations of MISRA C:2012 Rule 8.2
    
    Add missing parameter names. No functional change.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 190b7f49af6487a9665da63d43adc9d9a5fbd01e
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Thu Nov 23 15:53:02 2023 +0100

    xen/arm: page: Avoid pointer overflow on cache clean & invalidate
    
    On Arm32, after cleaning and invalidating the last dcache line of the top
    domheap page i.e. VA = 0xfffff000 (as a result of flushing the page to
    RAM), we end up adding the value of a dcache line size to the pointer
    once again, which results in a pointer arithmetic overflow (with 64B line
    size, operation 0xffffffc0 + 0x40 overflows to 0x0). Such behavior is
    undefined and given the wide range of compiler versions we support, it is
    difficult to determine what could happen in such scenario.
    
    Modify clean_and_invalidate_dcache_va_range() as well as
    clean_dcache_va_range() and invalidate_dcache_va_range() due to similarity
    of handling to prevent pointer arithmetic overflow. Modify the loops to
    use an additional variable to store the index of the next cacheline.
    Add an assert to prevent passing a region that wraps around which is
    illegal and would end up in a page fault anyway (region 0-2MB is
    unmapped). Lastly, return early if size passed is 0.
    
    Note that on Arm64, we don't have this problem given that the max VA
    space we support is 48-bits.
    
    This is XSA-447 / CVE-2023-46837.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 0fb4b6b0ea8505fbd4888faa440212e878002494
Author: Henry Wang <Henry.Wang@arm.com>
Date:   Fri Dec 8 00:20:36 2023 +0800

    MAINTAINERS: Hand over the release manager role to Oleksii Kurochko
    
    I've finished the opportunity to do two releases (4.17 and 4.18)
    and Oleksii Kurochko has volunteered to be the next release manager.
    Hand over the role to him by changing the maintainership of the
    CHANGELOG.md.
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 6619c6f8913a8c7b2b980dd49a430c62ce6ce5ab
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Dec 11 14:16:16 2023 +0100

    xen: remove asm/unaligned.h
    
    With include/xen/unaligned.h now dealing properly with unaligned
    accesses for all architectures, asm/unaligned.h can be removed and
    users can be switched to include xen/unaligned.h instead.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 6c4be4950391d77b78e824d41115def397dbc487
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Dec 11 14:16:15 2023 +0100

    xen: make include/xen/unaligned.h usable on all architectures
    
    Instead of defining get_unaligned() and put_unaligned() in a way that
    is only supporting architectures allowing unaligned accesses, use the
    same approach as the Linux kernel and let the compiler do the
    decision how to generate the code for probably unaligned data accesses.
    
    Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
    the Linux kernel.
    
    The generated code has been checked to be the same on x86.
    
    Modify the Linux variant to not use underscore prefixed identifiers,
    avoid unneeded parentheses and drop the 24-bit accessors.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 803f4e1eab7a
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 3e3ff7f9cddfeb3d972bd20c4e0be5e08c6b3dcb
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Dec 11 14:16:14 2023 +0100

    xen/arm: set -mno-unaligned-access compiler option for Arm32
    
    As the hypervisor is disabling unaligned accesses for Arm32, set the
    -mno-unaligned-access compiler option for building. This will prohibit
    unaligned accesses when e.g. accessing 2- or 4-byte data items in
    packed data structures.
    
    Backport: 4.15+
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

