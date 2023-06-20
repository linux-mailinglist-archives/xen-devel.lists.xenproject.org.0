Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD77361A8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 04:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551370.860882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRVw-0003XK-Sc; Tue, 20 Jun 2023 02:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551370.860882; Tue, 20 Jun 2023 02:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRVw-0003U3-Ns; Tue, 20 Jun 2023 02:54:40 +0000
Received: by outflank-mailman (input) for mailman id 551370;
 Tue, 20 Jun 2023 02:54:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBRVw-0003Tu-8d; Tue, 20 Jun 2023 02:54:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBRVw-0007Pf-0g; Tue, 20 Jun 2023 02:54:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBRVv-0006uP-La; Tue, 20 Jun 2023 02:54:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qBRVv-00025T-L7; Tue, 20 Jun 2023 02:54:39 +0000
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
	bh=so+b2xNK8C+NZGq4WNQmngz1OCWj29I7nxL9HwHXNko=; b=yrNkVbMp9SVaKbWoAyvjo3ugbK
	E81trz73IIDc+XfQgwqNAZhxiurjHJbP0a8ls5ZEtDKDIxTEXn+2QjplzoKPnrDQI015l6m4bjGIL
	CTjuwOQF9qfT1NDS/wF4VpzC3wHfGYByiVmho6b9W+IOn/63F0+m9Sow1ICOeZ0LsAZU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181509-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181509: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:host-install(4):broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=43e863a02d81f5fff32763b23d2a39f041f7e62b
X-Osstest-Versions-That:
    xen=7a25a1501ca941c3e01b0c4e624ace05417f1587
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Jun 2023 02:54:39 +0000

flight 181509 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181509/

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
 xen                  43e863a02d81f5fff32763b23d2a39f041f7e62b
baseline version:
 xen                  7a25a1501ca941c3e01b0c4e624ace05417f1587

Last test of basis   181476  2023-06-17 04:00:28 Z    2 days
Failing since        181504  2023-06-19 11:00:26 Z    0 days    2 attempts
Testing same since   181509  2023-06-19 18:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>

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

