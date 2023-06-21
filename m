Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24A738259
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 13:38:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552674.862879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBwAD-0005Bj-2P; Wed, 21 Jun 2023 11:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552674.862879; Wed, 21 Jun 2023 11:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBwAC-00059Z-Ve; Wed, 21 Jun 2023 11:38:16 +0000
Received: by outflank-mailman (input) for mailman id 552674;
 Wed, 21 Jun 2023 11:38:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBwAA-00059I-Rh; Wed, 21 Jun 2023 11:38:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBwAA-0005Vr-Kw; Wed, 21 Jun 2023 11:38:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBwAA-0002ud-BA; Wed, 21 Jun 2023 11:38:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qBwAA-00077n-AR; Wed, 21 Jun 2023 11:38:14 +0000
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
	bh=Kn3G7jNmSSnGiqyiLE+Hr9J4GbfOnagq+2HJMYHtwFg=; b=X2uVxBdrOg6oGmMdV3xx/8jb0D
	tKlBAaLO5OlvjVttiUWMfBFIxXP9dWM0acCiZBVa9vmXT8ExbGiObKS2UCk1vSSSQVtv3Ou5wHD2L
	kqHKMkFWnB+Tt/6Jabz0BidFjqLf3WdgLD3EZx9RsebindvRBLuCeuWZcqbwOGgoJjWM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181532-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181532: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:host-install(4):broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a6120e3fc8fd90f3ed638c6f7a573bfb534af154
X-Osstest-Versions-That:
    xen=7a25a1501ca941c3e01b0c4e624ace05417f1587
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Jun 2023 11:38:14 +0000

flight 181532 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181532/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 181476

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a6120e3fc8fd90f3ed638c6f7a573bfb534af154
baseline version:
 xen                  7a25a1501ca941c3e01b0c4e624ace05417f1587

Last test of basis   181476  2023-06-17 04:00:28 Z    4 days
Failing since        181504  2023-06-19 11:00:26 Z    2 days    6 attempts
Testing same since   181527  2023-06-20 21:00:31 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  broken  
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

broken-job build-armhf broken
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit a6120e3fc8fd90f3ed638c6f7a573bfb534af154
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed May 10 20:21:12 2023 +0100

    x86: Use printk_once() instead of opencoding it
    
    Technically our helper post-dates all of these examples, but it's good cleanup
    nevertheless.  None of these examples should be using fully locked
    test_and_set_bool() in the first place.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit e5ba5165cae654f4bb5023b74008f57b5649979d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 13 17:06:47 2023 +0100

    xen/evtchn: Purge ERROR_EXIT{,_DOM}()
    
    These interfere with code legibility by hiding control flow.  Expand and drop
    them.
    
     * Rearrange the order of actions to write into rc, then render rc in the
       gdprintk().
     * Drop redundant "rc = rc" assignments
     * Switch to using %pd for rendering domains
    
    As a side effect, this fixes several violations of MISRA rule 2.1 (dead code -
    the while() following a goto).
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 42473bae2394b6602372ab8b83a9ca294b1e40f4
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Jun 7 11:27:27 2023 +0200

    xen/arm: pl011: Add SBSA UART device-tree support
    
    We already have all the bits necessary in PL011 driver to support SBSA
    UART thanks to commit 032ea8c736d10f02672863c6e369338f948f7ed8 that
    enabled it for ACPI. Plumb in the remaining part for device-tree boot:
     - add arm,sbsa-uart compatible to pl011_dt_match (no need for a separate
       struct and DT_DEVICE_START as SBSA is a subset of PL011),
     - from pl011_dt_uart_init(), check for SBSA UART compatible to determine
       the UART type in use.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Tested-by: Henry Wang <Henry.Wang@arm.com>

commit 47e3941d2eee347e9c41b311d19048c41e1b33e3
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Jun 7 11:27:26 2023 +0200

    xen/arm: pl011: Use correct accessors
    
    At the moment, we use 32-bit only accessors (i.e. readl/writel) to match
    the SBSA v2.x requirement. This should not be the default case for normal
    PL011 where accesses shall be 8/16-bit (max register size is 16-bit).
    There are however implementations of this UART that can only handle 32-bit
    MMIO. This is advertised by dt property "reg-io-width" set to 4.
    
    Introduce new struct pl011 member mmio32 and replace pl011_{read/write}
    macros with static inline helpers that use 32-bit or 16-bit accessors
    (largest-common not to end up using different ones depending on the actual
    register size) according to mmio32 value. By default this property is set
    to false, unless:
     - reg-io-width is specified with value 4,
     - SBSA UART is in use.
    
    For now, no changes done for ACPI due to lack of testing possibilities
    (i.e. current behavior maintained resulting in 32-bit accesses).
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Tested-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 4fa2272458114b5e4872f835b803909333d5ccd4
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Jun 7 11:27:25 2023 +0200

    xen/arm: debug-pl011: Add support for 32-bit only MMIO
    
    There are implementations of PL011 that can only handle 32-bit accesses
    as oppose to the normal behavior where accesses are 8/16-bit wide. This
    is usually advertised by setting a dt property 'reg-io-width' to 4.
    
    Introduce CONFIG_EARLY_UART_PL011_MMIO32 Kconfig option to be able to
    enable the use of 32-bit only accessors in PL011 early printk code.
    Define macros PL011_{STRH,STRB,LDRH} to distinguish accessors for normal
    case from 32-bit MMIO one and use them in arm32/arm64 pl011 early printk
    code.
    
    Update documentation accordingly.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Tested-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 655d0798d29b7ac490444b2daf9bffa16d41e822
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Wed Jun 7 11:27:24 2023 +0200

    xen/arm: debug-pl011: Use correct accessors
    
    Although most PL011 UARTs can cope with 32-bit accesses, some of the old
    legacy ones might not. PL011 registers are 8/16-bit wide and this shall
    be perceived as the normal behavior.
    
    Modify early printk pl011 code for arm32/arm64 to use the correct
    accessors depending on the register size (refer ARM DDI 0183G, Table 3.1).
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Tested-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 314a54c1c2805883f50582c40308554a102fdb8a
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Thu Jun 15 14:27:16 2023 -0700

    xen/misra: add rules 1.4 and 2.1
    
    Also add a comment at the top of the file to say rules.rst could be
    changed.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

commit d95f436c7dc6ccee68e1b77a3b01476ef41add55
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Thu Jun 15 14:19:22 2023 -0700

    docs/misra: new rules addition
    
    For Dir 1.1, a document describing all implementation-defined behaviour
    (i.e. gcc-specific behavior) will be added to docs/misra, also including
    implementation-specific (gcc-specific) appropriate types for bit-field
    relevant to Rule 6.1.
    
    Rule 21.21 is lacking an example on gitlab but the rule is
    straightforward: we don't use stdlib at all in Xen.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 43e863a02d81f5fff32763b23d2a39f041f7e62b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 16 17:28:21 2023 +0100

    x86/boot: Clean up early error asm
    
    The asm forming early error handling is a mix of local and non-local symbols,
    and has some pointless comments.  Drop the "# Error message" comments,
    tweaking the style on modified lines, and make the symbols local.
    
    However, leave behind one real symbol so this logic disassembles nicely
    without merging in to acpi_boot_init(), which is the thing that happens to be
    immediately prior in my build.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 3a07da55e63d110851c36b0dae32a5dcf00c54b9
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Mon Jun 19 15:47:37 2023 +0200

    xen/riscv: introduce reset_stack() function
    
    The reason for reset_stack() introduction is that stack should be
    reset twice:
    1. Before jumping to C world at the start of _start() function.
    2. After jumping from 1:1 mapping world.
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

commit 652ccd1f4afa56b15cb4863d545deac7d1effb30
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Mon Jun 19 15:47:23 2023 +0200

    xen/riscv: add .sbss section to .bss
    
    Sometimes variables are located in .sbss section but it won't
    be mapped after MMU will be enabled.
    To avoid MMU failures .sbss should be mapped
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Alistair Francis <alistair.francis@wdc.com>

commit c6df21062beb9a9bc29a3a2ffb652e0bfa185c3a
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Mon Jun 19 15:47:05 2023 +0200

    Config.mk: update OVMF to edk2-stable202305
    
    Update to OVMF's latest stable tag.
    
    This is been prompt by trying to build Xen on Debian Bookworm,
    where edk2-stable202108 doesn't build. Also, it's been too long since
    the last update.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 82b28deb25f37e8422b14493a2efa2852638206d
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Jun 19 15:46:03 2023 +0200

    iommu/vtd: fix address translation for leaf entries
    
    Fix two issues related to leaf address lookups in VT-d:
    
    * When translating an address that falls inside of a superpage in the
      IOMMU page tables the fetching of the PTE value wasn't masking of the
      contiguous related data, which caused the returned data to be
      corrupt as it would contain bits that the caller would interpret as
      part of the address.
    
    * When the requested leaf address wasn't mapped by a superpage the
      returned value wouldn't have any of the low 12 bits set, thus missing
      the permission bits expected by the caller.
    
    Take the opportunity to also adjust the function comment to note that
    when returning the full PTE the bits above PADDR_BITS are removed.
    
    Fixes: c71e55501a61 ('VT-d: have callers specify the target level for page table walks')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit ea613d2367ac9dca3875997034e8f4aff74ab635
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Jun 19 15:45:07 2023 +0200

    SUPPORT.md: write down restriction of 32-bit tool stacks
    
    Let's try to avoid giving the impression that 32-bit tool stacks are as
    capable as 64-bit ones.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit a17fd0feb6b6bbe82550f43d70654d894ed377ec
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Mon Jun 19 10:09:32 2023 +0100

    automation: Disable QEMU build with Clang older than 10.0
    
    Since QEMU commit 74a1b256d775 ("configure: Bump minimum Clang version
    to 10.0"), or QEMU v8.0, Clang 10.0 is now the minimum to build QEMU.
    
    QEMU 8.0 fails to build on Ubuntu Bionic.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

